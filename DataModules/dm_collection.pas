unit dm_collection;

interface

uses
  SysUtils, Classes, ABSMain, DB, unit_globals;

type
  TDMCollection = class(TDataModule)
    DBCollection: TABSDatabase;
    dsAuthors: TDataSource;
    dsBooksA: TDataSource;
    tblBooksA: TABSTable;
    tblBooksG: TABSTable;
    tblGenres: TABSTable;
    dsGenres: TDataSource;
    dsBooksG: TDataSource;
    tblAuthorsS: TABSTable;
    tblBooksS: TABSTable;
    dsSeries: TDataSource;
    dsAuthorsS: TDataSource;
    dsBooksS: TDataSource;        
    tblAuthorsSID: TAutoIncField;
    tblAuthorsSFamily: TWideStringField;
    tblAuthorsSName: TWideStringField;
    tblAuthorsSFullName: TWideStringField;
    tblBooksAID: TAutoIncField;
    tblBooksASerID: TIntegerField;
    tblBooksASeqNumber: TSmallintField;
    tblBooksADate: TDateField;
    tblBooksATitle: TWideStringField;
    tblBooksAFullName: TWideStringField;
    tblBooksASeries: TWideStringField;
    tblBooksARate: TIntegerField;
    tblBooksALibID: TIntegerField;
    tblBooksAInsideNo: TIntegerField;
    tblBooksAFileName: TWideStringField;
    tblBooksAext: TWideStringField;
    tblBooksASize: TIntegerField;
    tblBooksACode: TSmallintField;
    tblBooksAFolder: TWideStringField;
    tblBooksADiscID: TIntegerField;
    tblBooksALocal: TBooleanField;
    tblBooksADeleted: TBooleanField;
    tblGenresID: TAutoIncField;
    tblGenresCode: TWideStringField;
    tblGenresParentCode: TWideStringField;
    tblGenresFB2Code: TWideStringField;
    tblGenresAlias: TWideStringField;
    tblBooks_Genre_List: TABSTable;
    dsBook_Genre_List: TDataSource;
    dsBooks_Genres: TDataSource;
    tblGenre_List: TABSTable;
    dsGenre_List: TDataSource;
    tblBooksSID: TAutoIncField;
    tblBooksSSerID: TIntegerField;
    tblBooksSSeqNumber: TSmallintField;
    tblBooksSDate: TDateField;
    tblBooksSTitle: TWideStringField;
    tblBooksSSeries: TWideStringField;
    tblBooksSFullName: TWideStringField;
    tblBooksSRate: TIntegerField;
    tblBooksSLibID: TIntegerField;
    tblBooksSInsideNo: TIntegerField;
    tblBooksSFileName: TWideStringField;
    tblBooksSext: TWideStringField;
    tblBooksSSize: TIntegerField;
    tblBooksSCode: TSmallintField;
    tblBooksSFolder: TWideStringField;
    tblBooksSDiscID: TIntegerField;
    tblBooksSLocal: TBooleanField;
    tblBooksSDeleted: TBooleanField;
    tblBooksGID: TAutoIncField;
    tblBooksGSerID: TIntegerField;
    tblBooksGSeqNumber: TSmallintField;
    tblBooksGDate: TDateField;
    tblBooksGTitle: TWideStringField;
    tblBooksGSeries: TWideStringField;
    tblBooksGFullName: TWideStringField;
    tblBooksGRate: TIntegerField;
    tblBooksGLibID: TIntegerField;
    tblBooksGInsideNo: TIntegerField;
    tblBooksGFileName: TWideStringField;
    tblBooksGext: TWideStringField;
    tblBooksGSize: TIntegerField;
    tblBooksGCode: TSmallintField;
    tblBooksGFolder: TWideStringField;
    tblBooksGDiscID: TIntegerField;
    tblBooksGLocal: TBooleanField;
    tblBooksGDeleted: TBooleanField;
    tblAuthor_List: TABSTable;
    dsAuthor_List: TDataSource;
    tblBooks: TABSTable;
    tblSeriesA: TABSTable;
    dsBooks: TDataSource;
    tblBooks_Genres: TABSTable;
    tblAuthor_ListID: TAutoIncField;
    tblAuthor_ListAuthID: TIntegerField;
    tblAuthor_ListBookID: TIntegerField;
    tblAuthor_ListSeries: TWideStringField;
    tblAuthor_ListTitle: TWideStringField;
    tblBooks_Genre_ListID: TAutoIncField;
    tblBooks_Genre_ListGenreCode: TWideStringField;
    tblBooks_Genre_ListBookID: TIntegerField;
    tblBooks_Genre_ListFamily: TWideStringField;
    tblBooks_Genre_ListSeries: TWideStringField;
    tblBooks_Genre_ListTitle: TWideStringField;
    tblGenre_ListID: TAutoIncField;
    tblGenre_ListGenreCode: TWideStringField;
    tblGenre_ListBookID: TIntegerField;
    tblGenre_ListFamily: TWideStringField;
    tblGenre_ListSeries: TWideStringField;
    tblGenre_ListTitle: TWideStringField;
    tblAuthor_Detail: TABSTable;
    tblAuthor_Master: TABSTable;
    tblAuthor_MasterID: TAutoIncField;
    tblAuthor_MasterAuthID: TIntegerField;
    tblAuthor_MasterBookID: TIntegerField;
    tblAuthor_MasterSeries: TWideStringField;
    tblAuthor_MasterTitle: TWideStringField;
    dsAuthor_Detail: TDataSource;
    dsAuthor_Master: TDataSource;
    tblAuthor_DetailID: TAutoIncField;
    tblAuthor_DetailFamily: TWideStringField;
    tblAuthor_DetailName: TWideStringField;
    tblAuthor_DetailMiddle: TWideStringField;
    tblAuthor_DetailFullName: TWideStringField;
    tblBooks_GenresID: TAutoIncField;
    tblBooks_GenresCode: TWideStringField;
    tblBooks_GenresParentCode: TWideStringField;
    tblBooks_GenresFB2Code: TWideStringField;
    tblBooks_GenresAlias: TWideStringField;
    tblBooksID: TAutoIncField;
    tblBooksSerID: TIntegerField;
    tblBooksSeqNumber: TSmallintField;
    tblBooksDatabaseID: TIntegerField;
    tblBooksLibID: TIntegerField;
    tblBooksDate: TDateField;
    tblBooksTitle: TWideStringField;
    tblBooksFullName: TWideStringField;
    tblBooksInsideNo: TIntegerField;
    tblBooksFileName: TWideStringField;
    tblBooksExt: TWideStringField;
    tblBooksSize: TIntegerField;
    tblBooksCode: TSmallintField;
    tblBooksFolder: TWideStringField;
    tblBooksDiscID: TIntegerField;
    tblBooksLocal: TBooleanField;
    tblBooksDeleted: TBooleanField;
    tblSeriesAID: TAutoIncField;
    tblSeriesAAuthID: TIntegerField;
    tblSeriesAGenreCode: TWideStringField;
    tblSeriesATitle: TWideStringField;
    tblSeriesB: TABSTable;
    AutoIncField1: TAutoIncField;
    IntegerField1: TIntegerField;
    WideStringField1: TWideStringField;
    WideStringField2: TWideStringField;
    tblBooksSeries: TWideStringField;
    dsSeries_List: TDataSource;
    tblSeries_List: TABSTable;
    tblSeries_ListID: TAutoIncField;
    tblSeries_ListSerID: TIntegerField;
    tblSeries_ListBookID: TIntegerField;
    tblSeries_ListTitle: TWideStringField;
    tblExtra: TABSTable;
    tblExtraID: TAutoIncField;
    tblExtraBookID: TIntegerField;
    tblExtraKeyWords: TWideStringField;
    tblExtraAnnotation: TMemoField;
    tblExtraCover: TBlobField;
    tblExtraData: TMemoField;
    tblAuthors: TABSQuery;
    tblAuthorsID: TAutoIncField;
    tblAuthorsFamily: TWideStringField;
    tblAuthorsName: TWideStringField;
    tblAuthorsMiddle: TWideStringField;
    tblAuthorsFullName: TWideStringField;
    tblSeries: TABSQuery;
    tblSeriesID: TAutoIncField;
    tblSeriesAuthID: TIntegerField;
    tblSeriesTitle: TWideStringField;
    tblSeriesGenreCode: TWideStringField;
    tblBooksRate: TIntegerField;
    tblBooksAProgress: TSmallintField;
    tblBooksSProgress: TSmallintField;
    tblBooksGProgress: TSmallintField;
    tblBooksProgress: TSmallintField;
  private
    FActiveTable: TAbsTable;
    { Private declarations }
  public
    procedure GetBookFileName(ID: integer; out AFile, AFolder, AExt: string;
      out ANo: integer);

    procedure SetActiveTable(Tag: integer);
    procedure GetCurrentBook(var R: TBookRecord);
    function GetBookGenres(BookID: Integer; FirstOnly: boolean): String;
    function GetBookAuthor(BookID: Integer): string;

    procedure FieldByName(AID: integer; AField: String; out ARes: String); overload;
    procedure FieldByName(AID: integer; AField: String; out ARes: integer); overload;
    procedure FieldByName(AID: integer; AField: String; out Ares: boolean); overload;

    procedure GetBookFolder(ID: integer; out AFolder: String);
    procedure SetLocalStatus(AId: integer; AState: boolean);

    procedure GetStatistics(out AuthorsCount: Integer; out BooksCount: Integer; out SeriesCount: Integer);
    property ActiveTable: TabsTable read FActiveTable;

    procedure Clear;
    procedure SetTableState(State: boolean);

  end;

