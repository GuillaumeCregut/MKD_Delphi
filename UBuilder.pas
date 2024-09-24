unit UBuilder;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UdataModule, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  System.Actions, Vcl.ActnList, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Menus, Vcl.StdCtrls, Vcl.DBCtrls;

type
  TFBuilder = class(TForm)
    DBGBuilder: TDBGrid;
    PCBuilder: TPageControl;
    TSBuilderAdd: TTabSheet;
    TSBuilderUpdate: TTabSheet;
    DSBuilder: TDataSource;
    FDQBuilderDisplay: TFDQuery;
    ALBuilder: TActionList;
    ABuilberRemove: TAction;
    PUMBuilder: TPopupMenu;
    Supprimer1: TMenuItem;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EBuilderNewName: TEdit;
    BBuilderAdd: TButton;
    DSBuilderCountry: TDataSource;
    DBLCBBuilderCountry: TDBLookupComboBox;
    Label4: TLabel;
    Label5: TLabel;
    EBuilderUpdateName: TEdit;
    BBuilderUpdate: TButton;
    Label6: TLabel;
    DBLCBBuilderUpdateCountry: TDBLookupComboBox;
    procedure ABuilberRemoveExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BBuilderAddClick(Sender: TObject);
    procedure DBGBuilderCellClick(Column: TColumn);
    procedure BBuilderUpdateClick(Sender: TObject);
    procedure EBuilderNewNameExit(Sender: TObject);
    procedure EBuilderNewNameChange(Sender: TObject);
    procedure DBLCBBuilderCountryCloseUp(Sender: TObject);
    procedure EBuilderUpdateNameChange(Sender: TObject);
  private
    { Déclarations privées }
    oldName : string;
    oldCountry : Integer;
    procedure reloadValues;
    procedure refreshValues;
  public
    { Déclarations publiques }
  end;

var
  FBuilder: TFBuilder;

implementation

{$R *.dfm}

procedure TFBuilder.ABuilberRemoveExecute(Sender: TObject);
var
 IdBuilder : Integer;
 query, name : string;
begin
     name := DSBuilder.DataSet.FieldByName('nom').AsString;
  if MessageDlg('Voulez vous supprimer ' + name + ' ?', TMsgDlgType.mtWarning,
    [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0, TMsgDlgBtn.mbNo) = mrYes then
  begin
    idBuilder:=DSBuilder.DataSet.FieldByName('id').AsInteger;
     query:= 'DELETE FROM builders WHERE id=:id';
     DMDatabase.dbConnection.ExecSQL(query,[idBuilder]);
    reloadValues;
    refreshValues;
  end;
end;

procedure TFBuilder.BBuilderAddClick(Sender: TObject);
var
  idCountry : Integer;
  name, query : String;
begin
 idCountry := DBLCBBuilderCountry.ListSource.DataSet.FieldByName('id').AsInteger;
 name := EBuilderNewName.Text;
 query := 'INSERT INTO builders (name, country) VALUES(:n,:c)';
  try
     DMDatabase.dbConnection.ExecSQL(query,[name,idCountry]);
  except
    showMessage('Le nom saisi existe déjà');
  end;
 reloadValues;
 refreshValues;
end;

procedure TFBuilder.BBuilderUpdateClick(Sender: TObject);
var
name : String ;
idNewCountry : Integer;
begin
   name:=EBuilderUpdateName.Text;
   idNewCountry:= DBLCBBuilderUpdateCountry.ListSource.DataSet.FieldByName('id').AsInteger;
   showMessage(IntToStr(idNewCountry));
end;

procedure TFBuilder.DBGBuilderCellClick(Column: TColumn);
begin
    oldName:= DSBuilder.DataSet.FieldByName('nom').AsString;
    oldCountry:=  DSBuilder.DataSet.FieldByName('country').AsInteger;
    refreshValues;
end;

procedure TFBuilder.DBLCBBuilderCountryCloseUp(Sender: TObject);
var
  newName : string;
begin
    newName :=  EBuilderNewName.Text;
    BBuilderAdd.Enabled:=(newName.Length>0) and (DBLCBBuilderCountry.Text.Length> 0) ;
end;

procedure TFBuilder.EBuilderNewNameChange(Sender: TObject);
var
  newName : string;
begin
     newName :=  EBuilderNewName.Text;
     BBuilderAdd.Enabled:=(newName.Length>0) and (DBLCBBuilderCountry.Text.Length> 0) ;
end;

procedure TFBuilder.EBuilderNewNameExit(Sender: TObject);
var
  newName : string;
begin
    newName :=  EBuilderNewName.Text;
    BBuilderAdd.Enabled:=(newName.Length>0) and (DBLCBBuilderCountry.Text.Length> 0) ;
end;

procedure TFBuilder.EBuilderUpdateNameChange(Sender: TObject);
var
  name : string;
begin
    name := EBuilderUpdateName.Text;
    BBuilderUpdate.Enabled:=name.Length>0;
end;

procedure TFBuilder.FormShow(Sender: TObject);
begin
   if not FDQBuilderDisplay.Active then
   begin
      FDQBuilderDisplay.Active:=true;
      DBGBuilder.DataSource.DataSet.First;
      DBGBuilderCellClick(nil);
   end;

   if not DMDatabase.FDTableCountry.Active then
     DMDatabase.FDTableCountry.Active:=true;
   DMDatabase.FDTableCountry.First;
   DBLCBBuilderCountry.ListSource.DataSet.First;
   if DBLCBBuilderCountry.Text.Length= 0 then
       BBuilderAdd.Enabled:=false;
   refreshValues;
end;

procedure TFBuilder.refreshValues;
begin
  EBuilderUpdateName.Text := DBGBuilder.DataSource.DataSet.FieldByName('nom').AsString;
end;

procedure TFBuilder.reloadValues;
begin
   if FDQBuilderDisplay.Active then
    FDQBuilderDisplay.Active:=false;
    //Do some stuff here
    FDQBuilderDisplay.Active:=true;
end;

end.
