object FPeriod: TFPeriod
  Left = 0
  Top = 0
  Caption = 'P'#233'riodes'
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
  object DBGPeriod: TDBGrid
    Left = 0
    Top = 0
    Width = 957
    Height = 362
    Align = alClient
    DataSource = DSPeriod
    PopupMenu = PUMPeriod
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnCellClick = DBGPeriodCellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'name'
        Visible = True
      end>
  end
  object PCPeriod: TPageControl
    Left = 0
    Top = 362
    Width = 957
    Height = 193
    ActivePage = TSPeriodUpdate
    Align = alBottom
    TabOrder = 1
    object TSPeriodAdd: TTabSheet
      Caption = 'Ajouter'
      object Label3: TLabel
        Left = 16
        Top = 8
        Width = 34
        Height = 15
        Caption = 'Label3'
      end
      object Label4: TLabel
        Left = 32
        Top = 48
        Width = 34
        Height = 15
        Caption = 'Label4'
      end
      object EPeriodName: TEdit
        Left = 104
        Top = 40
        Width = 121
        Height = 23
        TabOrder = 0
      end
      object BPeriodAdd: TButton
        Left = 104
        Top = 88
        Width = 75
        Height = 25
        Caption = 'Ajouter'
        TabOrder = 1
        OnClick = BPeriodAddClick
      end
    end
    object TSPeriodUpdate: TTabSheet
      Caption = 'Modifier'
      ImageIndex = 1
      object Label1: TLabel
        Left = 16
        Top = 8
        Width = 111
        Height = 15
        Caption = 'Modifier une p'#233'riode'
      end
      object Label2: TLabel
        Left = 48
        Top = 56
        Width = 82
        Height = 15
        Caption = 'Nouveau nom :'
      end
      object EPeriodUpdateName: TEdit
        Left = 136
        Top = 48
        Width = 121
        Height = 23
        TabOrder = 0
      end
      object BPeriodUpdate: TButton
        Left = 128
        Top = 112
        Width = 75
        Height = 25
        Caption = 'Modifier'
        TabOrder = 1
        OnClick = BPeriodUpdateClick
      end
    end
  end
  object DSPeriod: TDataSource
    DataSet = DMDatabase.FDTablePeriod
    Left = 856
    Top = 120
  end
  object ALPeriod: TActionList
    Left = 856
    Top = 48
    object APeriodRemove: TAction
      Caption = 'Supprimer'
      OnExecute = APeriodRemoveExecute
    end
  end
  object PUMPeriod: TPopupMenu
    Left = 864
    Top = 184
    object Supprimer1: TMenuItem
      Action = APeriodRemove
    end
  end
end
