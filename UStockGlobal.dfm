object FStockGlobal: TFStockGlobal
  Left = 0
  Top = 0
  Caption = 'FStockGlobal'
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
  object Label1: TLabel
    Left = 16
    Top = 64
    Width = 40
    Height = 15
    Caption = 'Kit lik'#233's'
  end
  object Label2: TLabel
    Left = 496
    Top = 64
    Width = 88
    Height = 15
    Caption = 'Kits command'#233's'
  end
  object Label3: TLabel
    Left = 16
    Top = 216
    Width = 66
    Height = 15
    Caption = 'Kits en stock'
  end
  object Label4: TLabel
    Left = 488
    Top = 216
    Width = 87
    Height = 15
    Caption = 'Kits commenc'#233's'
  end
  object Label5: TLabel
    Left = 16
    Top = 376
    Width = 68
    Height = 15
    Caption = 'Kits termin'#233's'
  end
  object Label6: TLabel
    Left = 16
    Top = 32
    Width = 169
    Height = 15
    Caption = 'Nombre de kit total (hors likes) :'
  end
  object LGlobalQuantity: TLabel
    Left = 191
    Top = 32
    Width = 6
    Height = 15
    Caption = '0'
  end
  object DBGGlobalFavorite: TDBGrid
    Left = 8
    Top = 88
    Width = 457
    Height = 120
    DataSource = DSGobalFavorite
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    PopupMenu = PUMGlobal
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnMouseActivate = DBGGlobalFavoriteMouseActivate
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
        FieldName = 'buildername'
        Title.Caption = 'Constructeur'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'brandname'
        Title.Caption = 'Marque'
        Width = 100
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
  object DBGGlobalStock: TDBGrid
    Left = 0
    Top = 237
    Width = 458
    Height = 120
    DataSource = DSGlobalStock
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    PopupMenu = PUMGlobal
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnMouseActivate = DBGGlobalFavoriteMouseActivate
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
        FieldName = 'buildername'
        Title.Caption = 'Constructeur'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'brandname'
        Title.Caption = 'Marque'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'scalename'
        Title.Caption = 'Echelle'
        Width = 50
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'number'
        Title.Caption = 'Quantit'#233
        Width = 50
        Visible = True
      end>
  end
  object DBGGlobalBuyed: TDBGrid
    Left = 484
    Top = 90
    Width = 457
    Height = 120
    DataSource = DSBuyed
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    PopupMenu = PUMGlobal
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnMouseActivate = DBGGlobalFavoriteMouseActivate
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
        FieldName = 'buildername'
        Title.Caption = 'Constructeur'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'brandname'
        Title.Caption = 'Marque'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'scalename'
        Title.Caption = 'Echelle'
        Width = 50
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'number'
        Title.Caption = 'Quantit'#233
        Width = 50
        Visible = True
      end>
  end
  object DBGGlobalStart: TDBGrid
    Left = 484
    Top = 240
    Width = 457
    Height = 120
    DataSource = DSGlobalStart
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    PopupMenu = PUMGlobal
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnMouseActivate = DBGGlobalFavoriteMouseActivate
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
        FieldName = 'buildername'
        Title.Caption = 'Constructeur'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'brandname'
        Title.Caption = 'Marque'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'scalename'
        Title.Caption = 'Echelle'
        Width = 50
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'number'
        Title.Caption = 'Quentit'#233
        Width = 50
        Visible = True
      end>
  end
  object DBGGlobalFinished: TDBGrid
    Left = 8
    Top = 397
    Width = 457
    Height = 120
    DataSource = DSGlobalFinished
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    PopupMenu = PUMGlobal
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnMouseActivate = DBGGlobalFavoriteMouseActivate
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
        FieldName = 'buildername'
        Title.Caption = 'Constructeur'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'brandname'
        Title.Caption = 'Marque'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'scalename'
        Title.Caption = 'Echelle'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'number'
        Title.Caption = 'Quantit'#233
        Width = 50
        Visible = True
      end>
  end
  object FDQGlobalFavorite: TFDQuery
    Connection = DMDatabase.dbConnection
    SQL.Strings = (
      
        'SELECT  count(mu.model_id) as number,m.name,mu.model_id, b.name ' +
        'as buildername,br.name as brandname,s.name as scalename'
      'FROM model_user mu '
      'INNER JOIN model m ON mu.model_id=m.id'
      'INNER JOIN builders b ON m.builder=b.id'
      'INNER JOIN brand br ON m.brand=br.id'
      'INNER JOIN scale s ON m.scale=s.id'
      'WHERE mu.state=:status'
      'GROUP BY mu.model_id ')
    Left = 248
    Top = 152
    ParamData = <
      item
        Name = 'STATUS'
        DataType = ftString
        ParamType = ptInput
        Value = '4'
      end>
  end
  object FDQGlobalStock: TFDQuery
    Connection = DMDatabase.dbConnection
    SQL.Strings = (
      
        'SELECT  count(mu.model_id) as number,m.name,mu.model_id, b.name ' +
        'as buildername,br.name as brandname,s.name as scalename'
      'FROM model_user mu '
      'INNER JOIN model m ON mu.model_id=m.id'
      'INNER JOIN builders b ON m.builder=b.id'
      'INNER JOIN brand br ON m.brand=br.id'
      'INNER JOIN scale s ON m.scale=s.id'
      'WHERE mu.state=:status'
      'GROUP BY mu.model_id '
      '')
    Left = 344
    Top = 304
    ParamData = <
      item
        Name = 'STATUS'
        DataType = ftString
        ParamType = ptInput
        Value = '1'
      end>
  end
  object DSGobalFavorite: TDataSource
    DataSet = FDQGlobalFavorite
    Left = 148
    Top = 161
  end
  object DSGlobalStock: TDataSource
    DataSet = FDQGlobalStock
    Left = 216
    Top = 304
  end
  object FDQGlobalBuyed: TFDQuery
    Connection = DMDatabase.dbConnection
    SQL.Strings = (
      
        'SELECT  count(mu.model_id) as number,mu.model_id,m.name, b.name ' +
        'as buildername,br.name as brandname,s.name as scalename'
      'FROM model_user mu '
      'INNER JOIN model m ON mu.model_id=m.id'
      'INNER JOIN builders b ON m.builder=b.id'
      'INNER JOIN brand br ON m.brand=br.id'
      'INNER JOIN scale s ON m.scale=s.id'
      'WHERE mu.state=:status'
      'GROUP BY mu.model_id ')
    Left = 800
    Top = 128
    ParamData = <
      item
        Name = 'STATUS'
        DataType = ftString
        ParamType = ptInput
        Value = '1'
      end>
  end
  object FDQGlobalStart: TFDQuery
    Connection = DMDatabase.dbConnection
    SQL.Strings = (
      
        'SELECT  count(mu.model_id) as number,mu.model_id,m.name, b.name ' +
        'as buildername,br.name as brandname,s.name as scalename'
      'FROM model_user mu '
      'INNER JOIN model m ON mu.model_id=m.id'
      'INNER JOIN builders b ON m.builder=b.id'
      'INNER JOIN brand br ON m.brand=br.id'
      'INNER JOIN scale s ON m.scale=s.id'
      'WHERE mu.state=:status'
      'GROUP BY mu.model_id ')
    Left = 536
    Top = 296
    ParamData = <
      item
        Name = 'STATUS'
        DataType = ftString
        ParamType = ptInput
        Value = '1'
      end>
  end
  object FDQGlobalFinished: TFDQuery
    Connection = DMDatabase.dbConnection
    SQL.Strings = (
      
        'SELECT  count(mu.model_id) as number,mu.model_id,m.name, b.name ' +
        'as buildername,br.name as brandname,s.name as scalename'
      'FROM model_user mu '
      'INNER JOIN model m ON mu.model_id=m.id'
      'INNER JOIN builders b ON m.builder=b.id'
      'INNER JOIN brand br ON m.brand=br.id'
      'INNER JOIN scale s ON m.scale=s.id'
      'WHERE mu.state=:status'
      'GROUP BY mu.model_id ')
    Left = 264
    Top = 456
    ParamData = <
      item
        Name = 'STATUS'
        DataType = ftString
        ParamType = ptInput
        Value = '1'
      end>
  end
  object DSGlobalStart: TDataSource
    DataSet = FDQGlobalStart
    Left = 672
    Top = 296
  end
  object DSBuyed: TDataSource
    DataSet = FDQGlobalBuyed
    Left = 656
    Top = 136
  end
  object DSGlobalFinished: TDataSource
    DataSet = FDQGlobalFinished
    Left = 56
    Top = 456
  end
  object ALGlobal: TActionList
    Left = 640
    Top = 392
    object AGlobalViewDetail: TAction
      Caption = 'Voir les d'#233'tails'
      OnExecute = AGlobalViewDetailExecute
    end
  end
  object PUMGlobal: TPopupMenu
    Left = 768
    Top = 400
    object Voirlesdtails1: TMenuItem
      Action = AGlobalViewDetail
    end
  end
end
