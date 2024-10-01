unit UFinishedDetail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UdataModule, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFFinishedDetail = class(TForm)
    FDQFinishedDetail: TFDQuery;
    DSFinishedDetail: TDataSource;
    LFinishedDetailName: TLabel;
    LFinishedDetailStartTime: TLabel;
    LFinishedDetailEndTime: TLabel;
    LFinishedDetailBuilder: TLabel;
    LFinishedDetailBrand: TLabel;
    LFinishedDetailScale: TLabel;
    LFinishedDetailPeriod: TLabel;
    LFinishedDetailProvider: TLabel;
    LFinishedDetailCategory: TLabel;
    LFinishedDetailPrice: TLabel;
    LFinishedDetailReference: TLabel;
    IFinishedImage: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    procedure FormHide(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    idModel: Integer;
    { Déclarations privées }
  public
    idKit: Integer;
    procedure LoadPicture(name : String);
    { Déclarations publiques }
  end;

var
  FFinishedDetail: TFFinishedDetail;

implementation

{$R *.dfm}
uses
  Vcl.Imaging.pngimage,Vcl.Imaging.jpeg, System.IOUtils;

procedure TFFinishedDetail.FormHide(Sender: TObject);
begin
  idKit := 0;
  FDQFinishedDetail.Close;
end;

procedure TFFinishedDetail.FormShow(Sender: TObject);
var
  query, picture, link: String;
begin
  FDQFinishedDetail.Close;
  query := '''
    SELECT mu.id, mu.model_id, mu.start_time, mu.end_time, m.name, m.reference
    as reference, m.picture as picture, m.scalemates as scalemates,
    mu.price as price, b.name as buildername, br.name as brandname,
    s.name as scalename, p.name as period, pr.name as provider,
    c.name as category FROM model_user mu LEFT JOIN provider pr ON mu.provider =
    pr.id INNER JOIN model m ON mu.model_id = m.id INNER JOIN builders b ON m.
    builder = b.id INNER JOIN brand br ON m.brand = br.id INNER JOIN scale s ON
    m.scale = s.id INNER JOIN period p ON m.period = p.id INNER JOIN category c
    ON m.category = c.id WHERE mu.id = :status;
  ''';
  FDQFinishedDetail.SQL.Clear;
  FDQFinishedDetail.Params.Clear;
  FDQFinishedDetail.SQL.Add(query);
  FDQFinishedDetail.Params[0].value := idKit;
  FDQFinishedDetail.Open;
  idModel := DSFinishedDetail.DataSet.FieldByName('model_id').AsInteger;
  LFinishedDetailName.caption := DSFinishedDetail.DataSet.FieldByName
    ('name').AsString;
  LFinishedDetailStartTime.caption := DSFinishedDetail.DataSet.FieldByName
    ('start_time').AsString;
  LFinishedDetailEndTime.caption := DSFinishedDetail.DataSet.FieldByName
    ('end_time').AsString;
  LFinishedDetailBuilder.caption := DSFinishedDetail.DataSet.FieldByName
    ('buildername').AsString;
  LFinishedDetailBrand.caption := DSFinishedDetail.DataSet.FieldByName
    ('brandname').AsString;
  LFinishedDetailCategory.caption := DSFinishedDetail.DataSet.FieldByName
    ('category').AsString;
  LFinishedDetailPeriod.caption := DSFinishedDetail.DataSet.FieldByName
    ('period').AsString;
  LFinishedDetailScale.caption := DSFinishedDetail.DataSet.FieldByName
    ('scalename').AsString;
  LFinishedDetailReference.Caption := DSFinishedDetail.DataSet.FieldByName('reference').AsString;
  if DSFinishedDetail.DataSet.FieldByName('provider').AsString <> '' then
  begin
    LFinishedDetailProvider.caption := DSFinishedDetail.DataSet.FieldByName
      ('provider').AsString + ' euros';
  end
  else
    LFinishedDetailProvider.caption := '-';
  if DSFinishedDetail.DataSet.FieldByName('price').AsString <> '' then
    LFinishedDetailPrice.caption := DSFinishedDetail.DataSet.FieldByName
      ('price').AsString
  else
    LFinishedDetailPrice.caption := '-';
  link:=DSFinishedDetail.DataSet.FieldByName('scalemates').AsString;;
  picture:=DSFinishedDetail.DataSet.FieldByName('picture').AsString;;
  FDQFinishedDetail.Close;
  LoadPicture(picture);
end;

procedure TFFinishedDetail.LoadPicture(name: String);
var
  picturePath: string;
  RS: TResourceStream;
  Image: TPngImage;
begin
picturePath := TPath.Combine(ExtractFileDir(Application.ExeName),'pictures',name);
  if not FileExists(picturePath) then
  begin
    Image := TPngImage.Create;
    try
      RS := TResourceStream.Create(hInstance, 'No_image', RT_RCDATA);
      try
        Image.LoadFromStream(RS);
        IFinishedImage.picture.Graphic := Image;
      finally
        RS.Free;
      end;
    finally
      Image.Free;
    end;
  end
  else
  begin
    IFinishedImage.Picture.LoadFromFile(picturePath);
  end;
end;

end.