var
  DMCollection: TDMCollection;

implementation

uses
  Windows,
  Forms,
  dm_user,
  frm_main,
  StrUtils,
  unit_Consts,
  unit_Messages;

{$R *.dfm}

{ TDMMain }

procedure TDMCollection.FieldByName(AID: integer; AField: String; out ARes: String);
begin
  if AID<> 0 then FActiveTable.Locate('ID', AID, []);
  ARes := FActiveTable.FieldByName(AField).AsString;
end;

procedure TDMCollection.FieldByName(AID: integer; AField: String; out ARes: integer);
begin
  if AID<> 0 then FActiveTable.Locate('ID', AID, []);
  ARes := FActiveTable.FieldByName(AField).AsInteger;
end;

procedure TDMCollection.Clear;
begin
  SetTableState(False);

//  tblAuthors.EmptyTable;
  tblAuthor_List.EmptyTable;
//  tblSeries.EmptyTable;
  tblBooksA.EmptyTable;
  tblBooksS.EmptyTable;
  tblGenres.EmptyTable;
  tblBooks_Genre_List.EmptyTable;
  tblBooks_Genres.EmptyTable;
  tblGenre_List.EmptyTable;
  tblBooksG.EmptyTable;
  tblBooks.EmptyTable;
  tblSeriesA.EmptyTable;
  tblSeriesB.EmptyTable;

  SetTableState(True);
