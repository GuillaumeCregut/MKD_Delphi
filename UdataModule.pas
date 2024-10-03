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
    FDTableProvider: TFDTable;
    FDTableOrders: TFDTable;
    FDTableModelOrder: TFDTable;
    FDTableModelUser: TFDTable;
    procedure dbConnectionError(ASender, AInitiator: TObject;
      var AException: Exception);
    procedure FDTStatusAfterOpen(DataSet: TDataSet);
  private
    { Déclarations privées }
    procedure addModelToUser(idModel, provider: Integer; price :real);
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
    procedure connectTables;
    procedure AddModelToOrder(idModel,qtty, idOrder, idProvider : integer; price: Real) ;
    function createOrder(idProvider: integer; reference, dateOrder : string): integer;
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



procedure TDMDatabase.AddModelToOrder(idModel, qtty, idOrder, idProvider: integer;
  price: Real);
begin
   FDTableModelOrder.Active:=True;
   FDTableModelOrder.Append;
   FDTableModelOrder.FieldByName('model_id').AsInteger:=idModel;
   FDTableModelOrder.FieldByName('qtty').asInteger:=qtty;
   FDTableModelOrder.FieldByName('order_id').AsInteger:=idOrder;
   FDTableModelOrder.FieldByName('price').AsFloat:=price;
   try
     try
       FDTableModelOrder.Post;
     except
       raise Exception.Create('Impossible d''ajouter le modèle' + IntToStr(idModel)+' dans la commande');
     end;
   finally
      FDTableModelOrder.Active:=false;
   end;
  //Add model to model_user
  for var j := 1 to qtty do
  begin
    try
      addModelToUser(idModel,idProvider,price);
    except
       raise Exception.Create('impossible d''jouter le kit au stock');
    end;
  end;
end;

procedure TDMDatabase.addModelToUser(idModel, provider: Integer; price: real);
begin
// TODO: Add a model to Model_user
    FDTableModelUser.Active:=true;
    FDTableModelUser.Append;
    FDTableModelUser.FieldByName('model_id').asInteger:=idModel;
    FDTableModelUser.FieldByName('state').asInteger:=buyed;
    FDTableModelUser.FieldByName('price').AsFloat:=price;
    FDTableModelUser.FieldByName('provider').asInteger:=provider;
    try
      try
        FDTableModelUser.Post;
      except
        raise Exception.Create('impossible d''jouter le kit au stock');
      end;
    finally
      FDTableModelUser.Active:=false;
    end;
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

procedure TDMDatabase.connectTables;
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
  FDTableProvider.Active:=true;
  FDTableOrders.Active:=true;
end;

function TDMDatabase.createOrder(idProvider: integer;
  reference, dateOrder: string): integer;
var
  query : String;
begin
   FDTableOrders.Append;
   FDTableOrders.FieldByName('reference').asString:=reference;
   FDTableOrders.FieldByName('date_order').asString:=dateOrder;
   FDTableOrders.FieldByName('provider').asInteger:=idProvider;
   try
     FDTableOrders.Post;
   except
     raise Exception.Create('Impossible d''enregistrer la commande');
   end;
  //
  query:='SELECT id FROM orders WHERE reference=:ref AND provider=:prov';
  SystemQuery.Open(query,[reference,idProvider]);
  result := DSSystem.DataSet.FieldByName('id').asInteger;
end;

procedure TDMDatabase.dbConnectionError(ASender, AInitiator: TObject;
  var AException: Exception);
begin
  //raise Exception.Create('Erreur dans la base');
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
