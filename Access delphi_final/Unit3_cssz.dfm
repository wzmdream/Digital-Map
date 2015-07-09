object setting: Tsetting
  Left = 557
  Top = 229
  Width = 333
  Height = 468
  Caption = #21442#25968#35774#32622
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 16
    Width = 65
    Height = 16
    AutoSize = False
    Caption = '['#26381#21153#22120']'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 24
    Top = 48
    Width = 22
    Height = 13
    AutoSize = False
    Caption = 'IP'#65306
  end
  object Label3: TLabel
    Left = 24
    Top = 96
    Width = 41
    Height = 13
    AutoSize = False
    Caption = 'User'#65306
  end
  object Label4: TLabel
    Left = 24
    Top = 136
    Width = 65
    Height = 13
    AutoSize = False
    Caption = 'Password'#65306
  end
  object Label5: TLabel
    Left = 24
    Top = 226
    Width = 73
    Height = 16
    AutoSize = False
    Caption = '['#22320#22270']'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 24
    Top = 266
    Width = 41
    Height = 13
    AutoSize = False
    Caption = 'Escale'#65306
  end
  object Label7: TLabel
    Left = 24
    Top = 306
    Width = 46
    Height = 13
    AutoSize = False
    Caption = 'SScale'#65306
  end
  object Label8: TLabel
    Left = 240
    Top = 274
    Width = 51
    Height = 13
    AutoSize = False
    Caption = #31859'/'#20687#32032
  end
  object Label9: TLabel
    Left = 240
    Top = 314
    Width = 49
    Height = 13
    AutoSize = False
    Caption = #20687#32032'/'#31859
  end
  object Label10: TLabel
    Left = 24
    Top = 176
    Width = 57
    Height = 13
    AutoSize = False
    Caption = 'Database:'
  end
  object ip: TEdit
    Left = 112
    Top = 48
    Width = 121
    Height = 21
    ImeName = #20013#25991' - QQ'#25340#38899#36755#20837#27861
    TabOrder = 0
    OnChange = ipChange
    OnKeyPress = ipKeyPress
  end
  object user: TEdit
    Left = 112
    Top = 90
    Width = 121
    Height = 21
    ImeName = #20013#25991' - QQ'#25340#38899#36755#20837#27861
    TabOrder = 1
  end
  object escale: TEdit
    Left = 112
    Top = 266
    Width = 121
    Height = 21
    ImeName = #20013#25991' - QQ'#25340#38899#36755#20837#27861
    TabOrder = 4
    OnChange = escaleChange
    OnKeyPress = escaleKeyPress
  end
  object sscale: TEdit
    Left = 112
    Top = 306
    Width = 121
    Height = 21
    ImeName = #20013#25991' - QQ'#25340#38899#36755#20837#27861
    TabOrder = 5
    OnChange = sscaleChange
    OnKeyPress = sscaleKeyPress
  end
  object password: TEdit
    Left = 112
    Top = 136
    Width = 121
    Height = 21
    ImeName = #20013#25991' - QQ'#25340#38899#36755#20837#27861
    TabOrder = 2
  end
  object Button1: TButton
    Left = 72
    Top = 360
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 6
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 192
    Top = 360
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 7
    OnClick = Button2Click
  end
  object Database: TEdit
    Left = 112
    Top = 176
    Width = 121
    Height = 21
    ImeName = #20013#25991' - QQ'#25340#38899#36755#20837#27861
    TabOrder = 3
  end
end
