object DMDatabase: TDMDatabase
  Height = 480
  Width = 640
  object FDTableBrand: TFDTable
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
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 184
    Top = 160
  end
end
