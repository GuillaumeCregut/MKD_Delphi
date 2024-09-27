object FModel: TFModel
  Left = 0
  Top = 0
  Caption = 'Mod'#232'les'
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
  object DBGModel: TDBGrid
    Left = 0
    Top = 0
    Width = 957
    Height = 362
    Align = alClient
    DataSource = DSModel
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    PopupMenu = PUMModel
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnCellClick = DBGModelCellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'name'
        Title.Caption = 'Nom'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'reference'
        Title.Caption = 'r'#233'f'#233'rence'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'constructeur'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cat'#233'gorie'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = #233'chelle'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'p'#233'riode'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'marque'
        Width = 100
        Visible = True
      end>
  end
  object PCModel: TPageControl
    Left = 0
    Top = 362
    Width = 957
    Height = 193
    ActivePage = TSModelAdd
    Align = alBottom
    TabOrder = 1
    object TSModelAdd: TTabSheet
      Caption = 'Ajouter'
      OnShow = TSModelAddShow
      object Label1: TLabel
        Left = 3
        Top = 3
        Width = 99
        Height = 15
        Caption = 'Ajouter un mod'#232'le'
      end
      object Label2: TLabel
        Left = 3
        Top = 24
        Width = 36
        Height = 15
        Caption = 'Nom : '
      end
      object Label3: TLabel
        Left = 3
        Top = 64
        Width = 58
        Height = 15
        Caption = 'R'#233'f'#233'rence :'
      end
      object Label4: TLabel
        Left = 3
        Top = 93
        Width = 89
        Height = 15
        Caption = 'Lien scalemates :'
      end
      object Label6: TLabel
        Left = 384
        Top = 16
        Width = 43
        Height = 15
        Caption = 'Echelle :'
      end
      object Label7: TLabel
        Left = 384
        Top = 59
        Width = 47
        Height = 15
        Caption = 'Marque :'
      end
      object Label8: TLabel
        Left = 384
        Top = 99
        Width = 75
        Height = 15
        Caption = 'Constructeur :'
      end
      object Label9: TLabel
        Left = 385
        Top = 136
        Width = 46
        Height = 15
        Caption = 'P'#233'riode :'
      end
      object Label10: TLabel
        Left = 664
        Top = 17
        Width = 60
        Height = 15
        Caption = 'Cat'#233'gorie : '
      end
      object IModelNewImage: TImage
        Left = 664
        Top = 45
        Width = 105
        Height = 105
        Cursor = crHandPoint
        Proportional = True
        Stretch = True
        OnClick = IModelNewImageClick
      end
      object EModelName: TEdit
        Left = 45
        Top = 24
        Width = 121
        Height = 23
        TabOrder = 0
      end
      object EModelRef: TEdit
        Left = 67
        Top = 64
        Width = 121
        Height = 23
        TabOrder = 1
      end
      object EModelScalemates: TEdit
        Left = 111
        Top = 93
        Width = 258
        Height = 23
        TabOrder = 2
      end
      object BModelAdd: TButton
        Left = 847
        Top = 112
        Width = 75
        Height = 25
        Caption = 'Ajouter'
        TabOrder = 3
        OnClick = BModelAddClick
      end
      object DBLCBModelScale: TDBLookupComboBox
        Left = 456
        Top = 16
        Width = 145
        Height = 23
        KeyField = 'name'
        ListSource = DSModelScale
        TabOrder = 4
      end
      object DBLCBModelBrand: TDBLookupComboBox
        Left = 456
        Top = 56
        Width = 145
        Height = 23
        KeyField = 'name'
        ListSource = DSModelBrand
        TabOrder = 5
      end
      object DBLCBModelPeriod: TDBLookupComboBox
        Left = 456
        Top = 137
        Width = 145
        Height = 23
        KeyField = 'name'
        ListSource = DSModelPeriod
        TabOrder = 6
      end
      object DBLCBModelBuilder: TDBLookupComboBox
        Left = 481
        Top = 96
        Width = 145
        Height = 23
        KeyField = 'name'
        ListSource = DSModelBuilder
        TabOrder = 7
      end
      object DBLCBModelCategory: TDBLookupComboBox
        Left = 738
        Top = 16
        Width = 145
        Height = 23
        KeyField = 'name'
        ListSource = DSModelCategory
        TabOrder = 8
      end
    end
    object TSModelUpdate: TTabSheet
      Caption = 'Modifier'
      ImageIndex = 1
      object Label11: TLabel
        Left = 264
        Top = 24
        Width = 43
        Height = 15
        Caption = 'Echelle :'
      end
      object Label12: TLabel
        Left = 264
        Top = 67
        Width = 47
        Height = 15
        Caption = 'Marque :'
      end
      object Label13: TLabel
        Left = 264
        Top = 107
        Width = 75
        Height = 15
        Caption = 'Constructeur :'
      end
      object Label14: TLabel
        Left = 488
        Top = 32
        Width = 46
        Height = 15
        Caption = 'P'#233'riode :'
      end
      object Label15: TLabel
        Left = 488
        Top = 65
        Width = 60
        Height = 15
        Caption = 'Cat'#233'gorie : '
      end
      object Label16: TLabel
        Left = 3
        Top = 24
        Width = 82
        Height = 15
        Caption = 'Nouveau nom :'
      end
      object Label17: TLabel
        Left = 3
        Top = 56
        Width = 105
        Height = 15
        Caption = 'Nouvelle r'#233'f'#233'rence :'
      end
      object Label18: TLabel
        Left = 3
        Top = 88
        Width = 94
        Height = 15
        Caption = 'Liens scalemates :'
      end
      object Label19: TLabel
        Left = 3
        Top = 119
        Width = 39
        Height = 15
        Caption = 'Image :'
      end
      object Label20: TLabel
        Left = 3
        Top = 3
        Width = 105
        Height = 15
        Caption = 'Modifier un mod'#232'le'
      end
      object IModelUpdateImage: TImage
        Left = 776
        Top = 9
        Width = 105
        Height = 105
        Cursor = crHandPoint
        Proportional = True
        Stretch = True
        OnClick = IModelUpdateImageClick
      end
      object DBLCBModelNewScale: TDBLookupComboBox
        Left = 313
        Top = 24
        Width = 145
        Height = 23
        DataField = 'scale'
        DataSource = DSModel
        KeyField = 'id'
        ListField = 'name'
        ListSource = DSModelScale
        TabOrder = 0
      end
      object DBLCBModelNewBrand: TDBLookupComboBox
        Left = 317
        Top = 64
        Width = 145
        Height = 23
        DataField = 'brand'
        DataSource = DSModel
        KeyField = 'id'
        ListField = 'name'
        ListSource = DSModelBrand
        TabOrder = 1
      end
      object DBLCBModelNewPeriod: TDBLookupComboBox
        Left = 540
        Top = 26
        Width = 145
        Height = 23
        DataField = 'period'
        DataSource = DSModel
        KeyField = 'id'
        ListField = 'name'
        ListSource = DSModelPeriod
        TabOrder = 2
      end
      object DBLCBModelNewCategory: TDBLookupComboBox
        Left = 554
        Top = 64
        Width = 145
        Height = 23
        DataField = 'category'
        DataSource = DSModel
        KeyField = 'id'
        ListField = 'name'
        ListSource = DSModelCategory
        TabOrder = 3
      end
      object DBEModelNewName: TDBEdit
        Left = 114
        Top = 24
        Width = 121
        Height = 23
        DataField = 'name'
        DataSource = DSModel
        TabOrder = 4
      end
      object DBEModelScalemates: TDBEdit
        Left = 114
        Top = 88
        Width = 121
        Height = 23
        DataField = 'scalemates'
        DataSource = DSModel
        TabOrder = 5
      end
      object DBEModelNewRef: TDBEdit
        Left = 114
        Top = 53
        Width = 121
        Height = 23
        DataField = 'reference'
        DataSource = DSModel
        TabOrder = 6
      end
      object DBEdit4: TDBEdit
        Left = 114
        Top = 117
        Width = 121
        Height = 23
        DataField = 'picture'
        DataSource = DSModel
        TabOrder = 7
      end
      object DBLCBModelNewBuilder: TDBLookupComboBox
        Left = 345
        Top = 104
        Width = 145
        Height = 23
        DataField = 'builder'
        DataSource = DSModel
        KeyField = 'id'
        ListField = 'name'
        ListSource = DSModelBuilder
        TabOrder = 8
      end
      object BModelUpdate: TButton
        Left = 584
        Top = 120
        Width = 75
        Height = 25
        Caption = 'Modifier'
        TabOrder = 9
        OnClick = BModelUpdateClick
      end
    end
  end
  object Button1: TButton
    Left = 360
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 2
    OnClick = Button1Click
  end
  object DSModel: TDataSource
    DataSet = FDQModel
    Left = 376
    Top = 296
  end
  object FDQModel: TFDQuery
    Connection = DMDatabase.dbConnection
    SQL.Strings = (
      
        ' SELECT m.*, bu.name as constructeur, c.name as cat'#233'gorie, s.nam' +
        'e as '#233'chelle, p.name as p'#233'riode, b.name as marque'
      'FROM model m'
      'INNER JOIN category c ON m.category = c.id'
      'INNER JOIN scale s ON m.scale= s.id'
      'INNER JOIN period p ON m.period= p.id'
      'INNER JOIN brand b ON m.brand=b.id'
      'INNER JOIN builders bu ON m.builder = bu.id'
      'ORDER BY b.name')
    Left = 536
    Top = 280
  end
  object ALModel: TActionList
    Left = 896
    Top = 24
    object AModelDelete: TAction
      Caption = 'Supprimer'
      OnExecute = AModelDeleteExecute
    end
    object AModelShowDetails: TAction
      Caption = 'Voir les d'#233'tails'
      OnExecute = AModelShowDetailsExecute
    end
  end
  object PUMModel: TPopupMenu
    Left = 840
    Top = 32
    object Supprimer1: TMenuItem
      Action = AModelDelete
    end
    object Voirlesdtails1: TMenuItem
      Action = AModelShowDetails
    end
  end
  object DSModelScale: TDataSource
    DataSet = DMDatabase.FDTableScale
    Left = 896
    Top = 136
  end
  object DSModelBrand: TDataSource
    DataSet = DMDatabase.FDTableBrand
    Left = 796
    Top = 144
  end
  object DSModelBuilder: TDataSource
    DataSet = DMDatabase.FDTableBuilder
    Left = 896
    Top = 272
  end
  object DSModelPeriod: TDataSource
    DataSet = DMDatabase.FDTablePeriod
    Left = 896
    Top = 200
  end
  object DSModelCategory: TDataSource
    DataSet = DMDatabase.FDTableCategory
    Left = 792
    Top = 208
  end
  object OPDModel: TOpenPictureDialog
    Left = 84
    Top = 236
  end
end
