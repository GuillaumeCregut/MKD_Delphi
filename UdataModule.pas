unit UdataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  Vcl.BaseImageCollection, Vcl.ImageCollection, System.ImageList, Vcl.ImgList,
  Vcl.VirtualImageList;

type
  TDMDatabase = class(TDataModule)
    FDTableBrand: TFDTable;
    dbConnection: TFDConnection;
    SystemQuery: TFDQuery;
    Transaction: TFDTransaction;
    FDTableCountry: TFDTable;
    FDTableCategory: TFDTable;
    FDTablePeriod: TFDTable;
    FDTableScale: TFDTable;
    FDTableBuilder: TFDTable;
    FDTableModel: TFDTable;
    VILMKD: TVirtualImageList;
    ImageCollectionMKD: TImageCollection;
    FDTStock: TFDTable;
    FDTStatus: TFDTable;
    DSSystem: TDataSource;
    procedure dbConnectionError(ASender, AInitiator: TObject;
      var AException: Exception);
    procedure dbConnectionAfterConnect(Sender: TObject);
    procedure FDTStatusAfterOpen(DataSet: TDataSet);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    inStock : Integer;
    onStash: Integer;
    finished: Integer;
    wishes: Integer;
    buyed: Integer;
    procedure addKitInStock(idModel: Integer; stock: integer);
    procedure moveStock(idModel: Integer; stock: Integer);
    function checkDoubleWish(idModel : integer) : boolean;
  end;

var
  DMDatabase: TDMDatabase;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}



procedure TDMDatabase.addKitInStock(idModel, stock: integer);
begin
    FDTStock.Append;
    FDTStock.FieldByName('model_id').asInteger:=idModel;
    FDTStock.FieldByName('state').asInteger:=stock;
    FDTStock.Post;
end;



function TDMDatabase.checkDoubleWish(idModel: integer): boolean;
var
  query : string;
  idTemp: Integer;
begin
  idTemp:=0;
  query:='SELECT model_id FROM model_user WHERE id=:id';
  SystemQuery.close;
  SystemQuery.Open(query,[idModel]);
  idTemp:=DSSystem.DataSet.FieldByName('id').asInteger;
  if (idTemp=0) then
  begin
    result:=false;
    exit;
  end;
  SystemQuery.Close;
  query:= 'SELECT count(*) as number FROM model_user WHERE model_id=:id AND state=:state';
  SystemQuery.Open(query,[idTemp,wishes]);
  result:=DSSystem.DataSet.FieldByName('number').asInteger>0;
end;

procedure TDMDatabase.dbConnectionAfterConnect(Sender: TObject);
begin
  FDTableBrand.Active:=true;
  FDTableBuilder.Active:=true;
  FDTableCategory.Active:=true;
  FDTableCountry.Active:=true;
  FDTableModel.Active:=true;
  FDTablePeriod.Active:=true;
  FDTableScale.Active:=true;
  FDTStatus.Active:=true;
  FDTStock.Active:=true;
end;

procedure TDMDatabase.dbConnectionError(ASender, AInitiator: TObject;
  var AException: Exception);
begin
  // raise Exception.Create('Erreur dans la base');
end;

procedure TDMDatabase.FDTStatusAfterOpen(DataSet: TDataSet);
begin
//
  FDTStatus.Filter:='name = ''En stock''';
  FDTStatus.Filtered:=true;
  inStock:=FDTStatus.FieldByName('id').AsInteger;
  FDTStatus.Filtered:=false;
  FDTStatus.Filter:='name = ''En cours''';
  FDTStatus.Filtered:=true;
  onStash:=FDTStatus.FieldByName('id').AsInteger;
  FDTStatus.Filtered:=false;
  //
  FDTStatus.Filter:='name = ''Terminé''';
  FDTStatus.Filtered:=true;
  finished:=FDTStatus.FieldByName('id').AsInteger;
  FDTStatus.Filtered:=false;
  //
  FDTStatus.Filter:='name =''Liste de souhaits''';
  FDTStatus.Filtered:=true;
  wishes:=FDTStatus.FieldByName('id').AsInteger;
  FDTStatus.Filtered:=false;
  //
  FDTStatus.Filter:='name = ''Commandé''';
  FDTStatus.Filtered:=true;
  buyed:=FDTStatus.FieldByName('id').AsInteger;
  FDTStatus.Filtered:=false;
end;

procedure TDMDatabase.moveStock(idModel, stock: Integer);
var
  query : string;
begin
// TODO: verifier doublon en favori
  if stock=0 then
  begin
     query:= 'DELETE FROM model_user WHERE id=:id';
     dbConnection.ExecSQL(query,[idModel]);
     exit;
  end;
  if stock=wishes then
  begin
    if checkDoubleWish(idModel) then
      exit;
  end;

  begin
     query:= 'UPDATE model_user set state=:state WHERE id=:id';
     dbConnection.ExecSQL(query,[stock,idModel]);
  end;
end;

end.
