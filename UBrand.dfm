object FBrand: TFBrand
  Left = 0
  Top = 0
  Caption = 'Marques'
  ClientHeight = 529
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 249
    Height = 529
    Align = alLeft
    DataSource = DSBrand
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'name'
        Title.Caption = 'Nom'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 255
    Top = 8
    Width = 368
    Height = 217
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 106
      Height = 15
      Caption = 'Ajouter une marque'
    end
    object Label2: TLabel
      Left = 16
      Top = 72
      Width = 36
      Height = 15
      Caption = 'Nom : '
    end
    object EBrandName: TEdit
      Left = 72
      Top = 69
      Width = 185
      Height = 23
      TabOrder = 0
    end
    object AddBrandBtn: TButton
      Left = 104
      Top = 112
      Width = 75
      Height = 25
      Caption = 'Ajouter'
      TabOrder = 1
      OnClick = AddBrandBtnClick
    end
  end
  object DSBrand: TDataSource
    DataSet = DMDatabase.FDTableBrand
    Left = 56
    Top = 320
  end
end
