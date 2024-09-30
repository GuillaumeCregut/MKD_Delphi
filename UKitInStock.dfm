object FKitInStock: TFKitInStock
  Left = 0
  Top = 0
  Caption = 'Kits en stock'
  ClientHeight = 555
  ClientWidth = 957
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object Label1: TLabel
    Left = 24
    Top = 440
    Width = 80
    Height = 15
    Caption = 'D'#233'placer le kit :'
  end
  object DBTName: TDBText
    Left = 120
    Top = 440
    Width = 65
    Height = 17
    DataField = 'name'
    DataSource = DSKitInStock
  end
  object Label2: TLabel
    Left = 32
    Top = 472
    Width = 27
    Height = 15
    Caption = 'Vers :'
  end
  object DBGKitInStock: TDBGrid
    Left = 0
    Top = 0
    Width = 957
    Height = 425
    Align = alTop
    DataSource = DSKitInStock
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    PopupMenu = PUMKitInStock
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
        Title.Caption = 'Nom'
        Width = 390
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'buildername'
        Title.Caption = 'Constructeur'
        Width = 210
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'brandname'
        Title.Caption = 'Marque'
        Width = 217
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'scalename'
        Title.Caption = 'Echelle'
        Width = 50
        Visible = True
      end>
  end
  object DBLCBKitStatus: TDBLookupComboBox
    Left = 80
    Top = 472
    Width = 145
    Height = 23
    KeyField = 'name'
    ListSource = DSKitInStockStatus
    TabOrder = 1
  end
  object BKitInStockMove: TButton
    Left = 80
    Top = 520
    Width = 75
    Height = 25
    Caption = 'D'#233'placer'
    TabOrder = 2
    OnClick = BKitInStockMoveClick
  end
  object FDQKitInStock: TFDQuery
    Active = True
    Connection = DMDatabase.dbConnection
    SQL.Strings = (
      
        'SELECT mu.id, mu.model_id, m.name, b.name as buildername,br.name' +
        ' as brandname,s.name as scalename'
      'FROM model_user mu '
      'INNER JOIN model m ON mu.model_id=m.id'
      'INNER JOIN builders b ON m.builder=b.id'
      'INNER JOIN brand br ON m.brand=br.id'
      'INNER JOIN scale s ON m.scale=s.id'
      'WHERE mu.state=:status'
      '')
    Left = 336
    Top = 432
    ParamData = <
      item
        Name = 'STATUS'
        DataType = ftInteger
        ParamType = ptInput
        Value = 4
      end>
  end
  object DSKitInStock: TDataSource
    DataSet = FDQKitInStock
    Left = 488
    Top = 440
  end
  object DSKitInStockStatus: TDataSource
    DataSet = DMDatabase.FDTStatus
    Left = 584
    Top = 472
  end
  object ALKitInStock: TActionList
    Left = 768
    Top = 472
    object AShowDetail: TAction
      Caption = 'Voir les d'#233'tails'
      OnExecute = AShowDetailExecute
    end
    object ARemoveStock: TAction
      Caption = 'Supprimer'
      OnExecute = ARemoveStockExecute
    end
  end
  object PUMKitInStock: TPopupMenu
    Left = 888
    Top = 464
    object Voirlesdtails1: TMenuItem
      Action = AShowDetail
    end
    object Supprimer1: TMenuItem
      Action = ARemoveStock
    end
  end
end
