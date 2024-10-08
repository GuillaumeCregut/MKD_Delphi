unit UPpale;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Menus, Vcl.ComCtrls, System.IniFiles, FireDAC.Comp.Client, Vcl.StdCtrls,
  UBrand, UCountry, UCategory, UPeriod, UScale, UBuilder, Umodel, UStockGlobal,
  UFinishedKit, URandomKit;

type
  TFPpale = class(TForm)
    MainMenu1: TMainMenu;
    Bonjour1: TMenuItem;
    Profil1: TMenuItem;
    Kits1: TMenuItem;
    Systme1: TMenuItem;
    Pays1: TMenuItem;
    Pays2: TMenuItem;
    Catgories1: TMenuItem;
    Catgories2: TMenuItem;
    Constructeurs1: TMenuItem;
    Marques1: TMenuItem;
    Marques2: TMenuItem;
    Fournisseurs1: TMenuItem;
    Fournisseurs2: TMenuItem;
    Statistiques1: TMenuItem;
    Statistiques2: TMenuItem;
    Vuegnrale1: TMenuItem;
    Kitscommands1: TMenuItem;
    KitsStock: TMenuItem;
    Kitsencours1: TMenuItem;
    Choisirunkit1: TMenuItem;
    Choisirunkit2: TMenuItem;
    Exporterlabase1: TMenuItem;
    SBMain: TStatusBar;
    Quitter1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Marques1Click(Sender: TObject);
    procedure Pays1Click(Sender: TObject);
    procedure Catgories1Click(Sender: TObject);
    procedure Pays2Click(Sender: TObject);
    procedure Catgories2Click(Sender: TObject);
    procedure Quitter1Click(Sender: TObject);
    procedure Constructeurs1Click(Sender: TObject);
    procedure Marques2Click(Sender: TObject);
    procedure Vuegnrale1Click(Sender: TObject);
    procedure KitsStockClick(Sender: TObject);
    procedure Kitscommands1Click(Sender: TObject);
    procedure Kitsencours1Click(Sender: TObject);
    procedure Choisirunkit2Click(Sender: TObject);
    procedure Choisirunkit1Click(Sender: TObject);
  private
    { D�clarations priv�es }
    isSetup: boolean;
    procedure saveIniFile(dbPath: string);
    procedure initDatabase(path: string);
    procedure startDB(dataPath: String);
  public
    { D�clarations publiques }
  end;

var
  FPpale: TFPpale;

implementation

{$R *.dfm}

uses UdataModule, System.IOUtils, UFormValues, UKitInStock;

procedure TFPpale.initDatabase(path: string);
var
  query: string;
  List: TStringList;
  Stream: TResourceStream;
  I: integer;
begin
  DMDatabase.dbConnection.Params.Database := path;
  Stream := TResourceStream.Create(HInstance, 'Resource_1', RT_RCDATA);
  try
    try
      List := TStringList.Create;
      try
        List.LoadFromStream(Stream, TEncoding.UTF8);
        for I := 0 to List.Count - 1 do
        begin
          query := List[I];
          DMDatabase.dbConnection.ExecSQL(query);
        end;
      finally
        List.Free;
      end;
    finally
      Stream.Free;
    end;
    isSetup := true;
  except
    showMessage
      ('Une erreur est survenue au moment de l''initialisation de la base');
    isSetup := false;
  end;
  DMDatabase.dbConnection.Close;
end;

procedure TFPpale.Kitscommands1Click(Sender: TObject);
begin
   FKitInStock.myValues.caption:='Kit command�s';
  FKitInStock.myValues.stock:=DMDatabase.buyed;
  FKitInStock.ShowModal;
end;

procedure TFPpale.KitsStockClick(Sender: TObject);
begin
  FKitInStock.myValues.caption:='Kit en stock';
  FKitInStock.myValues.stock:=DMDatabase.inStock;
  FKitInStock.ShowModal;
end;

