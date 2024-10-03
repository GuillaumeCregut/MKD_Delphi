object FOrderModel: TFOrderModel
  Left = 0
  Top = 0
  Caption = 'Choisir un mod'#232'le'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object DBGOrderModel: TDBGrid
    Left = 0
    Top = 0
    Width = 624
    Height = 312
    Align = alClient
    DataSource = DSOrderModel
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    PopupMenu = PUMOrderModel
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnCellClick = DBGOrderModelCellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'brandname'
        Title.Caption = 'Marque'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'name'
        Title.Caption = 'Nom'
        Width = 342
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'reference'
        Title.Caption = 'R'#233'f'#233'rence'
        Width = 80
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
  object Panel1: TPanel
    Left = 0
    Top = 312
    Width = 624
    Height = 129
    Align = alBottom
    TabOrder = 1
    object Label1: TLabel
      Left = 24
      Top = 24
      Width = 109
      Height = 15
      Caption = 'Mod'#232'le s'#233'lectionn'#233' :'
    end
    object LOrderModelName: TLabel
      Left = 152
      Top = 24
      Width = 5
      Height = 15
      Caption = '-'
    end
    object Label2: TLabel
      Left = 24
      Top = 56
      Width = 52
      Height = 15
      Caption = 'Quantit'#233' :'
    end
    object Label3: TLabel
      Left = 24
      Top = 96
      Width = 69
      Height = 15
      Caption = 'Prix unitaire :'
    end
    object BOrderModelAdd: TButton
      Left = 494
      Top = 56
      Width = 75
      Height = 25
      Caption = 'Ajouter'
      TabOrder = 0
      OnClick = BOrderModelAddClick
    end
    object SEOrderQtty: TSpinEdit
      Left = 82
      Top = 52
      Width = 121
      Height = 24
      MaxValue = 10000
      MinValue = 1
      TabOrder = 1
      Value = 0
    end
    object EOrderModelPrice: TEdit
      Left = 112
      Top = 94
      Width = 121
      Height = 23
      TabOrder = 2
    end
  end
  object FDQOrderModel: TFDQuery
    Active = True
    Connection = DMDatabase.dbConnection
    SQL.Strings = (
      
        'SELECT m.id,m.name,m.reference, s.name as scalename,b.name as br' +
        'andname'
      'FROM model m '
      'INNER JOIN brand b on m.brand=b.id'
      'INNER JOIN scale s ON m.scale=s.id'
      'ORDER by m.name'
      '')
    Left = 552
    Top = 320
  end
  object DSOrderModel: TDataSource
    DataSet = FDQOrderModel
    Left = 520
    Top = 280
  end
  object PUMOrderModel: TPopupMenu
    Left = 544
    Top = 216
    object MIOrderModelShow: TMenuItem
      Caption = 'D'#233'tails'
      OnClick = MIOrderModelShowClick
    end
  end
end
