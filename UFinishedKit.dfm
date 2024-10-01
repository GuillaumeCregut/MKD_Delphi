object FFinishedKit: TFFinishedKit
  Left = 0
  Top = 0
  Caption = 'Kits termin'#233's'
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
  object DBGFinishedKit: TDBGrid
    Left = 0
    Top = 73
    Width = 957
    Height = 400
    Align = alTop
    DataSource = DSFinishedKit
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    PopupMenu = PUMFinishedKit
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'name'
        Title.Caption = 'Nom'
        Width = 408
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'buildername'
        Title.Caption = 'Constructeur'
        Width = 171
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'brandname'
        Title.Caption = 'Marque'
        Width = 124
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
        FieldName = 'start_time'
        Title.Caption = 'D'#233'but'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'end_time'
        Title.Caption = 'Fin'
        Width = 93
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 957
    Height = 73
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 29
      Width = 131
      Height = 15
      Caption = 'Nombre de kit termin'#233's :'
    end
    object LFinishedNumber: TLabel
      Left = 152
      Top = 29
      Width = 6
      Height = 15
      Caption = '0'
    end
  end
  object FDQFinishedKit: TFDQuery
    Active = True
    Connection = DMDatabase.dbConnection
    SQL.Strings = (
      
        'SELECT mu.id ,mu.model_id, mu.start_time, mu.end_time,m.name, b.' +
        'name as buildername,br.name as brandname,s.name as scalename'
      'FROM model_user mu '
      'INNER JOIN model m ON mu.model_id=m.id'
      'INNER JOIN builders b ON m.builder=b.id'
      'INNER JOIN brand br ON m.brand=br.id'
      'INNER JOIN scale s ON m.scale=s.id'
      'WHERE mu.state=:status')
    Left = 208
    Top = 296
    ParamData = <
      item
        Name = 'STATUS'
        DataType = ftString
        ParamType = ptInput
        Value = '3'
      end>
  end
  object DSFinishedKit: TDataSource
    DataSet = FDQFinishedKit
    Left = 320
    Top = 312
  end
  object PUMFinishedKit: TPopupMenu
    Left = 800
    Top = 488
    object MIFinishedKitShowDetail: TMenuItem
      Caption = 'D'#233'tails'
      OnClick = MIFinishedKitShowDetailClick
    end
    object MIFinishedDelete: TMenuItem
      Caption = 'Supprimer'
      OnClick = MIFinishedDeleteClick
    end
  end
end
