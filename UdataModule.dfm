object DMDatabase: TDMDatabase
  Height = 480
  Width = 640
  object FDTableBrand: TFDTable
    Active = True
    IndexFieldNames = 'id'
    Connection = dbConnection
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'brand'
    Left = 24
    Top = 16
  end
  object dbConnection: TFDConnection
    Params.Strings = (
      'LockingMode=Normal'
      
        'Database=F:\projets\Embarcadero\ModelKitDatabase\Win32\Debug\Mod' +
        'elsKitDatabase.db'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    OnError = dbConnectionError
    Left = 184
    Top = 160
  end
  object SystemQuery: TFDQuery
    Connection = dbConnection
    Transaction = Transaction
    Left = 424
    Top = 168
  end
  object Transaction: TFDTransaction
    Connection = dbConnection
    Left = 344
    Top = 144
  end
end
