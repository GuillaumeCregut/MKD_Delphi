object FModelDetail: TFModelDetail
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Mod'#232'le : d'#233'tails'
  ClientHeight = 344
  ClientWidth = 793
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object IModelDetailPicture: TImage
    Left = 8
    Top = 8
    Width = 320
    Height = 214
    Proportional = True
    Stretch = True
  end
  object DBTModelCategory: TDBText
    Left = 423
    Top = 232
    Width = 129
    Height = 17
    DataField = 'cat'#233'gorie'
    DataSource = DSModelDetail
  end
  object DBTModelBuilder: TDBText
    Left = 441
    Top = 131
    Width = 129
    Height = 17
    DataField = 'constructeur'
    DataSource = DSModelDetail
  end
  object DBTModelScale: TDBText
    Left = 416
    Top = 200
    Width = 129
    Height = 17
    DataField = #233'chelle'
    DataSource = DSModelDetail
  end
  object DBTModelBrand: TDBText
    Left = 416
    Top = 64
    Width = 129
    Height = 17
    DataField = 'marque'
    DataSource = DSModelDetail
  end
  object DBTModelPeriod: TDBText
    Left = 576
    Top = 200
    Width = 113
    Height = 17
    DataField = 'p'#233'riode'
    DataSource = DSModelDetail
  end
  object DBTModelName: TDBText
    Left = 360
    Top = 41
    Width = 89
    Height = 17
    DataField = 'name'
    DataSource = DSModelDetail
  end
  object DBTModelRef: TDBText
    Left = 424
    Top = 96
    Width = 96
    Height = 17
    DataField = 'reference'
    DataSource = DSModelDetail
  end
  object DBTModelCountry: TDBText
    Left = 416
    Top = 160
    Width = 120
    Height = 17
    DataField = 'countryName'
    DataSource = DSModelDetail
  end
  object Label1: TLabel
    Left = 360
    Top = 232
    Width = 57
    Height = 15
    Caption = 'Cat'#233'gorie: '
  end
  object Label2: TLabel
    Left = 360
    Top = 11
    Width = 33
    Height = 15
    Caption = 'Nom :'
  end
  object Label3: TLabel
    Left = 360
    Top = 64
    Width = 50
    Height = 15
    Caption = 'Marque : '
  end
  object Label4: TLabel
    Left = 360
    Top = 96
    Width = 58
    Height = 15
    Caption = 'R'#233'f'#233'rence :'
  end
  object Label5: TLabel
    Left = 360
    Top = 131
    Width = 75
    Height = 15
    Caption = 'Constructeur :'
  end
  object Label6: TLabel
    Left = 360
    Top = 160
    Width = 30
    Height = 15
    Caption = 'Pays :'
  end
  object Label7: TLabel
    Left = 360
    Top = 200
    Width = 43
    Height = 15
    Caption = 'Echelle :'
  end
  object Label8: TLabel
    Left = 520
    Top = 200
    Width = 46
    Height = 15
    Caption = 'P'#233'riode :'
  end
  object LLModelDetail: TLinkLabel
    Left = 64
    Top = 248
    Width = 165
    Height = 19
    Caption = 
      '<a href="https://www.mkd.editiel98.net">https://www.mkd.editiel9' +
      '8.net</a>'
    TabOrder = 0
    OnLinkClick = LLModelDetailLinkClick
  end
  object BModelDetailAddStock: TButton
    Left = 32
    Top = 296
    Width = 113
    Height = 25
    Caption = 'Ajouter au stock'
    TabOrder = 1
    OnClick = BModelDetailAddStockClick
  end
  object BModelDetailAddLike: TButton
    Left = 208
    Top = 296
    Width = 195
    Height = 25
    Caption = 'Supprimer des favoris'
    TabOrder = 2
    OnClick = BModelDetailAddLikeClick
  end
  object FDQModelDetail: TFDQuery
    Connection = DMDatabase.dbConnection
    SQL.Strings = (
      
        ' SELECT m.*, bu.name as constructeur, c.name as cat'#233'gorie, s.nam' +
        'e as '#233'chelle, p.name as p'#233'riode, b.name as marque, co.name as co' +
        'untryName'
      'FROM model m'
      'INNER JOIN category c ON m.category = c.id'
      'INNER JOIN scale s ON m.scale= s.id'
      'INNER JOIN period p ON m.period= p.id'
      'INNER JOIN brand b ON m.brand=b.id'
      'INNER JOIN builders bu ON m.builder = bu.id'
      'INNER JOIN country co ON bu.country=co.id'
      'WHERE m.id=:id')
    Left = 504
    Top = 272
    ParamData = <
      item
        Name = 'ID'
        DataType = ftString
        ParamType = ptInput
        Value = '1'
      end>
  end
  object DSModelDetail: TDataSource
    DataSet = FDQModelDetail
    Left = 576
    Top = 232
  end
  object FDQModelFavorite: TFDQuery
    Connection = DMDatabase.dbConnection
    Left = 680
    Top = 272
  end
  object DSFavorite: TDataSource
    DataSet = FDQModelFavorite
    Left = 592
    Top = 296
  end
end
