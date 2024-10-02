unit UProvider;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UdataModule, Data.DB, Vcl.ComCtrls,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Menus, Vcl.StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFProvider = class(TForm)
    DSProvider: TDataSource;
    DBGProvider: TDBGrid;
    Panel1: TPanel;
    PCProvider: TPageControl;
    TSProviderAdd: TTabSheet;
    TSProviderChange: TTabSheet;
    DBGrid2: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    EProviderName: TEdit;
    BProviderAdd: TButton;
    PUMProvider: TPopupMenu;
    MIProviderDelete: TMenuItem;
    Label3: TLabel;
    Label4: TLabel;
    BProviderUpdate: TButton;
    EProviderNewName: TEdit;
    DSProviderOrders: TDataSource;
    FDQOrders: TFDQuery;
    Label5: TLabel;
    FDQProviderOrderDetails: TFDQuery;
    DSProviderOrderDetails: TDataSource;
    DBGProviderOrderDetails: TDBGrid;
    procedure MIProviderDeleteClick(Sender: TObject);
    procedure BProviderAddClick(Sender: TObject);
    procedure BProviderUpdateClick(Sender: TObject);
    procedure DBGProviderCellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
  private
    { Déclarations privées }
    oldName : string;
    procedure refreshValues;
  public
    { Déclarations publiques }
  end;

var
  FProvider: TFProvider;

implementation

{$R *.dfm}

procedure TFProvider.BProviderAddClick(Sender: TObject);
var
  name : string;
begin
  name:=EProviderName.Text;
  DMDatabase.FDTableProvider.Append;
  DMDatabase.FDTableProvider.FieldByName('name').AsString:=name;
  try
    DMDatabase.FDTableProvider.Post;
    EProviderName.Text:='';
  except
    DMDatabase.FDTableProvider.Cancel;
    showMessage('Le nom saisi existe déjà');
  end;
  DMDatabase.FDTableProvider.Refresh;
  refreshValues;
end;

procedure TFProvider.BProviderUpdateClick(Sender: TObject);
var
  name: String;
  id : integer;
begin
  name := EProviderNewName.Text;
  DMDatabase.FDTableProvider.Edit;
  DMDatabase.FDTableProvider.FieldByName('name').AsString := name;
  try
    DMDatabase.FDTablePeriod.Post;
  except
    showMessage('Le nom saisi existe déjà');
    DMDatabase.FDTableProvider.Edit;
    DMDatabase.FDTableProvider.FieldByName('name').AsString := oldName;
    DMDatabase.FDTableProvider.Post;
    EProviderNewName.Text := oldName;
  end;
  DMDatabase.FDTablePeriod.Refresh;
  refreshValues;
end;

procedure TFProvider.DBGProviderCellClick(Column: TColumn);
begin
  refreshValues;
end;

procedure TFProvider.FormHide(Sender: TObject);
begin
  FDQOrders.Active:=false;
  FDQProviderOrderDetails.Active:=false;
end;

procedure TFProvider.FormShow(Sender: TObject);
begin
  if not DMDatabase.FDTableProvider.Active then
    DMDatabase.FDTableProvider.Active:=true;
  if not DMDatabase.FDTableOrders.Active then
    DMDatabase.FDTableOrders.Active:=true;
  if not FDQOrders.Active then
    FDQOrders.Active:=true;
  if not FDQProviderOrderDetails.Active then
    FDQProviderOrderDetails.Active:=true;

end;

procedure TFProvider.MIProviderDeleteClick(Sender: TObject);
var
  name : string;
begin
   name := DSProvider.DataSet.FieldByName('name').AsString;
  if MessageDlg('Voulez vous supprimer ' + name + ' ?', TMsgDlgType.mtWarning,
    [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0, TMsgDlgBtn.mbNo) = mrYes then
  begin
    try
      DMDatabase.FDTableProvider.Delete;
    except
      showMessage('Impossible de supprimer ce fournisseur');
    end;
    DMDatabase.FDTableProvider.Refresh;
    refreshValues;
  end;
end;

procedure TFProvider.refreshValues;
begin
  oldName:=DBGProvider.DataSource.DataSet.FieldByName('name').asString;
  EProviderNewName.Text:=oldName;
end;

end.
