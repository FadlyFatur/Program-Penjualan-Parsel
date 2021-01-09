object _Struk: T_Struk
  Left = 594
  Top = 154
  Width = 447
  Height = 534
  Caption = 'Pesan'
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object struk_mm: TMemo
    Left = 56
    Top = 40
    Width = 321
    Height = 385
    Color = cl3DLight
    Enabled = False
    Lines.Strings = (
      '                                                Parselisme'
      '____________________________________________________')
    ReadOnly = True
    TabOrder = 0
  end
  object Button1: TButton
    Left = 272
    Top = 432
    Width = 75
    Height = 25
    Caption = 'Print'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 88
    Top = 432
    Width = 75
    Height = 25
    Caption = 'keluar'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 168
    Top = 432
    Width = 75
    Height = 25
    Caption = 'Menu'
    TabOrder = 3
    OnClick = Button3Click
  end
end
