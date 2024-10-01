object FRandomKit: TFRandomKit
  Left = 0
  Top = 0
  Caption = 'FRandomKit'
  ClientHeight = 329
  ClientWidth = 602
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object Label1: TLabel
    Left = 328
    Top = 16
    Width = 33
    Height = 15
    Caption = 'Nom :'
  end
  object LRandomName: TLabel
    Left = 376
    Top = 16
    Width = 83
    Height = 15
    Caption = 'LRandomName'
  end
  object Label3: TLabel
    Left = 328
    Top = 48
    Width = 47
    Height = 15
    Caption = 'Marque :'
  end
  object LRandomBrand: TLabel
    Left = 381
    Top = 48
    Width = 82
    Height = 15
    Caption = 'LRandomBrand'
  end
  object Label5: TLabel
    Left = 328
    Top = 110
    Width = 75
    Height = 15
    Caption = 'Constructeur :'
  end
  object LRandomBuilder: TLabel
    Left = 409
    Top = 110
    Width = 88
    Height = 15
    Caption = 'LRandomBuilder'
  end
  object Label7: TLabel
    Left = 328
    Top = 136
    Width = 43
    Height = 15
    Caption = 'Echelle :'
  end
  object LRandomReference: TLabel
    Left = 392
    Top = 80
    Width = 103
    Height = 15
    Caption = 'LRandomReference'
  end
  object Label9: TLabel
    Left = 328
    Top = 168
    Width = 46
    Height = 15
    Caption = 'P'#233'riode :'
  end
  object LRandomScale: TLabel
    Left = 377
    Top = 136
    Width = 78
    Height = 15
    Caption = 'LRandomScale'
  end
  object Label11: TLabel
    Left = 329
    Top = 200
    Width = 57
    Height = 15
    Caption = 'Cat'#233'gorie :'
  end
  object LRandomCategory: TLabel
    Left = 392
    Top = 200
    Width = 99
    Height = 15
    Caption = 'LRandomCategory'
  end
  object Label13: TLabel
    Left = 328
    Top = 80
    Width = 58
    Height = 15
    Caption = 'R'#233'f'#233'rence :'
  end
  object LRandomPeriod: TLabel
    Left = 380
    Top = 168
    Width = 85
    Height = 15
    Caption = 'LRandomPeriod'
  end
  object Label15: TLabel
    Left = 329
    Top = 232
    Width = 65
    Height = 15
    Caption = 'Scalemates :'
  end
  object IRandomKit: TImage
    Left = 8
    Top = 8
    Width = 297
    Height = 225
    Proportional = True
    Stretch = True
  end
  object BRandomMoveKit: TButton
    Left = 24
    Top = 272
    Width = 137
    Height = 25
    Caption = 'D'#233'placer sur l'#39'atelier'
    TabOrder = 0
    OnClick = BRandomMoveKitClick
  end
  object LLRandomScalemates: TLinkLabel
    Left = 400
    Top = 232
    Width = 120
    Height = 19
    Caption = 'LLRandomScalemates'
    TabOrder = 1
    OnLinkClick = LLRandomScalematesLinkClick
  end
  object BRandomOtherKit: TButton
    Left = 224
    Top = 272
    Width = 151
    Height = 25
    Caption = 'Proposer un autre kit'
    TabOrder = 2
    OnClick = BRandomOtherKitClick
  end
end
