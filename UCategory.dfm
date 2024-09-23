object FCategory: TFCategory
  Left = 0
  Top = 0
  Caption = 'Cat'#233'gories'
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
  object DBGCategory: TDBGrid
    Left = 0
    Top = 0
    Width = 957
    Height = 402
    Align = alClient
    DataSource = DSCategory
    PopupMenu = PUMCategory
    ReadOnly = True
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
        Visible = True
      end>
  end
  object PCCategory: TPageControl
    Left = 0
    Top = 402
    Width = 957
    Height = 153
    ActivePage = TSCategoryUpdate
    Align = alBottom
    TabOrder = 1
    object TSCategoryAdd: TTabSheet
      Caption = 'Ajouter'
      object Label3: TLabel
        Left = 3
        Top = 3
        Width = 114
        Height = 15
        Caption = 'Ajouter une cat'#233'gorie'
      end
      object Label4: TLabel
        Left = 40
        Top = 36
        Width = 36
        Height = 15
        Caption = 'Nom : '
      end
      object ECategoryName: TEdit
        Left = 82
        Top = 32
        Width = 175
        Height = 23
        TabOrder = 0
      end
      object BCategoryAdd: TButton
        Left = 136
        Top = 80
        Width = 75
        Height = 25
        Caption = 'Ajouter'
        TabOrder = 1
        OnClick = BCategoryAddClick
      end
    end
    object TSCategoryUpdate: TTabSheet
      Caption = 'Modifier'
      ImageIndex = 1
      object Label1: TLabel
        Left = 24
        Top = 16
        Width = 109
        Height = 15
        Caption = 'Modifier la cat'#233'gorie'
      end
      object Label2: TLabel
        Left = 48
        Top = 43
        Width = 85
        Height = 15
        Caption = 'Nouveau nom : '
      end
      object ECategoryUpdateName: TEdit
        Left = 152
        Top = 40
        Width = 161
        Height = 23
        TabOrder = 0
      end
      object BCategoryUpdate: TButton
        Left = 200
        Top = 80
        Width = 75
        Height = 25
        Caption = 'Modifier'
        TabOrder = 1
        OnClick = BCategoryUpdateClick
      end
    end
  end
  object DSCategory: TDataSource
    DataSet = DMDatabase.FDTableCategory
    Left = 280
    Top = 144
  end
  object ALCateogry: TActionList
    Left = 648
    Top = 192
    object ACategoryDelete: TAction
      Caption = 'Supprimer'
      OnExecute = ACategoryDeleteExecute
    end
  end
  object PUMCategory: TPopupMenu
    Left = 848
    Top = 304
    object Supprimer1: TMenuItem
      Action = ACategoryDelete
    end
  end
end
