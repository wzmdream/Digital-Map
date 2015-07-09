object DataModule2: TDataModule2
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 301
  Top = 246
  Height = 287
  Width = 932
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 32
    Top = 8
  end
  object ADOTa_class: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'D_class'
    Left = 120
    Top = 8
  end
  object ADOTa_area: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'D_area'
    Left = 200
    Top = 8
  end
  object ADOQu_QYHF: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 288
    Top = 8
  end
  object ADOQ_jbxx: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      '')
    Left = 368
    Top = 8
  end
  object DataSource_jbxx: TDataSource
    DataSet = ADOQ_jbxx
    Left = 368
    Top = 72
  end
  object ADOQ_tj: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 424
    Top = 8
  end
  object ADOT_Unit: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'Unit'
    Left = 488
    Top = 8
  end
  object ADOQ_qycz: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 560
    Top = 8
  end
  object ADOQ_dl: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      '')
    Left = 640
    Top = 8
  end
  object DataSource_dl: TDataSource
    DataSet = ADOQ_dl
    Left = 640
    Top = 80
  end
  object ADOQ_dw: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 696
    Top = 8
  end
end
