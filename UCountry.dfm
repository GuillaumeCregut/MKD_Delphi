object FCountry: TFCountry
  Left = 0
  Top = 0
  Caption = 'Pays'
  ClientHeight = 555
  ClientWidth = 957
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object DBGCountry: TDBGrid
    Left = 0
    Top = 0
    Width = 957
    Height = 402
    Align = alClient
    DataSource = DSCountry
    PopupMenu = PUMCountry
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnCellClick = DBGCountryCellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'name'
        Visible = True
      end>
  end
  object PGCountry: TPageControl
    Left = 0
    Top = 402
    Width = 957
    Height = 153
    ActivePage = TSCountryUpdate
    Align = alBottom
    TabOrder = 1
    object TSCountryAdd: TTabSheet
      Caption = 'Ajouter'
      object Label1: TLabel
        Left = 3
        Top = 3
        Width = 83
        Height = 15
        Caption = 'Ajouter un pays'
      end
      object Label2: TLabel
        Left = 40
        Top = 40
        Width = 36
        Height = 15
        Caption = 'Nom : '
      end
      object BCountryAdd: TButton
        Left = 74
        Top = 77
        Width = 75
        Height = 25
        Caption = 'Ajouter'
        TabOrder = 0
        OnClick = BCountryAddClick
      end
      object ECountryName: TEdit
        Left = 82
        Top = 32
        Width = 121
        Height = 23
        TabOrder = 1
      end
    end
    object TSCountryUpdate: TTabSheet
      Caption = 'Modifier'
      ImageIndex = 1
      object Label3: TLabel
        Left = 16
        Top = 3
        Width = 89
        Height = 15
        Caption = 'Modifier un pays'
      end
      object Label4: TLabel
        Left = 24
        Top = 32
        Width = 82
        Height = 15
        Caption = 'Nouveau nom :'
      end
      object BCountryUpdate: TButton
        Left = 80
        Top = 71
        Width = 75
        Height = 25
        Caption = 'Modifier'
        TabOrder = 0
        OnClick = BCountryUpdateClick
      end
      object ECountryNewName: TEdit
        Left = 128
        Top = 29
        Width = 121
        Height = 23
        TabOrder = 1
      end
    end
  end
  object PUMCountry: TPopupMenu
    Left = 680
    Top = 208
    object MIRemoveCountry: TMenuItem
      Action = RemoveCountry
    end
  end
  object ALCountry: TActionList
    Left = 760
    Top = 168
    object RemoveCountry: TAction
      Caption = 'Supprimer'
      OnExecute = RemoveCountryExecute
    end
  end
  object DSCountry: TDataSource
    DataSet = DMDatabase.FDTableCountry
    Left = 224
    Top = 136
  end
end
