unit UCategory;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ComCtrls, Vcl.Grids, System.UITypes,
  Vcl.DBGrids, UdataModule, System.Actions, Vcl.ActnList, Vcl.Menus,
  Vcl.StdCtrls;

type
  TFCategory = class(TForm)
    DBGCategory: TDBGrid;
    PCCategory: TPageControl;
    DSCategory: TDataSource;
    TSCategoryAdd: TTabSheet;
    TSCategoryUpdate: TTabSheet;
    ALCateogry: TActionList;
    ACategoryDelete: TAction;
    PUMCategory: TPopupMenu;
    Supprimer1: TMenuItem;
    ECategoryUpdateName: TEdit;
    ECategoryName: TEdit;
    BCategoryAdd: TButton;
    BCategoryUpdate: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure ACategoryDeleteExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BCategoryAddClick(Sender: TObject);
    procedure BCategoryUpdateClick(Sender: TObject);
  private
    { Déclarations privées }
    oldName: string;
    procedure refreshValues;
  public
    { Déclarations publiques }
  end;

var
  FCategory: TFCategory;

implementation

{$R *.dfm}

procedure TFCategory.ACategoryDeleteExecute(Sender: TObject);
var
  name: string;
begin
  name := DSCategory.DataSet.FieldByName('name').AsString;
  if MessageDlg('Voulez vous supprimer ' + name + ' ?', TMsgDlgType.mtWarning,
    [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0, TMsgDlgBtn.mbNo) = mrYes then
  begin
    DMDatabase.FDTableCategory.Delete;
    refreshValues;
  end;
end;

procedure TFCategory.BCategoryAddClick(Sender: TObject);
var
  newName: String;
begin
  newName := ECategoryName.Text;
  DMDatabase.FDTableCategory.Append;
  DMDatabase.FDTableCategory.FieldByName('name').AsString := newName;
  try
    DMDatabase.FDTableCategory.Post;
  except
    DMDatabase.FDTableCategory.Cancel;
    showMessage('Le nom saisi existe déjà');
  end;
  DMDatabase.FDTableCategory.Refresh;
  refreshValues;
end;



procedure TFCategory.BCategoryUpdateClick(Sender: TObject);
var
  newName: String;
begin
  newName := ECategoryUpdateName.Text;
  DMDatabase.FDTableCategory.Edit;
  DMDatabase.FDTableCategory.FieldByName('name').AsString := newName;
  try
    DMDatabase.FDTableCategory.Post;
  except
    showMessage('Le nom saisi existe déjà');
    DMDatabase.FDTableCategory.Edit;
    DMDatabase.FDTableCategory.FieldByName('name').AsString := oldName;
    DMDatabase.FDTableCategory.Post;
    ECategoryUpdateName.Text := oldName;
  end;
  DMDatabase.FDTableCategory.Refresh;

end;

procedure TFCategory.FormShow(Sender: TObject);
begin
 if not DMDatabase.FDTableCategory.active then
    DMDatabase.FDTableCategory.active := true;
  refreshValues;

end;

procedure TFCategory.refreshValues;
begin
  ECategoryUpdateName.Text := DSCategory.DataSet.FieldByName('name').AsString;
  oldName := DSCategory.DataSet.FieldByName('name').AsString;
end;

end.
