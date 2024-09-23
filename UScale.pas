unit UScale;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, System.UITypes,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, UdataModule, Vcl.ComCtrls,
  Vcl.Grids, Vcl.DBGrids, System.Actions, Vcl.ActnList, Vcl.Menus, Vcl.StdCtrls;

type
  TFScale = class(TForm)
    DSScale: TDataSource;
    DBGScale: TDBGrid;
    PCScale: TPageControl;
    TSScaleAdd: TTabSheet;
    TSScaleUpdate: TTabSheet;
    ALScale: TActionList;
    AScaleDelete: TAction;
    PUMScale: TPopupMenu;
    Supprimer1: TMenuItem;
    Label1: TLabel;
    Label2: TLabel;
    EScaleName: TEdit;
    BScaleAdd: TButton;
    Label3: TLabel;
    Label4: TLabel;
    EScaleUpdateName: TEdit;
    BScaleUpdate: TButton;
    procedure FormShow(Sender: TObject);
    procedure DBGScaleCellClick(Column: TColumn);
    procedure AScaleDeleteExecute(Sender: TObject);
    procedure BScaleUpdateClick(Sender: TObject);
    procedure BScaleAddClick(Sender: TObject);
  private
    { Déclarations privées }
    oldName: string;
    procedure refreshValues;
  public
    { Déclarations publiques }
  end;

var
  FScale: TFScale;

implementation

{$R *.dfm}

procedure TFScale.AScaleDeleteExecute(Sender: TObject);
var
  name: string;
begin
  name := DSScale.DataSet.FieldByName('name').AsString;
  if MessageDlg('Voulez vous supprimer ' + name + ' ?', TMsgDlgType.mtWarning,
    [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0, TMsgDlgBtn.mbNo) = mrYes then
  begin
    DMDatabase.FDTableScale.Delete;
    refreshValues;
  end;
end;

procedure TFScale.BScaleAddClick(Sender: TObject);
var
  newName: String;
begin
  newName := EScaleName.Text;
  DMDatabase.FDTableScale.Append;
  DMDatabase.FDTableScale.FieldByName('name').AsString := newName;
  try
    DMDatabase.FDTableScale.Post;
  except
    DMDatabase.FDTableScale.Cancel;
    showMessage('Le nom saisi existe déjà');
  end;
  DMDatabase.FDTableScale.Refresh;
  refreshValues;
end;

procedure TFScale.BScaleUpdateClick(Sender: TObject);
var
  newName: String;
begin
  newName := EScaleUpdateName.Text;
  DMDatabase.FDTableScale.Edit;
  DMDatabase.FDTableScale.FieldByName('name').AsString := newName;
  try
    DMDatabase.FDTableScale.Post;
  except
    showMessage('Le nom saisi existe déjà');
    DMDatabase.FDTableScale.Edit;
    DMDatabase.FDTableScale.FieldByName('name').AsString := oldName;
    DMDatabase.FDTableScale.Post;
    EScaleUpdateName.Text := oldName;
  end;
  DMDatabase.FDTableScale.Refresh;
end;

procedure TFScale.DBGScaleCellClick(Column: TColumn);
begin
  refreshValues;
end;

procedure TFScale.FormShow(Sender: TObject);
begin
  if not DMDatabase.FDTableScale.active then
    DMDatabase.FDTableScale.active := true;
  refreshValues;
end;

procedure TFScale.refreshValues;
begin
  EScaleUpdateName.Text := DSScale.DataSet.FieldByName('name').AsString;
  oldName := DSScale.DataSet.FieldByName('name').AsString;
end;

end.