procedure TFPpale.Kitsencours1Click(Sender: TObject);
begin
    FKitInStock.myValues.caption:='Kit en cours';
  FKitInStock.myValues.stock:=DMDatabase.onStash;
  FKitInStock.ShowModal;
end;

procedure TFPpale.Marques1Click(Sender: TObject);
begin
  FBrand.ShowModal;
end;

procedure TFPpale.Marques2Click(Sender: TObject);
begin
      FModel.ShowModal;
end;

procedure TFPpale.Pays1Click(Sender: TObject);
begin
    FCountry.ShowModal;
end;

procedure TFPpale.Pays2Click(Sender: TObject);
begin
  FPeriod.ShowModal;
end;

procedure TFPpale.Quitter1Click(Sender: TObject);
begin
 FPpale.Close;
end;

procedure TFPpale.saveIniFile(dbPath: string);
var
  settingsFile: TIniFile;
begin
  settingsFile := TIniFile.Create(ChangeFileExt(Application.ExeName, '.ini'));
  try
    settingsFile.WriteString('setup', 'version', '1.0a');
    settingsFile.WriteBool('init', 'setup', isSetup);
    settingsFile.WriteString('db', 'path', dbPath);
  finally
    settingsFile.Free;
  end;
end;

procedure TFPpale.Catgories1Click(Sender: TObject);
begin
    FCategory.ShowModal;
end;

procedure TFPpale.Catgories2Click(Sender: TObject);
begin
  FScale.ShowModal;
end;

procedure TFPpale.Choisirunkit1Click(Sender: TObject);
var
  query : String;
  idKit : Integer;
begin
  DMDatabase.SystemQuery.Close;
  query:='SELECT id FROM model_user WHERE state=:status  ORDER BY RANDOM() LIMIT  1;';
  DMDatabase.SystemQuery.Open(query,[DMDatabase.inStock]);
  idKit:=DMDatabase.DSSystem.DataSet.FieldByName('id').AsInteger;
  DMDatabase.SystemQuery.Close;
  FRandomKit.idKit:=idKit;
  FRandomKit.ShowModal;
end;

procedure TFPpale.Choisirunkit2Click(Sender: TObject);
begin
  FFinishedKit.ShowModal;
end;

procedure TFPpale.Constructeurs1Click(Sender: TObject);
begin
  FBuilder.ShowModal;
end;

procedure TFPpale.FormCreate(Sender: TObject);
var
  settingsFile: TIniFile;
  dataPath: string;
begin
  if(not DirectoryExists(TPath.Combine(ExtractFileDir(Application.ExeName),'pictures')))  then
  begin
    TDirectory.CreateDirectory(TPath.Combine(ExtractFileDir(Application.ExeName),'pictures'));
  end;
  settingsFile := TIniFile.Create(ChangeFileExt(Application.ExeName, '.ini'));
  try
    isSetup := settingsFile.ReadBool('init', 'setup', false);
    dataPath := settingsFile.ReadString('db', 'path',
      ChangeFileExt(Application.ExeName, '.db'));

  finally
    settingsFile.Free;
  end;
  if not FileExists(dataPath) then
    isSetup := false;
  if not isSetup then
  begin
    showMessage('La base de donn�es n''a pas �t� trouv�e, elle va �tre cr��e');
    initDatabase(dataPath);
    saveIniFile(dataPath);
  end;
  if not FileExists(dataPath) then
  begin
    raise Exception.Create
      ('Un probl�me a �t� rencontr� avec la base de donn�es.');
  end;
  startDB(dataPath);
end;

procedure TFPpale.startDB(dataPath: String);
begin
  DMDatabase.dbConnection.Close;
  DMDatabase.dbConnection.Params.Database := dataPath;
  DMDatabase.dbConnection.Open;
  while ( not DMDatabase.dbConnection.Connected) do
  begin
    Application.ProcessMessages;
  end;
  DMDatabase.connectTables;
end;

procedure TFPpale.Vuegnrale1Click(Sender: TObject);
begin
  FStockGlobal.ShowModal;
end;

end.
