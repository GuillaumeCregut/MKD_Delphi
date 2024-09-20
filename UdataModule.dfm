object DMDatabase: TDMDatabase
  Height = 480
  Width = 640
  object FDTableBrand: TFDTable
    IndexFieldNames = 'id'
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'brand'
    Left = 144
    Top = 24
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
