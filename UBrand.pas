unit UBrand;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UdataModule, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFBrand = class(TForm)
    DSBrand: TDataSource;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    EBrandName: TEdit;
    AddBrandBtn: TButton;
    procedure FormShow(Sender: TObject);
    procedure AddBrandBtnClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FBrand: TFBrand;

implementation

{$R *.dfm}

procedure TFBrand.AddBrandBtnClick(Sender: TObject);
var
  newName, query : String;
begin
  newName:=EBrandName.Text;
  DMDatabase.SystemQuery.SQL.Clear;
  query:= 'INSERT INTO brand (name) VALUES ("'+newName+'")';
  DMDatabase.SystemQuery.SQL.Add(query);
  DMDatabase.SystemQuery.ExecSQL;
end;

procedure TFBrand.FormShow(Sender: TObject);
begin
  if not DMDatabase.FDTableBrand.active then
    DMDatabase.FDTableBrand.active := true;

end;

end.
