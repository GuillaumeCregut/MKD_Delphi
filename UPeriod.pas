unit UPeriod;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, System.UITypes,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UdataModule, Data.DB, Vcl.ComCtrls,
  Vcl.Grids, Vcl.DBGrids, System.Actions, Vcl.ActnList, Vcl.Menus, Vcl.StdCtrls;

type
  TFPeriod = class(TForm)
    DBGPeriod: TDBGrid;
    PCPeriod: TPageControl;
    TSPeriodAdd: TTabSheet;
    TSPeriodUpdate: TTabSheet;
    DSPeriod: TDataSource;
    ALPeriod: TActionList;
    APeriodRemove: TAction;
    PUMPeriod: TPopupMenu;
    Supprimer1: TMenuItem;
    Label1: TLabel;
    Label2: TLabel;
    EPeriodUpdateName: TEdit;
    BPeriodUpdate: TButton;
    Label3: TLabel;
    Label4: TLabel;
    EPeriodName: TEdit;
    BPeriodAdd: TButton;
    procedure FormShow(Sender: TObject);
    procedure APeriodRemoveExecute(Sender: TObject);
    procedure DBGPeriodCellClick(Column: TColumn);
    procedure BPeriodAddClick(Sender: TObject);
    procedure BPeriodUpdateClick(Sender: TObject);
  private
    { Déclarations privées }
    oldName: string;
    procedure refreshValues;
  public
    { Déclarations publiques }
  end;

var
  FPeriod: TFPeriod;

implementation

{$R *.dfm}

procedure TFPeriod.APeriodRemoveExecute(Sender: TObject);
var
  name: string;
begin
  name := DSPeriod.DataSet.FieldByName('name').AsString;
  if MessageDlg('Voulez vous supprimer ' + name + ' ?', TMsgDlgType.mtWarning,
    [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0, TMsgDlgBtn.mbNo) = mrYes then
  begin
    DMDatabase.FDTablePeriod.Delete;
    refreshValues;
  end;
end;

procedure TFPeriod.BPeriodAddClick(Sender: TObject);
var
  newName: String;
begin
  newName := EPeriodName.Text;
  DMDatabase.FDTablePeriod.Append;
  DMDatabase.FDTablePeriod.FieldByName('name').AsString := newName;
  try
    DMDatabase.FDTablePeriod.Post;
  except
    DMDatabase.FDTablePeriod.Cancel;
    showMessage('Le nom saisi existe déjà');
  end;
  DMDatabase.FDTablePeriod.Refresh;
  refreshValues;
end;

procedure TFPeriod.BPeriodUpdateClick(Sender: TObject);
var
  newName: String;
begin
  newName := EPeriodUpdateName.Text;
  DMDatabase.FDTablePeriod.Edit;
  DMDatabase.FDTablePeriod.FieldByName('name').AsString := newName;
  try
    DMDatabase.FDTablePeriod.Post;
  except
    showMessage('Le nom saisi existe déjà');
    DMDatabase.FDTablePeriod.Edit;
    DMDatabase.FDTablePeriod.FieldByName('name').AsString := oldName;
    DMDatabase.FDTablePeriod.Post;
    EPeriodUpdateName.Text := oldName;
  end;
  DMDatabase.FDTablePeriod.Refresh;
end;

procedure TFPeriod.DBGPeriodCellClick(Column: TColumn);
begin
  refreshValues;
end;

procedure TFPeriod.FormShow(Sender: TObject);
begin
  if not DMDatabase.FDTablePeriod.active then
    DMDatabase.FDTablePeriod.active := true;
  refreshValues;
end;

procedure TFPeriod.refreshValues;
begin
  EPeriodUpdateName.Text := DSPeriod.DataSet.FieldByName('name').AsString;
  oldName := DSPeriod.DataSet.FieldByName('name').AsString;
end;

end.
