unit UPpale;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Menus, Vcl.ComCtrls,system.IniFiles, FireDAC.Comp.Client, Vcl.StdCtrls;

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
  private
    { Déclarations privées }
    tempo :  TFDConnection;
    isSetup : boolean;
    procedure saveIniFile;
    procedure initDatabase(driver: String; path: string);
  public
    { Déclarations publiques }
  end;

var
  FPpale: TFPpale;

implementation

{$R *.dfm}

uses UdataModule;

procedure TFPpale.initDatabase(driver: String; path: string);
var
  query : string;
   List: TStringList;
  Stream: TResourceStream;
  I : integer;
begin

  DMDatabase.dbConnection.Params.DriverID:='SQLite';
  DMDatabase.dbConnection.Params.Database:= ChangeFileExt(Application.ExeName,'.db'); //Database:= ChangeFileExt(Application.ExeName,'.db');
  Stream := TResourceStream.Create(HInstance, 'Resource_1', RT_RCDATA);
  try
  try
    List := TStringList.Create;
    try
      List.LoadFromStream(Stream,TEncoding.UTF8);
      Label1.Caption:=IntToStr(List.Count);
      for I := 0 to list.Count-1 do
      begin
        query:=List[I];
        DMDatabase.dbConnection.ExecSQL(query);
      end;
    finally
      List.Free;
    end;
  finally
    Stream.Free;
  end;
  isSetup:=true;
  except
    showMessage('Une erreur est survenue au moment de l''initialisation de la base');
    isSetup:=false;
  end;
   DMDatabase.dbConnection.Close;
end;

procedure TFPpale.saveIniFile;
var
  settingsFile : TIniFile;
 begin
     settingsFile:=TIniFile.Create(ChangeFileExt(Application.ExeName,'.ini'));
    try
       settingsFile.WriteString('setup', 'version', '1.0a');
    finally
      settingsFile.Free;
    end;
end;

procedure TFPpale.FormCreate(Sender: TObject);
var
  settingsFile : TIniFile;
begin
    settingsFile:=TIniFile.Create(ChangeFileExt(Application.ExeName,'.ini'));
    try


    isSetup:= settingsFile.ReadBool('init','setup',false);
    if not isSetup then
     begin
       ShowMessage('Pas initialisée');
       initDatabase('','');
       saveIniFile();
     end
     else
     begin
       ShowMessage('initialisée');
     end;
    finally
      settingsFile.Free;
    end;
end;

end.
