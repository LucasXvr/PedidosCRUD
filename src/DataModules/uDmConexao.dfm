object DmConexao: TDmConexao
  OnCreate = DataModuleCreate
  Height = 262
  Width = 429
  object Conn: TFDConnection
    Params.Strings = (
      'DriverID=SQLite')
    AfterConnect = ConnAfterConnect
    BeforeConnect = ConnBeforeConnect
    Left = 104
    Top = 56
  end
  object FDPhysSQLiteDriverLink: TFDPhysSQLiteDriverLink
    Left = 224
    Top = 56
  end
end
