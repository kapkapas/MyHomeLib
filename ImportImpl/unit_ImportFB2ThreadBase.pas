{******************************************************************************}
{                                                                              }
{ MyHomeLib                                                                    }
{                                                                              }
{ Version 0.9                                                                  }
{ 20.08.2008                                                                   }
{ Copyright (c) Aleksey Penkov  alex.penkov@gmail.com                          }
{                                                                              }
{ @author Nick Rymanov nrymanov@gmail.com                                      }
{                                                                              }
{******************************************************************************}

unit unit_ImportFB2ThreadBase;

interface

uses
  Classes,
  SysUtils,
  unit_WorkerThread,
  unit_globals,
  FictionBook_21,
  unit_database,
  files_list;

type
  TImportFB2ThreadBase = class(TWorker)
  private
    FFullNameSearch: Boolean;
  protected
    FDBFileName: string;
    FLibrary: TMHLLibrary;
    FFiles: TStringList;
    FRootPath: string;
    FFilesList: TFilesList;

    FTargetExt: string;
    FZipFolder: boolean;

    FCheckExistsFiles: Boolean;

    procedure ScanFolder;

    procedure ShowCurrentDir(Sender: TObject; const Dir: string);
    procedure AddFile2List(Sender: TObject;
                           const F: TSearchRec);

    function GetNewFolder(Folder: string; R: TBookRecord):string;
    function GetNewFileName(FileName: string; R: TBookRecord):string;
  protected
    procedure WorkFunction; override;
    procedure ProcessFileList; virtual; abstract;
    procedure GetBookInfo(book: IXMLFictionBook; var R: TBookRecord);
    procedure SortFiles(var R: TBookRecord); virtual;
  public
    property DBFileName: string read FDBFileName write FDBFileName;
    property TargetExt: string write FTargetExt;
    property ZipFolder: boolean write FZipFolder;
    property FullNameSearch: boolean write FFullNameSearch default False;
  end;

implementation

uses
  dm_user,
  unit_Settings,
  unit_Consts;

{ TImportFB2Thread }

procedure TImportFB2ThreadBase.AddFile2List(Sender: TObject; const F: TSearchRec);
var
  FileName: string;
begin
  if ExtractFileExt(F.Name) = FTargetExt then
  begin
    if FCheckExistsFiles then
    begin
      if Settings.EnableSort then
         FileName := FFilesList.LastDir + F.Name
      else
         FileName := ExtractRelativePath(FRootPath,FFilesList.LastDir) + F.Name;
      if FLibrary.CheckFileInCollection(FileName, FFullNameSearch, FZipFolder) then
        Exit;
    end;

    FFiles.Add(FFilesList.LastDir + F.Name);
  end;

  //
  // ������� ������ ������ ���������� => �������� ��������
  //
  SetProgress(FFiles.Count mod 100);

  if Canceled then
    Abort;

end;

procedure TImportFB2ThreadBase.GetBookInfo(book: IXMLFictionBook; var R: TBookRecord);
var
  i: integer;
begin
  with Book.Description.Titleinfo do
  begin
    for i := 0 to Author.Count - 1 do
      R.AddAuthor(Author[i].Lastname.Text, Author[i].Firstname.Text, Author[i].MiddleName.Text);

    if Booktitle.IsTextElement then
      R.Title := Booktitle.Text;

    for i := 0 to Genre.Count - 1 do
      R.AddGenreFB2('', Genre[i], '');

    R.Lang := Lang;
    R.KeyWords := KeyWords.Text;

    if Sequence.Count > 0 then
    begin
      try
        R.Series := Sequence[0].Name;
        R.SeqNumber := Sequence[0].Number;
      except
      end;
    end;
  end;
end;

procedure TImportFB2ThreadBase.ShowCurrentDir(Sender: TObject; const Dir: string);
begin
  SetComment(Format('��������� %s', [Dir]));
end;

procedure TImportFB2ThreadBase.SortFiles(var R: TBookRecord);
var
  NewFilename, NewFolder: string;
