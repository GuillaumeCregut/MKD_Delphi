program ModelsKitDatabase;

{$R *.dres}

uses
  Vcl.Forms,
  UPpale in 'UPpale.pas' {FPpale},
  UdataModule in 'UdataModule.pas' {DMDatabase: TDataModule},
  UBrand in 'UBrand.pas' {FBrand},
  UCountry in 'UCountry.pas' {FCountry},
  UCategory in 'UCategory.pas' {FCategory},
  UPeriod in 'UPeriod.pas' {FPeriod},
  UScale in 'UScale.pas' {FScale},
  UBuilder in 'UBuilder.pas' {FBuilder},
  Umodel in 'Umodel.pas' {FModel};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDMDatabase, DMDatabase);
  Application.CreateForm(TFPpale, FPpale);
  Application.CreateForm(TFBrand, FBrand);
  Application.CreateForm(TFCountry, FCountry);
  Application.CreateForm(TFCategory, FCategory);
  Application.CreateForm(TFPeriod, FPeriod);
  Application.CreateForm(TFScale, FScale);
  Application.CreateForm(TFBuilder, FBuilder);
  Application.CreateForm(TFModel, FModel);
  Application.Run;
end.
