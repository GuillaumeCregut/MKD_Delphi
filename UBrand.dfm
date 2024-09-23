object FBrand: TFBrand
  Left = 0
  Top = 0
  Caption = 'Marques'
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
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 957
    Height = 362
    Align = alClient
    DataSource = DSBrand
    PopupMenu = PUMBrand
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'name'
        Title.Caption = 'Nom'
        Visible = True
      end>
  end
  object PCBrand: TPageControl
    Left = 0
    Top = 362
    Width = 957
    Height = 193
    ActivePage = TSBrandUpdate
    Align = alBottom
    TabOrder = 1
    object TSBrandAdd: TTabSheet
      Caption = 'Ajouter'
      object Label1: TLabel
        Left = 16
        Top = 16
        Width = 106
        Height = 15
        Caption = 'Ajouter une marque'
      end
      object Label2: TLabel
        Left = 17
        Top = 48
        Width = 36
        Height = 15
        Caption = 'Nom : '
      end
      object AddBrandBtn: TButton
        Left = 105
        Top = 88
        Width = 75
        Height = 25
        Caption = 'Ajouter'
        TabOrder = 0
        OnClick = AddBrandBtnClick
      end
      object EBrandName: TEdit
        Left = 73
        Top = 45
        Width = 185
        Height = 23
        TabOrder = 1
      end
    end
    object TSBrandUpdate: TTabSheet
      Caption = 'Modifier'
      ImageIndex = 1
      object Label4: TLabel
        Left = 16
        Top = 36
        Width = 82
        Height = 15
        Caption = 'Nouveau nom :'
      end
      object Label5: TLabel
        Left = 16
        Top = 11
        Width = 103
        Height = 15
        Caption = 'Modifier une valeur'
      end
      object BUpdateBrandName: TButton
        Left = 112
        Top = 72
        Width = 75
        Height = 25
        Caption = 'Modifier'
        TabOrder = 0
        OnClick = BUpdateBrandNameClick
      end
      object EBrandUpdateName: TEdit
        Left = 104
        Top = 32
        Width = 184
        Height = 23
        TabOrder = 1
      end
    end
  end
  object DSBrand: TDataSource
    DataSet = DMDatabase.FDTableBrand
    Left = 56
    Top = 320
  end
  object PUMBrand: TPopupMenu
    Left = 536
    Top = 232
    object Supprimer1: TMenuItem
      Action = RemoveBrand
    end
  end
  object ALBrand: TActionList
    Left = 376
    Top = 296
    object RemoveBrand: TAction
      Caption = 'Supprimer'
      OnExecute = RemoveBrandExecute
    end
  end
end
