unit UdataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TDMDatabase = class(TDataModule)
    FDTableBrand: TFDTable;
    dbConnection: TFDConnection;
    SystemQuery: TFDQuery;
    Transaction: TFDTransaction;
    procedure dbConnectionError(ASender, AInitiator: TObject;
      var AException: Exception);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }


  end;

var
  DMDatabase: TDMDatabase;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}



procedure TDMDatabase.dbConnectionError(ASender, AInitiator: TObject;
  var AException: Exception);
begin
    raise Exception.Create('Erreur dans la base');
end;

end.
