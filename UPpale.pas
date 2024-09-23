unit UPpale;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Menus, Vcl.ComCtrls, System.IniFiles, FireDAC.Comp.Client, Vcl.StdCtrls,
  UBrand, UCountry;

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
    Kitscommands2: TMenuItem;
    Kitsencours1: TMenuItem;
    Choisirunkit1: TMenuItem;
    Choisirunkit2: TMenuItem;
    Exporterlabase1: TMenuItem;
    SBMain: TStatusBar;
    DataSource1: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure Marques1Click(Sender: TObject);
    procedure Pays1Click(Sender: TObject);
  private
    { Déclarations privées }
    tempo: TFDConnection;
    isSetup: boolean;
    procedure saveIniFile(dbPath: string);
    procedure initDatabase(path: string);
    procedure startDB(dataPath: String);
  public
    { Déclarations publiques }
  end;

var
  FPpale: TFPpale;

implementation

{$R *.dfm}

uses UdataModule;

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

procedure TFPpale.Marques1Click(Sender: TObject);
begin
  FBrand.ShowModal;
end;

procedure TFPpale.Pays1Click(Sender: TObject);
begin
    FCountry.ShowModal;
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

procedure TFPpale.FormCreate(Sender: TObject);
var
  settingsFile: TIniFile;
  dataPath: string;
begin
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
    showMessage('La base de données n''a pas été trouvée, elle va être créée');
    initDatabase(dataPath);
    saveIniFile(dataPath);
  end;
  if not FileExists(dataPath) then
  begin
    raise Exception.Create
      ('Un problème a été rencontré avec la base de données.');
  end;
  startDB(dataPath);
end;

procedure TFPpale.startDB(dataPath: String);
begin
  DMDatabase.dbConnection.Close;
  DMDatabase.dbConnection.Params.Database := dataPath;
  DMDatabase.dbConnection.Connected := true;
  DMDatabase.dbConnection.Open();

end;

end.
