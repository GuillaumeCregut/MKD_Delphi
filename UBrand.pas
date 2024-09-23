unit UBrand;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, System.UITypes,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UdataModule, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls,
  System.Actions, Vcl.ActnList, Vcl.Menus, Vcl.ComCtrls;

type
  TFBrand = class(TForm)
    DSBrand: TDataSource;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    EBrandName: TEdit;
    AddBrandBtn: TButton;
    BUpdateBrandName: TButton;
    EBrandUpdateName: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    PUMBrand: TPopupMenu;
    Supprimer1: TMenuItem;
    ALBrand: TActionList;
    RemoveBrand: TAction;
    PCBrand: TPageControl;
    TSBrandAdd: TTabSheet;
    TSBrandUpdate: TTabSheet;
    procedure FormShow(Sender: TObject);
    procedure AddBrandBtnClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure BUpdateBrandNameClick(Sender: TObject);
    procedure RemoveBrandExecute(Sender: TObject);
  private
    { Déclarations privées }
    oldName: string;
    procedure refreshValues;
  public
    { Déclarations publiques }
  end;

var
  FBrand: TFBrand;

implementation

{$R *.dfm}

procedure TFBrand.RemoveBrandExecute(Sender: TObject);
var
  name: string;
begin
  name := DSBrand.DataSet.FieldByName('name').AsString;
  if MessageDlg('Voulez vous supprimer ' + name + ' ?', TMsgDlgType.mtWarning,
    [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0, TMsgDlgBtn.mbNo) = mrYes then
  begin
    DMDatabase.FDTableBrand.Delete;
    refreshValues;
  end;

end;

procedure TFBrand.AddBrandBtnClick(Sender: TObject);
var
  newName: String;
begin
  newName := EBrandName.Text;
  DMDatabase.FDTableBrand.Append;
  DMDatabase.FDTableBrand.FieldByName('name').AsString := newName;
  try
    DMDatabase.FDTableBrand.Post;
  except
    DMDatabase.FDTableBrand.Cancel;
    showMessage('Le nom saisi existe déjà');
  end;
  DMDatabase.FDTableBrand.Refresh;
  refreshValues;
end;

procedure TFBrand.BUpdateBrandNameClick(Sender: TObject);
var
  newName: String;
begin
  newName := EBrandUpdateName.Text;
  DMDatabase.FDTableBrand.Edit;
  DMDatabase.FDTableBrand.FieldByName('name').AsString := newName;
  try
    DMDatabase.FDTableBrand.Post;
  except
    showMessage('Le nom saisi existe déjà');
    DMDatabase.FDTableBrand.Edit;
    DMDatabase.FDTableBrand.FieldByName('name').AsString := oldName;
    DMDatabase.FDTableBrand.Post;
    EBrandUpdateName.Text := oldName;
  end;
  DMDatabase.FDTableBrand.Refresh;
end;

procedure TFBrand.DBGrid1CellClick(Column: TColumn);
begin
  refreshValues;
end;

procedure TFBrand.FormShow(Sender: TObject);
begin
  if not DMDatabase.FDTableBrand.active then
    DMDatabase.FDTableBrand.active := true;
  refreshValues;
end;

procedure TFBrand.refreshValues;
begin
  EBrandUpdateName.Text := DSBrand.DataSet.FieldByName('name').AsString;
  oldName := DSBrand.DataSet.FieldByName('name').AsString;
end;

end.