end;

procedure TDMCollection.FieldByName(AID: integer; AField: String; out Ares: boolean);
begin
  if AID <> 0 then FActiveTable.Locate('ID', AID, []);
  ARes := FActiveTable.FieldByName(AField).AsBoolean;
end;

function TDMCollection.GetBookAuthor(BookID: Integer): string;
begin
  tblAuthor_Master.Locate('BookID', BookID, []);
  Result := tblAuthor_DetailFullName.Value;
end;

procedure TDMCollection.GetBookFileName(ID: integer; out AFile:string;
                                  out AFolder: string; out AExt: string;
                                  out ANo:integer);
begin
  FActiveTable.Locate('ID', ID, []);
  AExt := FActiveTable.FieldByName('Ext').AsString;
  AFile := FActiveTable.FieldByName('FileName').AsString + AExt;
  AFolder := FActiveTable.FieldByName('Folder').AsString;
  ANo := FActiveTable.FieldByName('InsideNo').AsInteger;
end;

function TDMCollection.GetBookGenres(BookID: Integer; FirstOnly: boolean): String;
var
  s: String;
  i: integer;
begin
  i := 0;
  tblBooks_Genre_List.Locate('BookID', BookID, []);
  while (not tblBooks_Genre_List.Eof) and (tblBooks_Genre_ListBookID.Value = BookID) do
  begin
    if FirstOnly and (i > 0) then Break;
    if not tblBooks_GenresAlias.IsNull then
      s := s + tblBooks_GenresAlias.Value + ' / ';
    tblBooks_Genre_List.Next;
    inc(i);
  end;
  Delete(S, Length(S) - 2, 3);
  Result := s;
end;

procedure TDMCollection.GetCurrentBook(var R: TBookRecord);
var
  BookID: Integer;
