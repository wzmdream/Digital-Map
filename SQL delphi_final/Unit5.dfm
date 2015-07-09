object Form5: TForm5
  Left = 441
  Top = 242
  Width = 502
  Height = 364
  Caption = #21024#38500#26631#27880#21333#20301
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
  object Panel1: TPanel
    Left = 0
    Top = 8
    Width = 481
    Height = 313
    Caption = 'Panel1'
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 16
      Top = 8
      Width = 465
      Height = 241
      Caption = #21024#38500#21333#20301
      TabOrder = 0
      object Label1: TLabel
        Left = 24
        Top = 25
        Width = 41
        Height = 12
        AutoSize = False
        Caption = #31867#22411#65306
      end
      object Label2: TLabel
        Left = 8
        Top = 64
        Width = 48
        Height = 13
        AutoSize = False
        Caption = #25152#23646#22320#65306
      end
      object Label3: TLabel
        Left = 16
        Top = 113
        Width = 36
        Height = 13
        Caption = #21517#31216#65306
      end
      object Label4: TLabel
        Left = 16
        Top = 157
        Width = 36
        Height = 13
        Caption = #32534#21495#65306
      end
      object Label7: TLabel
        Left = 256
        Top = 29
        Width = 46
        Height = 17
        AutoSize = False
        Caption = 'IP'#22320#22336#65306
      end
      object Label8: TLabel
        Left = 256
        Top = 74
        Width = 43
        Height = 13
        AutoSize = False
        Caption = 'X'#22352#26631#65306
      end
      object Label9: TLabel
        Left = 256
        Top = 128
        Width = 43
        Height = 13
        AutoSize = False
        Caption = 'Y'#22352#26631#65306
      end
      object ComboBox1: TComboBox
        Left = 64
        Top = 22
        Width = 121
        Height = 21
        ImeName = #20013#25991' - QQ'#25340#38899#36755#20837#27861
        ItemHeight = 13
        TabOrder = 0
      end
      object ComboBox2: TComboBox
        Left = 64
        Top = 64
        Width = 121
        Height = 21
        ImeName = #20013#25991' - QQ'#25340#38899#36755#20837#27861
        ItemHeight = 13
        TabOrder = 1
        OnChange = ComboBox2Change
      end
      object ComboBox3: TComboBox
        Left = 65
        Top = 109
        Width = 121
        Height = 21
        ImeName = #20013#25991' - QQ'#25340#38899#36755#20837#27861
        ItemHeight = 13
        TabOrder = 2
        OnChange = ComboBox3Change
      end
      object Edit1: TEdit
        Left = 312
        Top = 72
        Width = 121
        Height = 21
        ImeName = #20013#25991' - QQ'#25340#38899#36755#20837#27861
        TabOrder = 3
      end
      object Edit2: TEdit
        Left = 312
        Top = 128
        Width = 121
        Height = 21
        ImeName = #20013#25991' - QQ'#25340#38899#36755#20837#27861
        TabOrder = 4
      end
      object Edit3: TEdit
        Left = 64
        Top = 152
        Width = 121
        Height = 21
        ImeName = #20013#25991' - QQ'#25340#38899#36755#20837#27861
        TabOrder = 5
      end
      object Edit4: TEdit
        Left = 312
        Top = 24
        Width = 121
        Height = 21
        ImeName = #20013#25991' - QQ'#25340#38899#36755#20837#27861
        TabOrder = 6
      end
    end
    object CheckBox1: TCheckBox
      Left = 16
      Top = 264
      Width = 113
      Height = 25
      Caption = #20851#38381#25552#31034#20449#24687
      TabOrder = 1
    end
    object Button1: TButton
      Left = 176
      Top = 264
      Width = 89
      Height = 33
      Caption = #21024#38500
      TabOrder = 2
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 376
      Top = 272
      Width = 75
      Height = 25
      Caption = #36820#22238
      TabOrder = 3
      OnClick = Button2Click
    end
  end
end
