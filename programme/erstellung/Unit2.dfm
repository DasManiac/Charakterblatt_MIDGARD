object Form2: TForm2
  Left = 472
  Top = 317
  BorderStyle = bsDialog
  Caption = 'Form2'
  ClientHeight = 152
  ClientWidth = 285
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 272
    Height = 13
    Caption = 'Die G'#246'tter haben entschieden, dass ihr sehr talentiert seit.'
  end
  object Label2: TLabel
    Left = 16
    Top = 24
    Width = 241
    Height = 13
    Caption = 'Daher besitzt Ihr die M'#246'glichkeit, eine Angeborene '
  end
  object Label3: TLabel
    Left = 78
    Top = 40
    Width = 111
    Height = 13
    Caption = 'F'#228'higkeit frei zu w'#228'hlen'
  end
  object Label4: TLabel
    Left = 94
    Top = 64
    Width = 101
    Height = 13
    Caption = 'W'#228'hlt eure F'#228'higkeit.'
  end
  object Label5: TLabel
    Left = 46
    Top = 112
    Width = 192
    Height = 13
    Caption = 'Seit Ihr euch eurer Entscheidung sicher?'
    Visible = False
  end
  object ComboBox1: TComboBox
    Left = 56
    Top = 80
    Width = 185
    Height = 21
    HelpType = htKeyword
    Style = csDropDownList
    DropDownCount = 16
    ItemHeight = 13
    TabOrder = 0
    OnChange = ComboBox1Change
    Items.Strings = (
      'Sehen +4'
      'H'#246'ren +4'
      'Riechen +4'
      'Schmecken +4'
      'Tasten +4'
      'Sehen +10'
      'H'#246'ren +10'
      'Riechen +10'
      'Schmecken +10'
      'Tasten +10'
      'Sechster Sinn +6'
      'Berserkergang + (18 - Wk/5)'
      'Gute Reflexe +9'
      'Nachtsicht +8'
      'Richtungssinn +12'
      'Robustheit +9'
      'Wachgabe +6'
      'Einpr'#228'gen +4')
  end
  object Button1: TButton
    Left = 48
    Top = 128
    Width = 193
    Height = 17
    Caption = 'Ja'
    TabOrder = 1
    Visible = False
    OnClick = Button1Click
  end
end
