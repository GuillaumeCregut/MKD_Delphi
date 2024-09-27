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
  Vcl.Menus, Vcl.Mask, Vcl.ExtCtrls, UModelDetail, Vcl.ExtDlgs;

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
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
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
    OPDModel: TOpenPictureDialog;
    IModelUpdateImage: TImage;
    IModelNewImage: TImage;
    procedure AModelDeleteExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BModelAddClick(Sender: TObject);
    procedure AModelShowDetailsExecute(Sender: TObject);
    procedure BModelUpdateClick(Sender: TObject);
    procedure DBGModelCellClick(Column: TColumn);
    procedure IModelUpdateImageClick(Sender: TObject);
    procedure SavePicture(src: string; dest: string; image: TImage);
    procedure IModelNewImageClick(Sender: TObject);
    procedure TSModelAddShow(Sender: TObject);
  private
    { Déclarations privées }
    newPicturePath : string;
    procedure reloadValues;
    procedure getPicture(name: string='');
    procedure resetNewPicture();
    function createPictureName(name:string; id: integer) : string;
  public
    { Déclarations publiques }
  end;

var
  FModel: TFModel;

implementation

{$R *.dfm}
uses
 Vcl.Imaging.pngimage,Vcl.Imaging.jpeg, System.IOUtils;

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
  FModelDetail.idModel:=DSModel.DataSet.FieldByName('id').AsInteger;
  FmodelDetail.ShowModal;
end;

procedure TFModel.BModelAddClick(Sender: TObject);
var
  newName, newRef, NewPicture, newScaleMates: string;
  newScale, newPeriod, newCategory, newBrand, newBuilder,lastInsertId: Integer;
begin
  newName := EModelName.Text;
  newRef := EModelRef.Text;
  newScaleMates := EModelScalemates.Text;
  if (newName.Length = 0) or (newRef.Length < 0) then
  begin
    showMessage('Veuillez saisir le nom et la référence');
    exit;
  end;
  DMDatabase.FDTableModel.Last;
  lastInsertId:=  DMDatabase.FDTableModel.FieldByName('id').asInteger+1;
  NewPicture := createPictureName(newName,lastInsertId);
  newScale := DSModelScale.DataSet.FieldByName('id').asInteger;
  newPeriod := DSModelPeriod.DataSet.FieldByName('id').asInteger;
  newCategory := DSModelCategory.DataSet.FieldByName('id').asInteger;
  newBrand := DSModelBrand.DataSet.FieldByName('id').asInteger;
  newBuilder := DSModelBuilder.DataSet.FieldByName('id').asInteger;
  if(DBLCBModelBrand.Text='') OR(DBLCBModelPeriod.Text='') OR(DBLCBModelScale.Text='') OR (DBLCBModelCategory.Text='') OR (DBLCBModelBuilder.Text='') then
  begin
     showMessage('Veuillez indiquer toutes les informations');
     exit;
  end;
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
      //Save Picture
      try
        if(OPDModel.FileName<>'') then
        begin
           SavePicture(OPDModel.FileName,NewPicture,IModelNewImage);
        end;
      except
         showMessage('Une erreur est survenue lors de la création de l''image');
      end;
      EModelName.Text:='';
      EModelRef.Text:='';
      EModelScalemates.Text:='';
      IModelNewImage.Picture:=nil;
      OPDModel.FileName:='';
  except
      DMDatabase.FDTableModel.Cancel;
    showMessage('Le modèle saisi existe déjà');
  end;
  DMDatabase.FDTableModel.Refresh;
  reloadValues;

end;

procedure TFModel.BModelUpdateClick(Sender: TObject);
var
  newName, newRef, NewPicture, newScaleMates, query, oldPicture: string;
  newScale, newPeriod, newCategory, newBrand, newBuilder, idModel: Integer;
begin
  IdModel:=DSModel.DataSet.FieldByName('id').AsInteger;
  newName := DBEModelNewName.Text;
  newRef := DBEModelNewRef.Text;
  oldPicture:= DSModel.DataSet.FieldByName('picture').AsString;
  newScaleMates := DBEModelScalemates.Text;
  if(oldPicture='') AND (newPicturePath<>'') then
  begin
     //create new name
     newPicture:= createPictureName(newName,Idmodel);
  end
  else
  begin
     NewPicture := oldPicture;
  end;

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
   SavePicture(newPicturePath,newPicture,IModelUpdateImage);
   newPicturePath:='';
   reloadValues;
