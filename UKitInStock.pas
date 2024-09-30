unit UKitInStock;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UdataModule, FireDAC.Stan.Intf,
  System.UITypes,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, UModelDetail,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, UFormValues, System.Actions,
  Vcl.ActnList, Vcl.Menus;

type
  TFKitInStock = class(TForm)
    FDQKitInStock: TFDQuery;
    DSKitInStock: TDataSource;
    DBGKitInStock: TDBGrid;
    Label1: TLabel;
    DBTName: TDBText;
    Label2: TLabel;
    DBLCBKitStatus: TDBLookupComboBox;
    BKitInStockMove: TButton;
    DSKitInStockStatus: TDataSource;
    ALKitInStock: TActionList;
    PUMKitInStock: TPopupMenu;
    AShowDetail: TAction;
    Voirlesdtails1: TMenuItem;
    ARemoveStock: TAction;
    Supprimer1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AShowDetailExecute(Sender: TObject);
    procedure BKitInStockMoveClick(Sender: TObject);
    procedure ARemoveStockExecute(Sender: TObject);
  private
    { Déclarations privées }
    stockId: Integer;
  public
    { Déclarations publiques }
    myValues: TFormValues;
  end;

var
  FKitInStock: TFKitInStock;

implementation

{$R *.dfm}

procedure TFKitInStock.ARemoveStockExecute(Sender: TObject);
var
idKit : integer;
name : string;
begin
  name := DSKitInStock.DataSet.FieldByName('name').AsString;
  if MessageDlg('Voulez vous suppripmer ' + name + 'du stock ?',
  TMsgDlgType.mtWarning, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0,
  TMsgDlgBtn.mbNo) = mrYes then
  begin
     idKit:= DSKitInStock.DataSet.FieldByName('id').AsInteger;
     DMDatabase.moveStock(idKit,0);
     FDQKitInStock.Refresh;
  end;
end;

procedure TFKitInStock.AShowDetailExecute(Sender: TObject);
var
  idModel: Integer;
begin
  idModel := DSKitInStock.DataSet.FieldByName('model_id').AsInteger;
  FModelDetail.idModel := idModel;
  FModelDetail.ShowModal;
end;

procedure TFKitInStock.BKitInStockMoveClick(Sender: TObject);
var
  name, newStock, dateChange, query : string;
  newStockId, idKit: Integer;
begin
  query:='';
  name := DSKitInStock.DataSet.FieldByName('name').AsString;
  newStock := DSKitInStockStatus.DataSet.FieldByName('name').AsString;
  if MessageDlg('Voulez vous déplacer ' + name + ' vers ' + newStock + ' ?',
    TMsgDlgType.mtWarning, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0,
    TMsgDlgBtn.mbNo) = mrYes then
  begin
    newStockId := DSKitInStockStatus.DataSet.FieldByName('id').AsInteger;
    if newStockId <> stockId then
    begin
      idKit:= DSKitInStock.DataSet.FieldByName('id').AsInteger;
      DMDatabase.moveStock(idKit,newStockId);
      dateChange:=DateToStr(Now);
      if(newStockId=DMDatabase.onStash) then
      begin
        query:='UPDATE model_user SET start_time=:leDate WHERE id=:id';
      end;
       if(newStockId=DMDatabase.finished) then
      begin
        query:='UPDATE model_user SET end_time=:leDate WHERE id=:id';
      end;
      if(query<>'') then
      begin
        DMDatabase.dbConnection.ExecSQL(query,[dateChange,idKit]);
      end;
      FDQKitInStock.Refresh;
    end;
  end;
end;

procedure TFKitInStock.FormCreate(Sender: TObject);
begin
  myValues.caption := 'generic caption';
  myValues.stock := 0;
end;

procedure TFKitInStock.FormShow(Sender: TObject);
begin
  FKitInStock.caption := myValues.caption;
  stockId := myValues.stock;
  FDQKitInStock.Close;
  FDQKitInStock.Params[0].Value := stockId;
  FDQKitInStock.Open;
end;

end.
