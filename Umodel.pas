unit Umodel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UdataModule, FireDAC.Stan.Intf,
  System.UITypes,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ComCtrls, Vcl.Grids,
  Vcl.DBGrids, System.Actions, Vcl.ActnList, Vcl.DBCtrls, Vcl.StdCtrls,
  Vcl.Menus, Vcl.Mask, Vcl.ExtCtrls;

type
  TFModel = class(TForm)
    DSModel: TDataSource;
    FDQModel: TFDQuery;
    DBGModel: TDBGrid;
    PCModel: TPageControl;
    TSModelAdd: TTabSheet;
    TSModelUpdate: TTabSheet;
    ALModel: TActionList;
    AModelDelete: TAction;
    PUMModel: TPopupMenu;
    Supprimer1: TMenuItem;
    Label1: TLabel;
    EModelName: TEdit;
    EModelRef: TEdit;
    EModelScalemates: TEdit;
    TempoPicture: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    BModelAdd: TButton;
    DBLCBModelScale: TDBLookupComboBox;
    DBLCBModelBrand: TDBLookupComboBox;
    DBLCBModelPeriod: TDBLookupComboBox;
    DBLCBModelBuilder: TDBLookupComboBox;
    DBLCBModelCategory: TDBLookupComboBox;
    DSModelScale: TDataSource;
    DSModelBrand: TDataSource;
    DSModelBuilder: TDataSource;
    DSModelPeriod: TDataSource;
    DSModelCategory: TDataSource;
    Label11: TLabel;
    DBLCBModelNewScale: TDBLookupComboBox;
    Label12: TLabel;
    DBLCBModelNewBrand: TDBLookupComboBox;
    Label13: TLabel;
    Label14: TLabel;
    DBLCBModelNewPeriod: TDBLookupComboBox;
    Label15: TLabel;
    DBLCBModelNewCategory: TDBLookupComboBox;
    DBEModelNewName: TDBEdit;
    DBEModelScalemates: TDBEdit;
    DBEModelNewRef: TDBEdit;
    DBEdit4: TDBEdit;
    DBLCBModelNewBuilder: TDBLookupComboBox;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    BModelUpdate: TButton;
    AModelShowDetails: TAction;
    Voirlesdtails1: TMenuItem;
    procedure AModelDeleteExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGModelCellClick(Column: TColumn);
    procedure BModelAddClick(Sender: TObject);
    procedure AModelShowDetailsExecute(Sender: TObject);
    procedure BModelUpdateClick(Sender: TObject);
  private
    { Déclarations privées }
    procedure reloadValues;
  public
    { Déclarations publiques }
  end;

var
  FModel: TFModel;

implementation

{$R *.dfm}

procedure TFModel.AModelDeleteExecute(Sender: TObject);
var
  id : Integer;
  query : string;
begin
  id:=DSModel.DataSet.FieldByName('id').AsInteger;
  query := 'DELETE FROM model WHERE id=:id';
  DMDatabase.dbConnection.ExecSQL(query,[id]);
  reloadValues;
end;

procedure TFModel.AModelShowDetailsExecute(Sender: TObject);
begin
//
end;

procedure TFModel.BModelAddClick(Sender: TObject);
var
  newName, newRef, NewPicture, newScaleMates: string;
  newScale, newPeriod, newCategory, newBrand, newBuilder: Integer;
