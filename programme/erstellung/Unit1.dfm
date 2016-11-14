object Form1: TForm1
  Left = 36
  Top = 134
  Width = 1190
  Height = 725
  Caption = 'Form1'
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
  object RadioGroup1: TRadioGroup
    Left = 8
    Top = 120
    Width = 89
    Height = 49
    Caption = 'Geschlecht'
    Items.Strings = (
      'M'#228'nnlich'
      'Weiblich')
    TabOrder = 0
    OnClick = RadioGroup1Click
  end
  object RadioGroup2: TRadioGroup
    Left = 8
    Top = 176
    Width = 193
    Height = 89
    Caption = 'Rasse'
    Items.Strings = (
      'Mensch'
      'Zwerg'
      'Elf'
      'Halbling'
      'Gnom')
    TabOrder = 1
    OnClick = RadioGroup2Click
  end
  object RadioGroup3: TRadioGroup
    Left = 8
    Top = 272
    Width = 193
    Height = 409
    Caption = 'Klasse'
    Items.Strings = (
      'As - Assassine'
      'BN - Nordlandbarbar'
      'BS - Steppenbarbar'
      'BW - Waldlandbarbar'
      'Er - Ermittler'
      'Gl - Gl'#252'cksritter'
      'H'#228' - H'#228'ndler'
      'Kr - Krieger'
      'Ku - Kundschafter'
      'Se - Seefahrer'
      'S'#246' - S'#246'ldner'
      'Sp - Spitzbube'
      'Wa - Waldl'#228'ufer'
      'Ba - Barde'
      'Or - Ordenskrieger'
      'Tm - Tiermeister'
      'Be - Beschw'#246'rer'
      'Dr - Druide'
      'Hl - Heiler'
      'Hx - Hexer'
      'Ma - Magier'
      'PF - Fruchtbarkeitspriester'
      'PHa - Handelspriester'
      'PHe - Herrschaftspriester'
      'PK -  Kriegspriester'
      'PM - Meerespriester'
      'PT -  Todespriester'
      'PW -  Weisheitspriester'
      'Sc - Schamane'
      'Th - Thaumaturg')
    TabOrder = 2
    OnClick = RadioGroup3Click
  end
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 121
    Height = 81
    Caption = 'W'#252'rfeln'
    Enabled = False
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button3: TButton
    Left = 8
    Top = 96
    Width = 121
    Height = 17
    Caption = 'Charakter erstellen!'
    Enabled = False
    TabOrder = 4
    OnClick = Button3Click
  end
  object ListView1: TListView
    Left = 136
    Top = 8
    Width = 64
    Height = 107
    Columns = <
      item
        Width = 30
      end
      item
        Width = 30
      end>
    ColumnClick = False
    Items.Data = {
      920000000600000000000000FFFFFFFFFFFFFFFF000000000000000002537400
      000000FFFFFFFFFFFFFFFF000000000000000002477300000000FFFFFFFFFFFF
      FFFF000000000000000002477700000000FFFFFFFFFFFFFFFF00000000000000
      00024B6F00000000FFFFFFFFFFFFFFFF000000000000000002496E00000000FF
      FFFFFFFFFFFFFF0000000000000000025A74}
    TabOrder = 5
    ViewStyle = vsReport
  end
  object ListView2: TListView
    Left = 208
    Top = 8
    Width = 959
    Height = 673
    Columns = <
      item
        Width = 170
      end
      item
        Caption = 'W'#252'rfel'
        Width = 55
      end
      item
        Caption = 'Rechnung'
        Width = 200
      end
      item
        Caption = 'Ergebnis'
        Width = 150
      end
      item
        Caption = 'Sonstiges'
        Width = 380
      end>
    ColumnClick = False
    TabOrder = 6
    ViewStyle = vsReport
  end
  object RadioGroup4: TRadioGroup
    Left = 104
    Top = 120
    Width = 97
    Height = 49
    Caption = 'Heimat'
    Items.Strings = (
      'Land'
      'Stadt')
    TabOrder = 7
    OnClick = RadioGroup4Click
  end
end
