object Form3: TForm3
  Left = 6
  Top = 122
  BorderStyle = bsDialog
  Caption = 'Form3'
  ClientHeight = 127
  ClientWidth = 1168
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
    Width = 56
    Height = 24
    Caption = 'Label1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 40
    Width = 3
    Height = 13
  end
  object Label3: TLabel
    Left = 240
    Top = 40
    Width = 3
    Height = 13
  end
  object Label4: TLabel
    Left = 472
    Top = 40
    Width = 3
    Height = 13
  end
  object Label5: TLabel
    Left = 704
    Top = 40
    Width = 3
    Height = 13
  end
  object Label6: TLabel
    Left = 936
    Top = 40
    Width = 3
    Height = 13
  end
  object Shape1: TShape
    Left = 936
    Top = 56
    Width = 225
    Height = 17
  end
  object CheckListBox1: TCheckListBox
    Left = 8
    Top = 56
    Width = 225
    Height = 17
    OnClickCheck = CheckListBox1ClickCheck
    ItemHeight = 13
    TabOrder = 0
  end
  object CheckListBox2: TCheckListBox
    Left = 240
    Top = 56
    Width = 225
    Height = 17
    OnClickCheck = CheckListBox2ClickCheck
    ItemHeight = 13
    TabOrder = 1
  end
  object CheckListBox3: TCheckListBox
    Left = 472
    Top = 56
    Width = 225
    Height = 17
    OnClickCheck = CheckListBox3ClickCheck
    ItemHeight = 13
    TabOrder = 2
  end
  object CheckListBox4: TCheckListBox
    Left = 704
    Top = 56
    Width = 225
    Height = 17
    OnClickCheck = CheckListBox4ClickCheck
    ItemHeight = 13
    TabOrder = 3
  end
  object CheckListBox5: TCheckListBox
    Left = 936
    Top = 56
    Width = 225
    Height = 17
    ItemHeight = 13
    TabOrder = 4
  end
  object Button1: TButton
    Left = 8
    Top = 80
    Width = 225
    Height = 17
    Caption = 'Punkt auf "Ungew'#246'hnliche Kenntnisse"'
    TabOrder = 5
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 240
    Top = 80
    Width = 225
    Height = 17
    Caption = 'Punkt auf "Ungew'#246'hnliche Kenntnisse"'
    TabOrder = 6
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 472
    Top = 80
    Width = 225
    Height = 17
    Caption = 'Punkt auf "Ungew'#246'hnliche Kenntnisse"'
    TabOrder = 7
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 936
    Top = 8
    Width = 225
    Height = 17
    Caption = 'Zur'#252'cksetzen'
    TabOrder = 8
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 8
    Top = 104
    Width = 1153
    Height = 17
    Caption = 'Button1'
    TabOrder = 9
  end
end