begin
  newName := EModelName.Text;
  newRef := EModelRef.Text;
  newScaleMates := EModelScalemates.Text;
  NewPicture := TempoPicture.Text;
  if (newName.Length = 0) or (newRef.Length < 0) then
  begin
    showMessage('Veuillez saisir le nom et la référence');
    exit;
  end;
  newScale := DSModelScale.DataSet.FieldByName('id').asInteger;
  newPeriod := DSModelPeriod.DataSet.FieldByName('id').asInteger;
  newCategory := DSModelCategory.DataSet.FieldByName('id').asInteger;
  newBrand := DSModelBrand.DataSet.FieldByName('id').asInteger;
  newBuilder := DSModelBuilder.DataSet.FieldByName('id').asInteger;
  DMDatabase.FDTableModel.Append;
  DMDatabase.FDTableModel.FieldByName('name').asString:= newName;
  DMDatabase.FDTableModel.FieldByName('reference').asString:=newRef;
  DMDatabase.FDTableModel.FieldByName('scalemates').asString:= newScaleMates;
  DMDatabase.FDTableModel.FieldByName('picture').asString:=NewPicture;
  DMDatabase.FDTableModel.FieldByName('scale').asInteger:= newScale;
  DMDatabase.FDTableModel.FieldByName('period').asInteger:=newPeriod;
  DMDatabase.FDTableModel.FieldByName('brand').asInteger:=newBrand;
  DMDatabase.FDTableModel.FieldByName('category').asInteger:=newCategory;
  DMDatabase.FDTableModel.FieldByName('builder').asInteger:=newBuilder;

  try
      DMDatabase.FDTableModel.Post;
  except
      DMDatabase.FDTableModel.Cancel;
    showMessage('Le modèle saisi existe déjà');
  end;
  DMDatabase.FDTableModel.Refresh;
  reloadValues;

end;

procedure TFModel.BModelUpdateClick(Sender: TObject);
var
  newName, newRef, NewPicture, newScaleMates, query: string;
  newScale, newPeriod, newCategory, newBrand, newBuilder, idModel: Integer;
begin
    newName := DBEModelNewName.Text;
  newRef := DBEModelNewRef.Text;
  newScaleMates := DBEModelScalemates.Text;
  NewPicture := DBEdit4.Text;
  IdModel:=DSModel.DataSet.FieldByName('id').AsInteger;
  if (newName.Length = 0) or (newRef.Length < 0) then
  begin
    showMessage('Veuillez saisir le nom et la référence');
    exit;
  end;
   newScale := DBLCBModelNewScale.ListSource.DataSet.FieldByName('id').asInteger;
  newPeriod := DBLCBModelNewPeriod.ListSource.DataSet.FieldByName('id').asInteger;
  newCategory := DBLCBModelNewCategory.ListSource.DataSet.FieldByName('id').asInteger;
  newBrand := DBLCBModelNewBrand.ListSource.DataSet.FieldByName('id').asInteger;
  newBuilder := DBLCBModelNewBuilder.ListSource.DataSet.FieldByName('id').asInteger;
  query:='''
    UPDATE model SET
    name=:name,
    reference=:reference,
    scalemates=:scalem,
    picture=:picture,
    brand=:brand,
    builder=:builder,
    category=:category,
    period=:period,
    scale=:scale
    WHERE id=:id;
   ''';
   DMDatabase.dbConnection.ExecSQL(query,
   [newName,
   newRef,
   newScaleMates,
   NewPicture,
   newBrand,
   newBuilder,
   newCategory,
   newPeriod,
   newScale,
   IdModel]);
   reloadValues;
end;

procedure TFModel.DBGModelCellClick(Column: TColumn);
begin
  //
end;

procedure TFModel.FormShow(Sender: TObject);
begin
  DMDatabase.FDTableBrand.Active := true;
  DMDatabase.FDTableBuilder.Active := true;
  DMDatabase.FDTableCategory.Active := true;
  DMDatabase.FDTableCountry.Active := true;
  DMDatabase.FDTableModel.Active := true;
  DMDatabase.FDTablePeriod.Active := true;
  DMDatabase.FDTableScale.Active := true;
  if not FDQModel.Active then
  begin
    FDQModel.Active := true;
    DBGModel.DataSource.DataSet.First;
    DBGModelCellClick(nil);
  end;
end;

procedure TFModel.reloadValues;
begin
  if FDQModel.Active then
    FDQModel.Active := false;
  FDQModel.Active:=true;
end;

end.
