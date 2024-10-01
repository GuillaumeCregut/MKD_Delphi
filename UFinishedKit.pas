unit UFinishedKit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, System.UITypes,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UdataModule, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.ExtCtrls, Vcl.Menus, Vcl.StdCtrls;

type
  TFFinishedKit = class(TForm)
    FDQFinishedKit: TFDQuery;
    DSFinishedKit: TDataSource;
    DBGFinishedKit: TDBGrid;
    Panel1: TPanel;
    PUMFinishedKit: TPopupMenu;
    MIFinishedKitShowDetail: TMenuItem;
    Label1: TLabel;
    LFinishedNumber: TLabel;
    MIFinishedDelete: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure MIFinishedKitShowDetailClick(Sender: TObject);
    procedure MIFinishedDeleteClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FFinishedKit: TFFinishedKit;

implementation

{$R *.dfm}

procedure TFFinishedKit.FormShow(Sender: TObject);
begin
  FDQFinishedKit.Close;
  FDQFinishedKit.Params[0].Value := DMDatabase.finished;
  FDQFinishedKit.Open;
  DMDatabase.SystemQuery.SQL.clear;
  DMDatabase.SystemQuery.Params.clear;
  DMDatabase.SystemQuery.SQL.Add
    ('SELECT count(*) as number FROM model_user WHERE state=:status');
  DMDatabase.SystemQuery.Params[0].Value := DMDatabase.finished;
  DMDatabase.SystemQuery.Open;
  LFinishedNumber.Caption := DMDatabase.DSSystem.DataSet.FieldByName
    ('number').AsString;
  DMDatabase.SystemQuery.Close;
end;

procedure TFFinishedKit.MIFinishedDeleteClick(Sender: TObject);
var
  idModel: Integer;
  query, name: string;
begin
  name := DSFinishedKit.DataSet.FieldByName('nom').AsString;
  if MessageDlg('Voulez vous supprimer ' + name + ' ?', TMsgDlgType.mtWarning,
    [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0, TMsgDlgBtn.mbNo) = mrYes then
  begin
    idModel := DSFinishedKit.DataSet.FieldByName('id').AsInteger;
    DMDatabase.moveStock(idModel, 0);
    FDQFinishedKit.Refresh;
  end;
end;

procedure TFFinishedKit.MIFinishedKitShowDetailClick(Sender: TObject);
var
  idModel: Integer;
begin
  idModel := DSFinishedKit.DataSet.FieldByName('id').AsInteger;

end;

end.
