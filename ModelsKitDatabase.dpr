program ModelsKitDatabase;

uses
  Vcl.Forms,
  UPpale in 'UPpale.pas' {Form1},
  UdataModule in 'UdataModule.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
