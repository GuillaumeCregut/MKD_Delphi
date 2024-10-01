unit URandomKit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, System.UITypes, Vcl.Forms, Vcl.Dialogs, UdataModule,
  Vcl.ExtCtrls, Vcl.StdCtrls, Winapi.ShellAPI;

type
  TFRandomKit = class(TForm)
    Label1: TLabel;
    LRandomName: TLabel;
    Label3: TLabel;
    LRandomBrand: TLabel;
    Label5: TLabel;
    LRandomBuilder: TLabel;
    Label7: TLabel;
    LRandomReference: TLabel;
    Label9: TLabel;
    LRandomScale: TLabel;
    Label11: TLabel;
    LRandomCategory: TLabel;
    Label13: TLabel;
    LRandomPeriod: TLabel;
    Label15: TLabel;
    IRandomKit: TImage;
    BRandomMoveKit: TButton;
    LLRandomScalemates: TLinkLabel;
    BRandomOtherKit: TButton;
    procedure FormShow(Sender: TObject);
    procedure BRandomOtherKitClick(Sender: TObject);
    procedure LLRandomScalematesLinkClick(Sender: TObject; const Link: string;
      LinkType: TSysLinkType);
    procedure BRandomMoveKitClick(Sender: TObject);
  private
    { Déclarations privées }
     procedure LoadPicture(name : String);
     procedure randomKitShow();
     procedure ShellOpen(Url: string; Params: string = '');
  public
    { Déclarations publiques }
    idKit: Integer;
  end;

var
  FRandomKit: TFRandomKit;

implementation

{$R *.dfm}
uses
  Vcl.Imaging.pngimage,Vcl.Imaging.jpeg, System.IOUtils;

procedure TFRandomKit.BRandomMoveKitClick(Sender: TObject);
var
  name : String;
begin
  name:= LRandomName.Caption;
  if MessageDlg('Voulez vous déplacer ' + name + ' dans les montages en cours ?', TMsgDlgType.mtWarning,
    [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0, TMsgDlgBtn.mbNo) = mrYes then
  begin
     DMDatabase.moveStock(idKit,DMDatabase.onStash);
     Close;
  end;
end;

procedure TFRandomKit.BRandomOtherKitClick(Sender: TObject);
var
  query : String;
begin
  DMDatabase.SystemQuery.Close;
  query:='SELECT id FROM model_user WHERE state=:status  ORDER BY RANDOM() LIMIT  1;';
  DMDatabase.SystemQuery.Open(query,[DMDatabase.inStock]);
  idKit:=DMDatabase.DSSystem.DataSet.FieldByName('id').AsInteger;
  DMDatabase.SystemQuery.Close;
  randomKitShow;
end;

procedure TFRandomKit.FormShow(Sender: TObject);

begin
  randomKitShow;
end;

procedure TFRandomKit.randomKitShow();
var
  query, picture, scalemates: String;
begin
  query := '''
    SELECT mu.id, m.name, m.reference as reference, m.picture as picture,
    m.scalemates as scalemates, b.name as buildername, br.name as brandname,
    s.name as scalename, p.name as period,
    c.name as category FROM model_user mu INNER JOIN model m ON mu.model_id = m.
    id INNER JOIN builders b ON m.builder = b.id INNER JOIN brand br ON m.
    brand = br.id INNER JOIN scale s ON m.scale = s.id INNER JOIN period p ON m.
    period = p.id INNER JOIN category c ON m.category = c.id WHERE mu.id =:id
  ''';
  DMDatabase.SystemQuery.Open(query,[idKit]);
  scalemates:=DMDatabase.DSSystem.DataSet.FieldByName('scalemates').asString;
  picture:= DMDatabase.DSSystem.DataSet.FieldByName('picture').asString;
  LRandomName.Caption:=DMDatabase.DSSystem.DataSet.FieldByName('name').asString;
  LRandomBuilder.Caption:=DMDatabase.DSSystem.DataSet.FieldByName('buildername').asString;
  LRandomPeriod.Caption:=DMDatabase.DSSystem.DataSet.FieldByName('period').asString;
  LRandomScale.Caption:=DMDatabase.DSSystem.DataSet.FieldByName('scalename').asString;
  LRandomBrand.Caption:=DMDatabase.DSSystem.DataSet.FieldByName('brandname').asString;
  LRandomCategory.Caption:=DMDatabase.DSSystem.DataSet.FieldByName('category').asString;
  LRandomReference.Caption:=DMDatabase.DSSystem.DataSet.FieldByName('reference').asString;
  DMDatabase.SystemQuery.Close;
  if scalemates.Length > 0 then
    LLRandomScalemates.Caption := '<a href="' + scalemates + '">Lien scalemates</a>'
  else
    LLRandomScalemates.caption := '-';
  LoadPicture(picture);
end;

procedure TFRandomKit.LLRandomScalematesLinkClick(Sender: TObject;
  const Link: string; LinkType: TSysLinkType);
begin
  if LLRandomScalemates.Caption<>'-' then
  ShellOpen(Link);
end;

procedure TFRandomKit.LoadPicture(name: String);
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
        IRandomKit.picture.Graphic := Image;
      finally
        RS.Free;
      end;
    finally
      Image.Free;
    end;
  end
  else
  begin
    IRandomKit.Picture.LoadFromFile(picturePath);
  end;
end;

procedure TFRandomKit.ShellOpen(Url, Params: string);
begin
  ShellExecute(0, 'Open', pChar(Url), pChar(Params), nil, SW_SHOWNORMAL);
end;
end.
