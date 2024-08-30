object Form1: TForm1
  Left = 601
  Top = 934
  BorderStyle = bsDialog
  Caption = 'Arabic - Roman number converter '
  ClientHeight = 82
  ClientWidth = 300
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 10
    Top = 8
    Width = 70
    Height = 13
    Caption = 'Arabic Number'
  end
  object Label2: TLabel
    Left = 168
    Top = 8
    Width = 74
    Height = 13
    Caption = 'Roman Number'
  end
  object Label3: TLabel
    Left = 136
    Top = 24
    Width = 25
    Height = 21
    Alignment = taCenter
    AutoSize = False
    Caption = '>>'
    Layout = tlCenter
  end
  object Label4: TLabel
    Left = 26
    Top = 58
    Width = 271
    Height = 17
    AutoSize = False
    Caption = 'Autocorrect Roman Nr.                    (c) Sh. Koleka 2021'
    OnClick = Label4Click
  end
  object Edit1: TEdit
    Left = 8
    Top = 24
    Width = 129
    Height = 21
    TabOrder = 0
    OnKeyPress = validate_arab
    OnKeyUp = c_roman
  end
  object Edit2: TEdit
    Left = 160
    Top = 24
    Width = 129
    Height = 21
    TabOrder = 1
    OnKeyPress = validate_roman
    OnKeyUp = c_arab
  end
  object CheckBox1: TCheckBox
    Left = 8
    Top = 56
    Width = 17
    Height = 17
    Caption = 'CheckBox1'
    Checked = True
    State = cbChecked
    TabOrder = 2
    OnClick = autocorrect
  end
end
