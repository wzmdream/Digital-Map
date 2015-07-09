object JieTu_1: TJieTu_1
  Left = 414
  Top = 204
  Align = alClient
  AutoSize = True
  BorderStyle = bsNone
  Caption = 'JieTu_1'
  ClientHeight = 236
  ClientWidth = 205
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    205
    236)
  PixelsPerInch = 96
  TextHeight = 13
  object Shape1: TShape
    Left = 80
    Top = 72
    Width = 65
    Height = 65
    Hint = #35831#25353#40736#26631#24038#38190#24320#22987#25429#25417
    Brush.Style = bsClear
    ParentShowHint = False
    Pen.Color = clBlue
    Pen.Mode = pmNotXor
    Pen.Width = 2
    ShowHint = True
    Visible = False
  end
  object Image1: TImage
    Left = 0
    Top = 0
    Width = 213
    Height = 246
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoSize = True
    Center = True
    OnMouseDown = Image1MouseDown
    OnMouseMove = Image1MouseMove
    OnMouseUp = Image1MouseUp
  end
end
