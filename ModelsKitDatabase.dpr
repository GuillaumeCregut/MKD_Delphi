program ModelsKitDatabase;

{$R *.dres}

uses
  Vcl.Forms,
  UPpale in 'UPpale.pas' {FPpale},
  UdataModule in 'UdataModule.pas' {DMDatabase: TDataModule},
  UBrand in 'UBrand.pas' {FBrand},
  UCountry in 'UCountry.pas' {FCountry};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDMDatabase, DMDatabase);
  Application.CreateForm(TFPpale, FPpale);
  Application.CreateForm(TFBrand, FBrand);
  Application.CreateForm(TFCountry, FCountry);
  Application.Run;
end.
