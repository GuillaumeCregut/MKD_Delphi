object FFinishedDetail: TFFinishedDetail
  Left = 0
  Top = 0
  Caption = 'D'#233'tails'
  ClientHeight = 441
  ClientWidth = 708
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnHide = FormHide
  OnShow = FormShow
  TextHeight = 15
  object IFinishedImage: TImage
    Left = 8
    Top = 8
    Width = 257
    Height = 172
    Proportional = True
    Stretch = True
  end
  object GroupBox1: TGroupBox
    Left = 287
    Top = 8
    Width = 385
    Height = 172
    Caption = 'Information sur le kit'
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 33
      Height = 15
      Caption = 'Nom :'
    end
    object Label2: TLabel
      Left = 16
      Top = 45
      Width = 75
      Height = 15
      Caption = 'Constructeur :'
    end
    object Label3: TLabel
      Left = 16
      Top = 66
      Width = 47
      Height = 15
      Caption = 'Marque :'
    end
    object Label4: TLabel
      Left = 16
      Top = 87
      Width = 58
      Height = 15
      Caption = 'R'#233'f'#233'rence :'
    end
    object Label5: TLabel
      Left = 16
      Top = 108
      Width = 43
      Height = 15
      Caption = 'Echelle :'
    end
    object Label6: TLabel
      Left = 16
      Top = 129
      Width = 46
      Height = 15
      Caption = 'P'#233'riode :'
    end
    object Label7: TLabel
      Left = 16
      Top = 150
      Width = 57
      Height = 15
      Caption = 'Cat'#233'gorie :'
    end
    object LFinishedDetailBrand: TLabel
      Left = 69
      Top = 66
      Width = 5
      Height = 15
      Caption = '-'
    end
    object LFinishedDetailBuilder: TLabel
      Left = 97
      Top = 45
      Width = 5
      Height = 15
      Caption = '-'
    end
    object LFinishedDetailCategory: TLabel
      Left = 79
      Top = 150
      Width = 5
      Height = 15
      Caption = '-'
    end
    object LFinishedDetailName: TLabel
      Left = 55
      Top = 24
      Width = 5
      Height = 15
      Caption = '-'
    end
    object LFinishedDetailPeriod: TLabel
      Left = 68
      Top = 129
      Width = 5
      Height = 15
      Caption = '-'
    end
    object LFinishedDetailReference: TLabel
      Left = 82
      Top = 87
      Width = 5
      Height = 15
      Caption = '-'
    end
    object LFinishedDetailScale: TLabel
      Left = 65
      Top = 108
      Width = 5
      Height = 15
      Caption = '-'
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 200
    Width = 257
    Height = 151
    Caption = 'Informations sur le kit'
    TabOrder = 1
    object Label10: TLabel
      Left = 16
      Top = 74
      Width = 67
      Height = 15
      Caption = 'Fournisseur :'
    end
    object Label11: TLabel
      Left = 17
      Top = 95
      Width = 26
      Height = 15
      Caption = 'Prix :'
    end
    object Label8: TLabel
      Left = 16
      Top = 32
      Width = 84
      Height = 15
      Caption = 'Date du d'#233'but : '
    end
    object Label9: TLabel
      Left = 17
      Top = 53
      Width = 66
      Height = 15
      Caption = 'Date de fin : '
    end
    object LFinishedDetailEndTime: TLabel
      Left = 106
      Top = 53
      Width = 5
      Height = 15
      Caption = '-'
    end
    object LFinishedDetailPrice: TLabel
      Left = 62
      Top = 95
      Width = 5
      Height = 15
      Caption = '-'
    end
    object LFinishedDetailProvider: TLabel
      Left = 106
      Top = 74
      Width = 5
      Height = 15
      Caption = '-'
    end
    object LFinishedDetailStartTime: TLabel
      Left = 106
      Top = 32
      Width = 5
      Height = 15
      Caption = '-'
    end
  end
  object FDQFinishedDetail: TFDQuery
    Connection = DMDatabase.dbConnection
    Left = 544
    Top = 296
  end
  object DSFinishedDetail: TDataSource
    DataSet = FDQFinishedDetail
    Left = 544
    Top = 368
  end
end
