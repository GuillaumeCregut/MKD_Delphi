unit UOrders;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UdataModule, Vcl.DBCtrls, Data.DB,
  Vcl.Grids, Vcl.StdCtrls, Vcl.ComCtrls, UFormValues;

type
  TFOrders = class(TForm)
    DSOrdersProvider: TDataSource;
    DBLCBOrderProvider: TDBLookupComboBox;
    Label1: TLabel;
    DTPOrder: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    EOrderRef: TEdit;
    Label5: TLabel;
    SGOrders: TStringGrid;
    BAddOrder: TButton;
    BOrderAddModel: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BOrderAddModelClick(Sender: TObject);
    procedure SGOrdersMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BAddOrderClick(Sender: TObject);
    procedure DBLCBOrderProviderCloseUp(Sender: TObject);
  private
    { Déclarations privées }
    canAdd: Boolean;
    TabOrderModels: array of TOrderValues;
    procedure updateOrder(idLine,newQtty, gridLine: Integer);
  public
    { Déclarations publiques }
    procedure addOrderModel(idModel: Integer; qtty: Integer; price: real;
      name, brand, scale, ref: String);
  end;

var
  FOrders: TFOrders;

const
  numberCell = 0;
  nameCell = 1;
  refCell = 2;
  brandCell = 3;
  scaleCell = 4;
  qttyCell = 5;
  priceCell = 6;
  addCell = 7;
  removeCell = 8;

implementation

{$R *.dfm}

uses UOrderModel;

procedure TFOrders.addOrderModel(idModel: Integer; qtty: Integer; price: real;
  name, brand, scale, ref: String);
var
  idLine, lastLine: Integer;
  myOrder: TOrderValues;
  NumberLine: string;
begin
  lastLine := SGOrders.RowCount - 1;
  if ((lastLine - 1) > 0) then
    NumberLine := SGOrders.Cells[numberCell, lastLine - 1]
  else
    NumberLine := '0';
  idLine := NumberLine.ToInteger + 1;
  myOrder.idLine := idLine;
  myOrder.idModel := idModel;
  myOrder.qtty := qtty;
  myOrder.price := price;
  TabOrderModels := TabOrderModels + [myOrder];
  SGOrders.Cells[numberCell, lastLine] := myOrder.idLine.ToString;
  SGOrders.Cells[nameCell, lastLine] := name;
  SGOrders.Cells[brandCell, lastLine] := brand;
  SGOrders.Cells[scaleCell, lastLine] := scale;
  SGOrders.Cells[qttyCell, lastLine] := qtty.ToString;
  SGOrders.Cells[priceCell, lastLine] := FloatToStr(price);
  SGOrders.Cells[refCell, lastLine] := ref;
  SGOrders.Cells[addCell, lastLine] := '+';
  SGOrders.Cells[removeCell, lastLine] := '-';
  SGOrders.RowCount := SGOrders.RowCount + 1;
end;

procedure TFOrders.BAddOrderClick(Sender: TObject);
var
  idModel : integer;
  idProvider, idOrder: Integer;
  dateOrder: String;
begin
//Create Order
  dateOrder:=dateToStr(DTPOrder.Date);
  if EOrderRef.Text='' then
  begin
    showMessage('Veuillez saisir une référence');
    exit;
  end;
  if not canAdd then
  begin
    showMessage('Veuillez choisir un fournisseur');
    exit;
  end;
  idProvider:=DBLCBOrderProvider.ListSource.DataSet.FieldByName('id').AsInteger;
  try
    idOrder:=DMDatabase.createOrder(idProvider,EOrderRef.Text,dateOrder);
    if idOrder=0 then
    begin
      showMessage('Une erreur s''est produite à la création de la commande');
      exit;
    end;
  //Pour chaque modèle on  ajoute à la BDD
    for var i:=0 to length(TabOrderModels)-1 do
    begin
      if(TabOrderModels[i].qtty>0) then
      begin
        idModel:= TabOrderModels[i].idModel;
        try
          DMDatabase.AddModelToOrder(idModel,TabOrderModels[i].qtty,idOrder,idProvider,TabOrderModels[i].price);
        except
          showMessage('Une erreur s''est produite à l''ajout du kit');
        end;

      end;
  end;
  except
    showMessage('Une erreur s''est produite à la création de la commande');
  end;

end;

procedure TFOrders.BOrderAddModelClick(Sender: TObject);
var
  i: Integer;
begin
  FOrderModel.ShowModal;
end;

procedure TFOrders.DBLCBOrderProviderCloseUp(Sender: TObject);
begin
  canAdd := true;
end;

procedure TFOrders.FormCreate(Sender: TObject);
begin
  SGOrders.RowCount := 2;
  SGOrders.Cells[nameCell, 0] := 'Nom du kit';
  SGOrders.Cells[refCell, 0] := 'Référence';
  SGOrders.Cells[brandCell, 0] := 'Marque';
  SGOrders.Cells[scaleCell, 0] := 'Echelle';
  SGOrders.Cells[qttyCell, 0] := 'Quantité';
  SGOrders.Cells[priceCell, 0] := 'Prix unitaire';
end;

procedure TFOrders.FormShow(Sender: TObject);
begin
  canAdd :=false;
end;

procedure TFOrders.SGOrdersMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  Column, Row: LongInt;
  idLine, newQtty: Integer;
begin
  SGOrders.MouseToCell(X, Y, Column, Row);
  if (Column = addCell) then
  begin
    idLine:=strToInt(SGOrders.Cells[numberCell,Row]);
    newQtty:=1;
    updateOrder(idLine,newQtty,Row);
  end
  else if (Column = removeCell) then
  begin
     idLine:=strToInt(SGOrders.Cells[numberCell,Row]);
     newQtty:=-1;
     updateOrder(idLine,newQtty,Row);
  end;
end;

procedure TFOrders.updateOrder(idLine, newQtty, gridLine: Integer);
var
  idRowOrder, calculatedQtty : Integer;
  tempQtty : string;
begin
  idRowOrder:=-1;
  tempQtty:=newQtty.ToString;
  for var i := 0 to length(TabOrderModels)-1 do
  begin
     if TabOrderModels[i].idLine=idLine then
        idRowOrder:=i;
  end;
  if idRowOrder>=0 then
  begin
    calculatedQtty:=TabOrderModels[idRowOrder].qtty+newQtty;
    if(calculatedQtty>=0) then
       TabOrderModels[idRowOrder].qtty:=calculatedQtty;
    tempQtty:=intTostr( TabOrderModels[idRowOrder].qtty);
  end;
  SGOrders.Cells[qttyCell,gridLine]:=tempQtty;
end;

end.
