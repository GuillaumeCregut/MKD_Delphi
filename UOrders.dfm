object FOrders: TFOrders
  Left = 0
  Top = 0
  Caption = 'Commandes'
  ClientHeight = 460
  ClientWidth = 695
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
    Left = 8
    Top = 16
    Width = 111
    Height = 15
    Caption = 'Nouvelle commande'
  end
  object Label2: TLabel
    Left = 24
    Top = 51
    Width = 122
    Height = 15
    Caption = 'Date de la commande :'
  end
  object Label3: TLabel
    Left = 24
    Top = 128
    Width = 67
    Height = 15
    Caption = 'Fournisseur :'
  end
  object Label4: TLabel
    Left = 24
    Top = 208
    Width = 188
    Height = 15
    Caption = 'Liste des '#233'l'#233'ments de la commande'
  end
  object Label5: TLabel
    Left = 24
    Top = 88
    Width = 150
    Height = 15
    Caption = 'R'#233'f'#233'rence de la commande :'
  end
  object DBLCBOrderProvider: TDBLookupComboBox
    Left = 120
    Top = 128
    Width = 145
    Height = 23
    KeyField = 'name'
    ListField = 'name'
    ListSource = DSOrdersProvider
    TabOrder = 0
    OnCloseUp = DBLCBOrderProviderCloseUp
  end
  object DTPOrder: TDateTimePicker
    Left = 168
    Top = 43
    Width = 186
    Height = 23
    Date = 45567.000000000000000000
    Time = 0.649316539354913400
    TabOrder = 1
  end
  object EOrderRef: TEdit
    Left = 192
    Top = 85
    Width = 121
    Height = 23
    TabOrder = 2
  end
  object SGOrders: TStringGrid
    Left = 24
    Top = 229
    Width = 663
    Height = 172
    ColCount = 9
    FixedCols = 0
    RowCount = 2
    TabOrder = 3
    OnMouseUp = SGOrdersMouseUp
    ColWidths = (
      32
      130
      85
      64
      98
      93
      77
      32
      31)
  end
  object BAddOrder: TButton
    Left = 526
    Top = 427
    Width = 123
    Height = 25
    Caption = 'Valider la commande'
    TabOrder = 4
    OnClick = BAddOrderClick
  end
  object BOrderAddModel: TButton
    Left = 296
    Top = 168
    Width = 105
    Height = 25
    Caption = 'Ajouter un kit'
    TabOrder = 5
    OnClick = BOrderAddModelClick
  end
  object DSOrdersProvider: TDataSource
    DataSet = DMDatabase.FDTableProvider
    Left = 624
    Top = 24
  end
end
