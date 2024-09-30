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
  Umodel in 'Umodel.pas' {FModel},
  UModelDetail in 'UModelDetail.pas' {FModelDetail},
  UStockGlobal in 'UStockGlobal.pas' {FStockGlobal},
  UKitInStock in 'UKitInStock.pas' {FKitInStock},
  UFormValues in 'UFormValues.pas';

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
  Application.CreateForm(TFModelDetail, FModelDetail);
  Application.CreateForm(TFStockGlobal, FStockGlobal);
  Application.CreateForm(TFKitInStock, FKitInStock);
  Application.Run;
end.
