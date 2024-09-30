unit UStockGlobal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, UdataModule,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, System.Actions, Vcl.ActnList,
  Vcl.Menus, UModelDetail, FireDAC.UI.Intf, FireDAC.Comp.ScriptCommands,
  FireDAC.Stan.Util, FireDAC.Comp.Script;

type
  TFStockGlobal = class(TForm)
    FDQGlobalFavorite: TFDQuery;
    FDQGlobalStock: TFDQuery;
    DSGobalFavorite: TDataSource;
    DSGlobalStock: TDataSource;
    DBGGlobalFavorite: TDBGrid;
    DBGGlobalStock: TDBGrid;
    DBGGlobalBuyed: TDBGrid;
    DBGGlobalStart: TDBGrid;
    DBGGlobalFinished: TDBGrid;
    FDQGlobalBuyed: TFDQuery;
    FDQGlobalStart: TFDQuery;
    FDQGlobalFinished: TFDQuery;
    DSGlobalStart: TDataSource;
    DSBuyed: TDataSource;
    DSGlobalFinished: TDataSource;
    ALGlobal: TActionList;
    PUMGlobal: TPopupMenu;
    AGlobalViewDetail: TAction;
    Voirlesdtails1: TMenuItem;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    LGlobalQuantity: TLabel;
    procedure AGlobalViewDetailExecute(Sender: TObject);
    procedure DBGGlobalFavoriteMouseActivate(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y, HitTest: Integer;
      var MouseActivate: TMouseActivate);
    procedure FormShow(Sender: TObject);
  private
    { Déclarations privées }
    ActiveGrid : TDBGrid;
  public
    { Déclarations publiques }

  end;

var
  FStockGlobal: TFStockGlobal;

implementation

{$R *.dfm}

procedure TFStockGlobal.AGlobalViewDetailExecute(Sender: TObject);
var
  idModel: Integer;
begin
  if assigned(ActiveGrid) then
  begin
    idModel:=ActiveGrid.DataSource.DataSet.FieldByName('model_id').asInteger;
    FModelDetail.idModel:=idModel;
    FModelDetail.ShowModal;
  end;
end;

procedure TFStockGlobal.DBGGlobalFavoriteMouseActivate(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y, HitTest: Integer;
  var MouseActivate: TMouseActivate);
begin
    if Sender is TDBGrid then
    begin
    ActiveGrid:=Sender as TDBGrid;
    end;
end;


procedure TFStockGlobal.FormShow(Sender: TObject);
begin
DMDatabase.SystemQuery.SQL.Clear;
DMDatabase.SystemQuery.Params.clear;
DMDatabase.SystemQuery.SQL.Add('SELECT count(*) as number FROM model_user WHERE state!=:status');
DMDatabase.SystemQuery.Params[0].Value:=DMDatabase.wishes;
DMDatabase.SystemQuery.Prepare;
DMDatabase.SystemQuery.Open;
LGlobalQuantity.caption :=  DMDatabase.DSSystem.DataSet.FieldByName('number').AsString;
DMDatabase.SystemQuery.close;
FDQGlobalStart.Active:=false;
FDQGlobalStock.Active:=false;
FDQGlobalFavorite.Active:=false;
FDQGlobalFinished.Active:=false;
FDQGlobalBuyed.Active:=false;
FDQGlobalStart.Params[0].Value:=DMDatabase.onStash;
FDQGlobalStock.Params[0].Value:=DMDatabase.inStock;
FDQGlobalFavorite.Params[0].Value:=DMDatabase.wishes;
FDQGlobalFinished.Params[0].Value:=DMDatabase.finished;
FDQGlobalBuyed.Params[0].Value:=DMDatabase.buyed;
FDQGlobalStart.Active:=true;
FDQGlobalStock.Active:=true;
FDQGlobalFavorite.Active:=true;
FDQGlobalFinished.Active:=true;
FDQGlobalBuyed.Active:=true;
end;

end.
