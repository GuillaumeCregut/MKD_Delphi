object FBuilder: TFBuilder
  Left = 0
  Top = 0
  Caption = 'Constructeurs'
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
  object DBGBuilder: TDBGrid
    Left = 0
    Top = 0
    Width = 624
    Height = 280
    Align = alClient
    DataSource = DSBuilder
    PopupMenu = PUMBuilder
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnCellClick = DBGBuilderCellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'nom'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pays'
        Width = 400
        Visible = True
      end>
  end
  object PCBuilder: TPageControl
    Left = 0
    Top = 280
    Width = 624
    Height = 161
    ActivePage = TSBuilderUpdate
    Align = alBottom
    TabOrder = 1
    object TSBuilderAdd: TTabSheet
      Caption = 'Ajouter'
      object Label1: TLabel
        Left = 16
        Top = 8
        Width = 126
        Height = 15
        Caption = 'Ajouter un constructeur'
      end
      object Label2: TLabel
        Left = 16
        Top = 48
        Width = 36
        Height = 15
        Caption = 'Nom : '
      end
      object Label3: TLabel
        Left = 16
        Top = 88
        Width = 24
        Height = 15
        Caption = 'Pays'
      end
      object EBuilderNewName: TEdit
        Left = 72
        Top = 40
        Width = 121
        Height = 23
        TabOrder = 0
        OnChange = EBuilderNewNameChange
        OnExit = EBuilderNewNameExit
      end
      object BBuilderAdd: TButton
        Left = 336
        Top = 56
        Width = 75
        Height = 25
        Caption = 'Ajouter'
        TabOrder = 1
        OnClick = BBuilderAddClick
      end
      object DBLCBBuilderCountry: TDBLookupComboBox
        Left = 72
        Top = 80
        Width = 145
        Height = 23
        KeyField = 'name'
        ListSource = DSBuilderCountry
        TabOrder = 2
        OnCloseUp = DBLCBBuilderCountryCloseUp
      end
    end
    object TSBuilderUpdate: TTabSheet
      Caption = 'Modifier'
      ImageIndex = 1
      object Label4: TLabel
        Left = 16
        Top = 8
        Width = 132
        Height = 15
        Caption = 'Modifier un constructeur'
      end
      object Label5: TLabel
        Left = 16
        Top = 48
        Width = 82
        Height = 15
        Caption = 'Nouveau nom :'
      end
      object Label6: TLabel
        Left = 24
        Top = 88
        Width = 30
        Height = 15
        Caption = 'Pays :'
      end
      object EBuilderUpdateName: TEdit
        Left = 104
        Top = 40
        Width = 121
        Height = 23
        TabOrder = 0
        OnChange = EBuilderUpdateNameChange
      end
      object BBuilderUpdate: TButton
        Left = 496
        Top = 48
        Width = 75
        Height = 25
        Caption = 'Modifier'
        TabOrder = 1
        OnClick = BBuilderUpdateClick
      end
      object DBLCBBuilderUpdateCountry: TDBLookupComboBox
        Left = 88
        Top = 88
        Width = 145
        Height = 23
        DataField = 'country'
        DataSource = DSBuilder
        KeyField = 'id'
        ListField = 'name'
        ListSource = DSBuilderCountry
        TabOrder = 2
      end
    end
  end
  object DSBuilder: TDataSource
    DataSet = FDQBuilderDisplay
    Left = 496
    Top = 208
  end
  object FDQBuilderDisplay: TFDQuery
    Connection = DMDatabase.dbConnection
    SQL.Strings = (
      'SELECT b.id, b.name as nom, b.country, c.name as pays'
      'FROM builders b INNER JOIN country c'
      'ON b.country=c.id'
      'ORDER BY b.name')
    Left = 416
    Top = 248
  end
  object ALBuilder: TActionList
    Left = 320
    Top = 240
    object ABuilberRemove: TAction
      Caption = 'Supprimer'
      OnExecute = ABuilberRemoveExecute
    end
  end
  object PUMBuilder: TPopupMenu
    Left = 568
    Top = 176
    object Supprimer1: TMenuItem
      Action = ABuilberRemove
    end
  end
  object DSBuilderCountry: TDataSource
    DataSet = DMDatabase.FDTableCountry
    Left = 304
    Top = 376
  end
end
