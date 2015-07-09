object JieTu_0: TJieTu_0
  Left = 394
  Top = 233
  Width = 937
  Height = 599
  Anchors = [akLeft, akTop, akRight, akBottom]
  AutoSize = True
  Caption = 'JieTu_0'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 0
    Top = 24
    Width = 929
    Height = 541
  end
  object Button2: TButton
    Left = 0
    Top = 0
    Width = 80
    Height = 29
    Caption = #20445#23384
    TabOrder = 0
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 80
    Top = 0
    Width = 80
    Height = 29
    Caption = #36820#22238
    TabOrder = 1
    OnClick = Button3Click
  end
  object SavePictureDialog1: TSavePictureDialog
    DefaultExt = '*.jpg'
    Filter = 'JPEG Image File (*.jpg)|*.jpg|Bitmaps (*.bmp)|*.bmp'
    Left = 160
  end
end
