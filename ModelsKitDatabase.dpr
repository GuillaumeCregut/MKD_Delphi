program ModelsKitDatabase;

{$R *.dres}

uses
  Vcl.Forms,
  UPpale in 'UPpale.pas' {FPpale},
  UdataModule in 'UdataModule.pas' {DMDatabase: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDMDatabase, DMDatabase);
  Application.CreateForm(TFPpale, FPpale);
  Application.Run;
end.
