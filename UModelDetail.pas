unit UModelDetail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,System.UITypes,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, UdataModule, Vcl.DBCtrls, Winapi.ShellAPI, Vcl.Grids,
  Vcl.DBGrids;

type
  TFModelDetail = class(TForm)
    IModelDetailPicture: TImage;
    FDQModelDetail: TFDQuery;
    DSModelDetail: TDataSource;
    DBTModelCategory: TDBText;
    DBTModelBuilder: TDBText;
    DBTModelScale: TDBText;
    DBTModelBrand: TDBText;
    DBTModelPeriod: TDBText;
    DBTModelName: TDBText;
    DBTModelRef: TDBText;
    DBTModelCountry: TDBText;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    LLModelDetail: TLinkLabel;
    BModelDetailAddStock: TButton;
    BModelDetailAddLike: TButton;
    FDQModelFavorite: TFDQuery;
    DSFavorite: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LLModelDetailLinkClick(Sender: TObject; const Link: string;
      LinkType: TSysLinkType);
    procedure BModelDetailAddLikeClick(Sender: TObject);
    procedure BModelDetailAddStockClick(Sender: TObject);
  private
    { Déclarations privées }
    isWhish : boolean;
    idModelStock : Integer;
    procedure ShellOpen(Url: string; Params: string = '');
    procedure reloadValues;
  public
    { Déclarations publiques }
    idModel: Integer;
  end;

var
  FModelDetail: TFModelDetail;

implementation

{$R *.dfm}

uses
  Vcl.Imaging.pngimage,Vcl.Imaging.jpeg, System.IOUtils;

procedure TFModelDetail.BModelDetailAddLikeClick(Sender: TObject);
var
  idStock : Integer;
begin
  if isWhish then
  begin
    if idModelStock<>0 then
    begin
       DMDatabase.moveStock(idModelStock,0);
       BModelDetailAddLike.Caption:='Ajouter aux favoris';
    end;
  end
  else
  begin
    idStock:=DMDatabase.wishes;
    DMDatabase.addKitInStock(idModel,idStock);
    BModelDetailAddLike.Caption:='Supprimer des favoris';
  end;
  isWhish:= not isWhish;
  reloadValues;
end;

procedure TFModelDetail.BModelDetailAddStockClick(Sender: TObject);
var
  name : String;
begin
  name := DBTModelName.Caption;
  if MessageDlg('Voulez vous Ajouter ' + name + ' dans votre stock?', TMsgDlgType.mtWarning,
    [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0, TMsgDlgBtn.mbNo) = mrYes then
  begin
  try
     DMDatabase.addKitInStock(idModel,DMDatabase.inStock);
     showMessage('Modèle ajouté au stock');
  except

  end;
  end;
end;

procedure TFModelDetail.FormCreate(Sender: TObject);
begin
  idModel := 0;
end;

procedure TFModelDetail.FormShow(Sender: TObject);
var
  picture, scalemates, picturePath: string;
  RS: TResourceStream;
  Image: TPngImage;
begin
  idModelStock:=0;
  FDQModelDetail.Active := false;
  FDQModelDetail.Params[0].Value := idModel;
  FDQModelDetail.Active := true;
  picture := DSModelDetail.DataSet.FieldByName('picture').AsString;
  picturePath := TPath.Combine(ExtractFileDir(Application.ExeName),'pictures',picture);
  scalemates := DSModelDetail.DataSet.FieldByName('scalemates').AsString;
  if scalemates.Length > 0 then
    LLModelDetail.Caption := '<a href="' + scalemates + '">Lien scalemates</a>'
  else
    LLModelDetail.Visible := false;
  if not FileExists(picturePath) then
  begin
    Image := TPngImage.Create;
    try
      RS := TResourceStream.Create(hInstance, 'No_image', RT_RCDATA);
      try
        Image.LoadFromStream(RS);
        IModelDetailPicture.picture.Graphic := Image;
      finally
        RS.Free;
      end;
    finally
      Image.Free;
    end;
  end
  else
  begin
    IModelDetailPicture.Picture.LoadFromFile(picturePath);
  end;
  //Get if model is liked
  reloadValues;
end;

procedure TFModelDetail.LLModelDetailLinkClick(Sender: TObject;
  const Link: string; LinkType: TSysLinkType);
begin
  ShellOpen(Link);
end;

procedure TFModelDetail.reloadValues;
begin
  FDQModelFavorite.Close;
  FDQModelFavorite.Open('SELECT count(*) as number, id FROM model_user WHERE model_id=:id and state=:state',[idModel, DMDatabase.wishes]);
  isWhish:=DSFavorite.DataSet.FieldByName('number').AsInteger>0;
  if isWhish then begin
    BModelDetailAddLike.Caption:='Supprimer des favoris';
    idModelStock:=DSFavorite.DataSet.FieldByName('id').AsInteger;
  end
  else
    BModelDetailAddLike.Caption:='Ajouter aux favoris'
end;

procedure TFModelDetail.ShellOpen(Url, Params: string);
begin
  ShellExecute(0, 'Open', pChar(Url), pChar(Params), nil, SW_SHOWNORMAL);
end;

end.