begin
  BookID := tblBooksID.Value;

  R.Clear;

  R.Title := tblBooksTitle.Value;
  R.Series := IfThen(tblBooksSerID.IsNull, NO_SERIES_TITLE, tblBooksSeries.Value);
  R.SeqNumber := tblBooksSeqNumber.Value;
  R.Folder := tblBooksFolder.Value;
  R.FileName := tblBooksFileName.Value;
  R.FileExt := tblBooksExt.Value;
  R.Size := tblBooksSize.Value;
  R.InsideNo := tblBooksInsideNo.Value;
  R.Date := tblBooksDate.Value;

  tblBooks_Genre_List.Locate('BookID', BookID, []);
  while (not tblBooks_Genre_List.Eof) and (tblBooks_Genre_ListBookID.Value = BookID) do
  begin
    R.AddGenre(
      tblBooks_GenresCode.Value,
      tblBooks_GenresFB2Code.Value,
      tblBooks_GenresAlias.Value
      );

    tblBooks_Genre_List.Next;
  end;

  (****************************************************************************
   * ���������� ������������ Query ��� ��������� ���������� �� ������� �����.
   * �� ���������� ������������ ��� ���� �������� ��� �������� ����� ��������.
   * ��������, ����� ����������� ���� ������ �������������.
   *
   * select A1."Family", A1."Name", A1."Middle"
   * from "Author_List" A2 inner join "Authors" A1 on (A2."AuthID" = A1."ID")
   * where (A2."BookID" = :BookID)
   *
   *)

  tblAuthor_Master.Locate('BookID', BookID, []);
  while (not tblAuthor_Master.Eof) and (tblAuthor_MasterBookID.Value = BookID) do
  begin
    R.AddAuthor(
      tblAuthor_DetailFamily.Value,
      tblAuthor_DetailName.Value,
      tblAuthor_DetailMiddle.Value
      );

    tblAuthor_Master.Next;
  end;
end;

procedure TDMCollection.GetStatistics(out AuthorsCount: Integer; out BooksCount: Integer; out SeriesCount: Integer);
var
  FilterStateA: boolean;
  FilterStringA: string;
  FilterStateS: boolean;

  BM1: TBookMark;
begin
  (****************************************************************************
   *
   * ����� ��������������� ������������ 3 ������� �������,
   * �� ���� ������� ��� ����
   *
   ****************************************************************************)

  BM1 := DMCollection.tblAuthors.GetBookmark;
  try
    FilterStateA := DMCollection.tblAuthors.Filtered;
    FilterStringA := DMCollection.tblAuthors.Filter;

    FilterStateS := DMCollection.tblSeries.Filtered;


    DMCollection.tblAuthors.Filtered := False;
    DMCollection.tblSeries.Filtered  := False;

    AuthorsCount := DMCollection.tblAuthors.RecordCount;
    BooksCount := DMCollection.tblBooks.RecordCount;
    SeriesCount := DMCollection.tblSeries.RecordCount;

    DMCollection.tblAuthors.Filter := FilterStringA;
    DMCollection.tblAuthors.Filtered := FilterStateA;
    DMCollection.tblSeries.Filtered  := FilterStateS;

    DMCollection.tblAuthors.GotoBookmark(BM1);
  finally
    DMCollection.tblAuthors.FreeBookmark(BM1);
  end;
end;

procedure TDMCollection.SetActiveTable(Tag: integer);
begin
  if Tag = PAGE_FAVORITES then
    FActiveTable := DMUser.tblGrouppedBooks
  else
    FActiveTable := tblBooks;
end;

procedure TDMCollection.GetBookFolder(ID: integer; out AFolder: String);
begin
  FActiveTable.Locate('ID', ID, []);
  if FActiveTable.Name = 'tblBooks' then
    AFolder := IncludeTrailingPathDelimiter(DMUser.ActiveCollection.RootFolder) + FActiveTable.FieldByName('Folder').AsString
  else
    AFolder := FActiveTable.FieldByName('Folder').AsString;
end;

procedure TDMCollection.SetLocalStatus(AId: integer; AState: boolean);
begin
  if Aid <> 0 then
  if  FActiveTable.Locate('ID',AId,[]) then
  begin
    FActiveTable.Edit;
    FActiveTable.FieldByName('Local').AsBoolean := AState;
    FActiveTable.Post;

    //
    // ������� ���������� � ����� � ������� ���� ���������
    //
    PostMessage(
      Application.MainFormHandle,
      WM_MHL_DOWNLOAD_COMPLETE,
      AId,
      Integer(LongBool(AState))
      );

  end;
end;

procedure TDMCollection.SetTableState(State: boolean);
begin
  tblAuthors.Active := State;
  tblAuthor_List.Active := State;
  tblSeries.Active := State;
  tblBooksA.Active := State;
  tblBooksS.Active := State;
  tblGenres.Active := State;
  tblBooks_Genre_List.Active := State;
  tblBooks_Genres.Active := State;
  tblGenre_List.Active := State;
  tblBooksG.Active := State;
  tblBooks.Active := State;
  tblSeriesA.Active := State;
  tblSeriesB.Active := State;
  tblExtra.Active := State;
end;

end.