begin
  NewFolder := GetNewFolder(Settings.FB2FolderTemplate, R);

  CreateFolders(FRootPath,NewFolder);
  CopyFile(Settings.InputFolder + R.FileName + R.FileExt,
           FRootPath + NewFolder + R.FileName + R.FileExt);
  R.Folder := NewFolder;

  NewFileName := GetNewFileName(Settings.FB2FileTemplate, R);
  if NewFileName <> '' then
  begin
    RenameFile(FRootPath + NewFolder + R.FileName + R.FileExt,
               FRootPath + NewFolder + NewFileName + R.FileExt);
    R.FileName := NewFileName;
  end;
end;

function TImportFB2ThreadBase.GetNewFileName(FileName: string; R: TBookRecord): string;
var
  z, p1, p2: integer;
begin
  z := R.SeqNumber;
  if z > 0 then
      StrReplace('%n',Format('%.2d',[z]), FileName)
  else begin
      p1 := pos('%n',FileName);
      StrReplace('%n', '#n', FileName);
      p2 := pos('%', FileName);
      if p2 > 3 then
        Delete(FileName, p1, p2 - p1 - 1)
      else
        StrReplace('#n', '', FileName);
  end;

  StrReplace('%fl', copy(R.Authors[0].FLastName,1,1), FileName);
  StrReplace('%f', R.Authors[0].GetFullName, FileName);
  StrReplace('%t', trim(R.Title), FileName);
  StrReplace('%g', Trim(FLibrary.GetGenreAlias(R.Genres[0].GenreFb2Code)), FileName);
  StrReplace('%rg', Trim(FLibrary.GetTopGenreAlias(R.Genres[0].GenreFb2Code)), FileName);
  StrReplace('%s', R.Series, FileName);

  FileName := CheckSymbols(FileName);
  if FileName <> '' then
    Result := FileName
  else
    Result := '';
end;

function TImportFB2ThreadBase.GetNewFolder(Folder: string; R: TBookRecord): string;
begin
  StrReplace('%fl', copy(R.Authors[0].FLastName,1,1), Folder);
  StrReplace('%f', R.Authors[0].GetFullName, Folder);
  StrReplace('%t', trim(R.Title), Folder);
  StrReplace('%g', Trim(FLibrary.GetGenreAlias(R.Genres[0].GenreFb2Code)), Folder);
  StrReplace('%rg', Trim(FLibrary.GetTopGenreAlias(R.Genres[0].GenreFb2Code)), Folder);
  StrReplace('%s', R.Series, Folder);

  Folder := CheckSymbols(Folder);
  if Folder <> '' then
    Result := IncludeTrailingPathDelimiter(Folder)
  else
    Result := '';
end;

procedure TImportFB2ThreadBase.ScanFolder;
begin
  SetProgress(0);
  SetComment('���������...');
  Teletype('������������ �����...');

  FCheckExistsFiles := Settings.CheckExistsFiles;

  FFilesList := TFilesList.Create(nil);
  FFilesList.OnFile := AddFile2List;
  try
    if not Settings.EnableSort then
        FFilesList.TargetPath := IncludeTrailingPathDelimiter(DMUser.ActiveCollection.RootFolder)
      else
        FFilesList.TargetPath := IncludeTrailingPathDelimiter(Settings.InputFolder);

    FFilesList.OnDirectory := ShowCurrentDir;
    try
      FFilesList.Process;
    except
      on EAbort do {nothing};
    end;
  finally
    FreeAndNil(FFilesList);
  end;
end;

procedure TImportFB2ThreadBase.WorkFunction;
begin
  FRootPath := IncludeTrailingPathDelimiter(DMUser.ActiveCollection.RootFolder);

  FLibrary := TMHLLibrary.Create(nil);
  try
    FLibrary.DatabaseFileName := DMUser.ActiveCollection.DBFileName;
    FLibrary.Active := True;

    FFiles := TStringList.Create;
    try
      ScanFolder;
      
      if Canceled then
        Exit;

      FLibrary.BeginBulkOperation;
      try
        ProcessFileList;
      finally
        FLibrary.EndBulkOperation;
      end;
    finally
      FreeAndNil(FFiles);
    end;
  finally
    FreeAndNil(FLibrary);
  end;
end;

end.

