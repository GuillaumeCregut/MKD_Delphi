unit UModelDetail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, UdataModule, Vcl.DBCtrls, Winapi.ShellAPI;

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
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LLModelDetailLinkClick(Sender: TObject; const Link: string;
      LinkType: TSysLinkType);
  private
    { D�clarations priv�es }
    procedure ShellOpen(Url: string; Params: string = '');
  public
    { D�clarations publiques }
    idModel: Integer;
  end;

var
  FModelDetail: TFModelDetail;

implementation

{$R *.dfm}

uses
  Vcl.Imaging.pngimage,Vcl.Imaging.jpeg, System.IOUtils;

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

end;

procedure TFModelDetail.LLModelDetailLinkClick(Sender: TObject;
  const Link: string; LinkType: TSysLinkType);
begin
  ShellOpen(Link);
end;

procedure TFModelDetail.ShellOpen(Url, Params: string);
begin
  ShellExecute(0, 'Open', pChar(Url), pChar(Params), nil, SW_SHOWNORMAL);
end;

end.
