object Form__qycz: TForm__qycz
  Left = 477
  Top = 207
  Width = 496
  Height = 536
  Caption = #21306#22495#26597#25214
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 424
    Width = 465
    Height = 25
    AutoSize = False
    Caption = 'Label1'
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 201
    Height = 129
    Caption = #25351#23450#26597#25214#26465#20214
    TabOrder = 0
    object Label2: TLabel
      Left = 8
      Top = 24
      Width = 73
      Height = 17
      AutoSize = False
      Caption = #21333#20301#31867#22411#65306
    end
    object Label3: TLabel
      Left = 8
      Top = 55
      Width = 73
      Height = 17
      AutoSize = False
      Caption = #21306#22495#21322#24452#65306
    end
    object Label4: TLabel
      Left = 9
      Top = 88
      Width = 36
      Height = 13
      Caption = #39068#33394#65306
    end
    object Label5: TLabel
      Left = 136
      Top = 56
      Width = 58
      Height = 13
      AutoSize = False
      Caption = '  (0-9999)'#31859
    end
    object Label6: TLabel
      Left = 115
      Top = 88
      Width = 34
      Height = 17
      AutoSize = False
      Caption = #23485#24230#65306
    end
    object ComboBox1: TComboBox
      Left = 72
      Top = 21
      Width = 121
      Height = 21
      ImeName = #20013#25991' - QQ'#25340#38899#36755#20837#27861
      ItemHeight = 13
      TabOrder = 0
    end
    object UpDown1: TUpDown
      Left = 107
      Top = 50
      Width = 17
      Height = 21
      Associate = Edit1
      Max = 9999
      ParentShowHint = False
      Position = 500
      ShowHint = False
      TabOrder = 1
      Thousands = False
    end
    object Edit1: TEdit
      Left = 74
      Top = 50
      Width = 33
      Height = 21
      ImeName = #20013#25991' - QQ'#25340#38899#36755#20837#27861
      MaxLength = 4
      TabOrder = 2
      Text = '500'
      OnKeyPress = Edit1KeyPress
    end
    object ColorBox1: TColorBox
      Left = 41
      Top = 84
      Width = 74
      Height = 22
      DefaultColorColor = clLime
      Selected = clBlue
      ItemHeight = 16
      TabOrder = 3
    end
    object UpDown2: TUpDown
      Left = 174
      Top = 84
      Width = 16
      Height = 21
      Associate = Edit2
      Max = 10
      Position = 2
      TabOrder = 4
    end
    object Edit2: TEdit
      Left = 152
      Top = 84
      Width = 22
      Height = 21
      ImeName = #20013#25991' - QQ'#25340#38899#36755#20837#27861
      MaxLength = 2
      TabOrder = 5
      Text = '2'
      OnChange = Edit2Change
      OnKeyPress = Edit2KeyPress
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 136
    Width = 201
    Height = 281
    Caption = #21333#20301#21015#34920
    TabOrder = 1
    object ListBox1: TListBox
      Left = 5
      Top = 16
      Width = 185
      Height = 257
      Style = lbOwnerDrawVariable
      ImeName = #20013#25991' - QQ'#25340#38899#36755#20837#27861
      ItemHeight = 16
      TabOrder = 0
      OnClick = ListBox1Click
    end
  end
  object GroupBox3: TGroupBox
    Left = 216
    Top = 8
    Width = 257
    Height = 409
    Caption = #35814#32454#20449#24687
    TabOrder = 2
    object ValueListEditor1: TValueListEditor
      Left = 8
      Top = 24
      Width = 241
      Height = 369
      TabOrder = 0
      TitleCaptions.Strings = (
        #23646#24615
        #20540)
      ColWidths = (
        77
        158)
    end
  end
  object Button1: TButton
    Left = 16
    Top = 456
    Width = 75
    Height = 25
    Caption = #26597#25214
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 112
    Top = 456
    Width = 75
    Height = 25
    Caption = #21047#26032
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button3: TButton
    Left = 208
    Top = 456
    Width = 75
    Height = 25
    Caption = #25171#21360
    TabOrder = 5
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 304
    Top = 456
    Width = 75
    Height = 25
    Caption = #23548#20986
    TabOrder = 6
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 392
    Top = 456
    Width = 75
    Height = 25
    Caption = #36820#22238
    TabOrder = 7
    OnClick = Button5Click
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 208
    Top = 424
  end
  object PrintDialog1: TPrintDialog
    Left = 248
    Top = 424
  end
end
