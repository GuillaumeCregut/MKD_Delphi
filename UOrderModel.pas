unit UOrderModel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, UOrders, UdataModule,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Menus, Vcl.Grids, Vcl.DBGrids, UModelDetail,
  Vcl.Mask, Vcl.Samples.Spin, Vcl.ExtCtrls;

type
  TFOrderModel = class(TForm)
    BOrderModelAdd: TButton;
    FDQOrderModel: TFDQuery;
    DSOrderModel: TDataSource;
    DBGOrderModel: TDBGrid;
    PUMOrderModel: TPopupMenu;
    MIOrderModelShow: TMenuItem;
    Panel1: TPanel;
    Label1: TLabel;
    LOrderModelName: TLabel;
    SEOrderQtty: TSpinEdit;
    Label2: TLabel;
    Label3: TLabel;
    EOrderModelPrice: TEdit;
    procedure BOrderModelAddClick(Sender: TObject);
    procedure MIOrderModelShowClick(Sender: TObject);
    procedure DBGOrderModelCellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
  private
    { Déclarations privées }
    idSelectedModel : Integer;
  public
    { Déclarations publiques }
  end;

var
  FOrderModel: TFOrderModel;

implementation

{$R *.dfm}



procedure TFOrderModel.BOrderModelAddClick(Sender: TObject);
var
  name,ref,brand,scale, priceIntext :string;
  qtty : Integer;
  price : real;
begin
  brand:=DSOrderModel.DataSet.FieldByName('brandname').asString;
  ref:=DSOrderModel.DataSet.FieldByName('reference').asString;
  qtty:=SEOrderQtty.Value;
  name:=DSOrderModel.DataSet.FieldByName('name').asString;
  scale:=DSOrderModel.DataSet.FieldByName('scalename').asString;
  priceIntext:=EOrderModelPrice.text;
  priceIntext:=StringReplace(priceIntext,'.',',',[rfReplaceAll]);
  try
    price:=StrToFloat(priceInText);
  except
     showMessage('Le prix n''est pas une valeur correcte');
     price:=0;
     exit;
  end;
  if(price=0) or (qtty<1) or (LOrderModelName.Caption='-') then
  begin
    showMessage('Veuillez choisir un kit et indiquer un prix et une quantité');
    exit;
  end;
  FOrders.addOrderModel(idSelectedModel,qtty,price,name,brand,scale,ref);
  close;
end;

procedure TFOrderModel.DBGOrderModelCellClick(Column: TColumn);
begin
   idSelectedModel:=DSOrderModel.DataSet.FieldByName('id').asInteger;
   LOrderModelName.Caption:=DSOrderModel.DataSet.FieldByName('brandname').asString+ ' '+DSOrderModel.DataSet.FieldByName('name').asString;
end;

procedure TFOrderModel.FormShow(Sender: TObject);
begin
  EOrderModelPrice.Text:='';
  LOrderModelName.Caption:='-';
  SEOrderQtty.Value:=1;
  idSelectedModel:=0;
end;

procedure TFOrderModel.MIOrderModelShowClick(Sender: TObject);
begin
  FModelDetail.idModel:=DSOrderModel.DataSet.FieldByName('id').AsInteger;
  FmodelDetail.ShowModal;
end;

end.
