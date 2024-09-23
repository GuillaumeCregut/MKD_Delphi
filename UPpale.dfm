object FPpale: TFPpale
  Left = 0
  Top = 0
  Caption = 'Models Kit Database'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  OnCreate = FormCreate
  TextHeight = 15
  object SBMain: TStatusBar
    Left = 0
    Top = 422
    Width = 624
    Height = 19
    Panels = <
      item
        Text = '(c) 2024 Editiel 98'
        Width = 50
      end>
  end
  object MainMenu1: TMainMenu
    Left = 552
    Top = 8
    object Bonjour1: TMenuItem
      Caption = 'Param'#232'tres'
      object Pays1: TMenuItem
        Caption = 'Pays'
        OnClick = Pays1Click
      end
      object Pays2: TMenuItem
        Caption = 'P'#233'riodes'
      end
      object Catgories1: TMenuItem
        Caption = 'Cat'#233'gories'
        OnClick = Catgories1Click
      end
      object Catgories2: TMenuItem
        Caption = 'Echelles'
      end
      object Constructeurs1: TMenuItem
        Caption = 'Constructeurs'
      end
      object Marques1: TMenuItem
        Caption = 'Marques'
        OnClick = Marques1Click
      end
      object Marques2: TMenuItem
        Caption = 'Mod'#232'les'
      end
    end
    object Profil1: TMenuItem
      Caption = 'Profil'
      object Fournisseurs1: TMenuItem
        Caption = 'Fournisseurs'
      end
      object Fournisseurs2: TMenuItem
        Caption = 'Commandes'
      end
      object Statistiques1: TMenuItem
        Caption = 'Statistiques'
      end
      object Statistiques2: TMenuItem
        Caption = 'Exporter'
      end
    end
    object Kits1: TMenuItem
      Caption = 'Kits'
      object Vuegnrale1: TMenuItem
        Caption = 'Vue g'#233'n'#233'rale'
      end
      object Kitscommands1: TMenuItem
        Caption = 'Kits command'#233's'
      end
      object Kitscommands2: TMenuItem
        Caption = 'Kits en stock'
      end
      object Kitsencours1: TMenuItem
        Caption = 'Kits en cours'
      end
      object Choisirunkit1: TMenuItem
        Caption = 'Choisir un kit'
      end
      object Choisirunkit2: TMenuItem
        Caption = 'Kits termin'#233's'
      end
    end
    object Systme1: TMenuItem
      Caption = 'Syst'#232'me'
      object Exporterlabase1: TMenuItem
        Caption = 'Exporter la base'
      end
    end
  end
  object DataSource1: TDataSource
    Left = 464
    Top = 296
  end
end
