object FrmLogin: TFrmLogin
  Left = 0
  Top = 0
  Caption = 'Login'
  ClientHeight = 448
  ClientWidth = 600
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object pnlPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 600
    Height = 448
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 200
      Top = 99
      Width = 33
      Height = 15
      Caption = 'Nome'
    end
    object Label2: TLabel
      Left = 200
      Top = 155
      Width = 32
      Height = 15
      Caption = 'Senha'
    end
    object edtNome: TEdit
      Left = 200
      Top = 120
      Width = 193
      Height = 23
      TabOrder = 0
    end
    object edtSenha: TEdit
      Left = 200
      Top = 176
      Width = 193
      Height = 23
      TabOrder = 1
    end
    object btnLogin: TButton
      Left = 240
      Top = 240
      Width = 113
      Height = 57
      Caption = 'Login'
      TabOrder = 2
      OnClick = btnLoginClick
    end
  end
end
