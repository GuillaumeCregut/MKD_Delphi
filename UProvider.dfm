object FProvider: TFProvider
  Left = 0
  Top = 0
  Caption = 'Fournisseurs'
  ClientHeight = 545
  ClientWidth = 826
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnHide = FormHide
  OnShow = FormShow
  TextHeight = 15
  object DBGProvider: TDBGrid
    Left = 0
    Top = 0
    Width = 329
    Height = 240
    Align = alLeft
    DataSource = DSProvider
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    PopupMenu = PUMProvider
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnCellClick = DBGProviderCellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'name'
        Title.Caption = 'Nom'
        Width = 100
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 240
    Width = 826
    Height = 305
    Align = alBottom
    TabOrder = 1
    ExplicitWidth = 624
    object Label5: TLabel
      Left = 9
      Top = 24
      Width = 178
      Height = 15
      Caption = 'Commandes chez ce fournisseur :'
    end
    object DBGrid2: TDBGrid
      Left = 9
      Top = 45
      Width = 248
      Height = 244
      DataSource = DSProviderOrders
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'reference'
          Title.Caption = 'R'#233'f'#233'rence'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'date_order'
          Title.Caption = 'Date'
          Visible = True
        end>
    end
    object DBGProviderOrderDetails: TDBGrid
      Left = 304
      Top = 45
      Width = 505
      Height = 244
      DataSource = DSProviderOrderDetails
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'reference'
          Title.Caption = 'R'#233'f'#233'rence'
          Width = 65
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
          FieldName = 'name'
          Title.Caption = 'Nom'
          Width = 171
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'qtty'
          Title.Caption = 'Quantit'#233
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'price'
          Title.Caption = 'Prix unitaire'
          Width = 84
          Visible = True
        end>
    end
  end
  object PCProvider: TPageControl
    Left = 335
    Top = 0
    Width = 491
    Height = 240
    ActivePage = TSProviderAdd
    Align = alRight
    TabOrder = 2
    object TSProviderAdd: TTabSheet
      Caption = 'Ajouter'
      object Label1: TLabel
        Left = 3
        Top = 16
        Width = 118
        Height = 15
        Caption = 'Ajouter un fournisseur'
      end
      object Label2: TLabel
        Left = 16
        Top = 48
        Width = 33
        Height = 15
        Caption = 'Nom :'
      end
      object EProviderName: TEdit
        Left = 64
        Top = 45
        Width = 121
        Height = 23
        TabOrder = 0
      end
      object BProviderAdd: TButton
        Left = 80
        Top = 96
        Width = 75
        Height = 25
        Caption = 'Ajouter'
        TabOrder = 1
        OnClick = BProviderAddClick
      end
    end
    object TSProviderChange: TTabSheet
      Caption = 'Modifier'
      ImageIndex = 1
      object Label3: TLabel
        Left = 3
        Top = 3
        Width = 124
        Height = 15
        Caption = 'Modifier un fournisseur'
      end
      object Label4: TLabel
        Left = 16
        Top = 40
        Width = 82
        Height = 15
        Caption = 'Nouveau nom :'
      end
      object BProviderUpdate: TButton
        Left = 96
        Top = 112
        Width = 75
        Height = 25
        Caption = 'Modifier'
        TabOrder = 0
        OnClick = BProviderUpdateClick
      end
      object EProviderNewName: TEdit
        Left = 120
        Top = 37
        Width = 121
        Height = 23
        TabOrder = 1
      end
    end
  end
  object DSProvider: TDataSource
    DataSet = DMDatabase.FDTableProvider
    Left = 248
    Top = 176
  end
  object PUMProvider: TPopupMenu
    Left = 208
    Top = 48
    object MIProviderDelete: TMenuItem
      Caption = 'Supprimer'
      OnClick = MIProviderDeleteClick
    end
  end
  object DSProviderOrders: TDataSource
    DataSet = FDQOrders
    Left = 40
    Top = 368
  end
  object FDQOrders: TFDQuery
    Active = True
    IndexFieldNames = 'provider'
    MasterSource = DSProvider
    MasterFields = 'id'
    Connection = DMDatabase.dbConnection
    SQL.Strings = (
      'SELECT * FROM orders')
    Left = 144
    Top = 368
  end
  object FDQProviderOrderDetails: TFDQuery
    Active = True
    IndexFieldNames = 'order_id'
    MasterSource = DSProviderOrders
    MasterFields = 'id'
    Connection = DMDatabase.dbConnection
    SQL.Strings = (
      
        'SELECT mo.id, mo.qtty, mo.price,mo.order_id, m.name, m.reference' +
        ', b.name as brandname '
      'FROM model_order mo'
      'INNER JOIN model m ON mo.model_id=m.id'
      'INNER JOIN brand b ON m.brand=b.id')
    Left = 640
    Top = 440
  end
  object DSProviderOrderDetails: TDataSource
    DataSet = FDQProviderOrderDetails
    Left = 720
    Top = 424
  end
end
