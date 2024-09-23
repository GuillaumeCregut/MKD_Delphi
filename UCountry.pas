unit UCountry;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ComCtrls, Vcl.Grids,
  Vcl.DBGrids, System.Actions, Vcl.ActnList, Vcl.Menus, UdataModule,
  Vcl.StdCtrls;

type
  TFCountry = class(TForm)
    DBGCountry: TDBGrid;
    PGCountry: TPageControl;
    PUMCountry: TPopupMenu;
    ALCountry: TActionList;
    DSCountry: TDataSource;
    RemoveCountry: TAction;
    MIRemoveCountry: TMenuItem;
    TSCountryAdd: TTabSheet;
    TSCountryUpdate: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    BCountryUpdate: TButton;
    BCountryAdd: TButton;
    ECountryName: TEdit;
    ECountryNewName: TEdit;
    procedure RemoveCountryExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BCountryAddClick(Sender: TObject);
    procedure BCountryUpdateClick(Sender: TObject);
    procedure DBGCountryCellClick(Column: TColumn);
  private
    { Déclarations privées }
    oldName: string;
    procedure refreshValues;
  public
    { Déclarations publiques }
  end;

var
  FCountry: TFCountry;

implementation

{$R *.dfm}

procedure TFCountry.BCountryAddClick(Sender: TObject);
var
  newName: String;
begin
  newName := ECountryName.Text;
  DMDatabase.FDTableCountry.Append;
  DMDatabase.FDTableCountry.FieldByName('name').AsString := newName;
  try
    DMDatabase.FDTableCountry.Post;
  except
    DMDatabase.FDTableCountry.Cancel;
    showMessage('Le nom saisi existe déjà');
  end;
  DMDatabase.FDTableCountry.Refresh;
  refreshValues;
end;

procedure TFCountry.BCountryUpdateClick(Sender: TObject);
var
  newName: String;
begin
  newName := ECountryNewName.Text;
  DMDatabase.FDTableCountry.Edit;
  DMDatabase.FDTableCountry.FieldByName('name').AsString := newName;
  try
    DMDatabase.FDTableCountry.Post;
  except
    showMessage('Le nom saisi existe déjà');
    DMDatabase.FDTableCountry.Edit;
    DMDatabase.FDTableCountry.FieldByName('name').AsString := oldName;
    DMDatabase.FDTableCountry.Post;
    ECountryNewName.Text := oldName;
  end;
  DMDatabase.FDTableCountry.Refresh;
end;

procedure TFCountry.DBGCountryCellClick(Column: TColumn);
begin
  refreshValues;
end;

procedure TFCountry.FormShow(Sender: TObject);
begin
  if not DMDatabase.FDTableCountry.active then
    DMDatabase.FDTableCountry.active := true;
  refreshValues;
end;

procedure TFCountry.refreshValues;
begin
  ECountryNewName.Text := DSCountry.DataSet.FieldByName('name').AsString;
  oldName := DSCountry.DataSet.FieldByName('name').AsString;
end;

procedure TFCountry.RemoveCountryExecute(Sender: TObject);
var
  name: string;
begin
  name := DSCountry.DataSet.FieldByName('name').AsString;
  if MessageDlg('Voulez vous supprimer ' + name + ' ?', TMsgDlgType.mtWarning,
    [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0, TMsgDlgBtn.mbNo) = mrYes then
  begin
    DMDatabase.FDTableCountry.Delete;
    refreshValues;
  end;
end;

end.