end;

function TFModel.createPictureName(name: string; id: integer): string;
var
  namePicture : string;
begin
// TODO : remove space and specail char
    namePicture:=IntToStr(id)+'_'+name+intToStr(Random(100))+'.png';
    result:=namePicture;
end;

procedure TFModel.DBGModelCellClick(Column: TColumn);
var
  picture: string;
begin
   picture:=DSModel.DataSet.FieldByName('picture').AsString;
   getPicture(picture);
end;

procedure TFModel.FormShow(Sender: TObject);
begin
  resetNewPicture;
  IModelUpdateImage.Picture:=nil;
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
  end;
end;

procedure TFModel.getPicture(name: string);
var
  picturePath: string;
  RS: TResourceStream;
  Image: TPngImage;
  isPictureOK : boolean;
begin
  isPictureOK:= false;
  if not (name='') then
  begin
    picturePath := TPath.Combine(ExtractFileDir(Application.ExeName),'pictures',name);
    isPictureOk:=FileExists(picturePath);
  end;

  if isPictureOK then
  begin
       IModelUpdateImage.Picture.LoadFromFile(picturePath);
  end
  else
  begin
     Image := TPngImage.Create;
    try
      RS := TResourceStream.Create(hInstance, 'No_image', RT_RCDATA);
      try
        Image.LoadFromStream(RS);
        IModelUpdateImage.picture.Graphic := Image
      finally
        RS.Free;
      end;
    finally
      Image.Free;
    end;
  end;
end;

procedure TFModel.IModelNewImageClick(Sender: TObject);
var
  path : string;
begin
  if OPDModel.Execute() then
  begin
    path:=OPDModel.FileName;
    newPicturePath:=path;
    IModelNewImage.Picture.LoadFromFile(path);
  end;

end;

procedure TFModel.IModelUpdateImageClick(Sender: TObject);
var
  path : string;
begin
  if OPDModel.Execute() then
  begin
    path:=OPDModel.FileName;
    newPicturePath:=path;
    IModelUpdateImage.Picture.LoadFromFile(path);
  end;

end;

procedure TFModel.reloadValues;
begin
  if FDQModel.Active then
    FDQModel.Active := false;
  FDQModel.Active:=true;
  newPicturePath:='';
end;

procedure TFModel.resetNewPicture;
var
  RS: TResourceStream;
  Image: TPngImage;
begin
  Image := TPngImage.Create;
    try
      RS := TResourceStream.Create(hInstance, 'No_image', RT_RCDATA);
      try
        Image.LoadFromStream(RS);
        IModelNewImage.picture.Graphic := Image
      finally
        RS.Free;
      end;
    finally
      Image.Free;
    end;
end;

procedure TFModel.SavePicture(src, dest: string; image: TImage);
var
  ext, destPath: string;
  MyBMPImage : TBitmap;
  MyPngImage : TPngImage;
  ratio : single;
  newHeight : integer;
begin
   ext := TPath.GetExtension(src);
   destPath:=TPath.Combine(ExtractFileDir(Application.ExeName),'pictures')+TPath.DirectorySeparatorChar;
   //IModelUpdateImage.Picture.SaveToFile(destPath+dest);
   MyBMPImage:=TBitmap.Create;
   try
     MyBMPImage.Assign(image.Picture.Graphic);
     ratio:=MyBMPImage.Width/320;
     newHeight:=round(MyBMPImage.Height/ratio);
     MyPngImage:=TPngImage.Create;
     try
        MyPngImage.Assign(MyBMPImage);
         MyPngImage.Canvas.StretchDraw(Rect(0,0,320,newHeight),MyPngImage );
         MyPngImage.Resize(320,newHeight);
        MyPngImage.SaveToFile(destPath+dest);
     finally
        MyPngImage.Free;
     end;
   finally
     MyBMPImage.free;
   end;
end;



procedure TFModel.TSModelAddShow(Sender: TObject);
begin
  OPDModel.FileName:='';
end;

end.
