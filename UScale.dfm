object FScale: TFScale
  Left = 0
  Top = 0
  Caption = 'Echelles'
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
  object DBGScale: TDBGrid
    Left = 0
    Top = 0
    Width = 957
    Height = 362
    Align = alClient
    DataSource = DSScale
    PopupMenu = PUMScale
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnCellClick = DBGScaleCellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'name'
        Visible = True
      end>
  end
  object PCScale: TPageControl
    Left = 0
    Top = 362
    Width = 957
    Height = 193
    ActivePage = TSScaleAdd
    Align = alBottom
    TabOrder = 1
    object TSScaleAdd: TTabSheet
      Caption = 'Ajouter'
      object Label1: TLabel
        Left = 24
        Top = 24
        Width = 102
        Height = 15
        Caption = 'Ajouter une '#233'chelle'
      end
      object Label2: TLabel
        Left = 80
        Top = 64
        Width = 33
        Height = 15
        Caption = 'Nom :'
      end
      object EScaleName: TEdit
        Left = 136
        Top = 56
        Width = 121
        Height = 23
        TabOrder = 0
      end
      object BScaleAdd: TButton
        Left = 120
        Top = 104
        Width = 75
        Height = 25
        Caption = 'Ajouter'
        TabOrder = 1
        OnClick = BScaleAddClick
      end
    end
    object TSScaleUpdate: TTabSheet
      Caption = 'Modifier'
      ImageIndex = 1
      object Label3: TLabel
        Left = 3
        Top = 3
        Width = 108
        Height = 15
        Caption = 'Modifier une '#233'chelle'
      end
      object Label4: TLabel
        Left = 32
        Top = 48
        Width = 82
        Height = 15
        Caption = 'Nouveau nom :'
      end
      object EScaleUpdateName: TEdit
        Left = 120
        Top = 40
        Width = 121
        Height = 23
        TabOrder = 0
      end
      object BScaleUpdate: TButton
        Left = 160
        Top = 104
        Width = 75
        Height = 25
        Caption = 'Modifier'
        TabOrder = 1
        OnClick = BScaleUpdateClick
      end
    end
  end
  object DSScale: TDataSource
    DataSet = DMDatabase.FDTableScale
    Left = 816
    Top = 376
  end
  object ALScale: TActionList
    Left = 800
    Top = 280
    object AScaleDelete: TAction
      Caption = 'Supprimer'
      OnExecute = AScaleDeleteExecute
    end
  end
  object PUMScale: TPopupMenu
    Left = 472
    Top = 280
    object Supprimer1: TMenuItem
      Action = AScaleDelete
    end
  end
end
