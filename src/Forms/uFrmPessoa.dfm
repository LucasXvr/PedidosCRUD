object FrmPessoa: TFrmPessoa
  Left = 0
  Top = 0
  Caption = 'Cadastro de Pessoa'
  ClientHeight = 547
  ClientWidth = 768
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
    Width = 768
    Height = 547
    Align = alClient
    TabOrder = 0
    ExplicitTop = 8
    object dbgPessoa: TDBGrid
      Left = 1
      Top = 97
      Width = 766
      Height = 449
      Align = alClient
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
    object pnlTopo: TPanel
      Left = 1
      Top = 1
      Width = 766
      Height = 96
      Align = alTop
      TabOrder = 1
      ExplicitLeft = 0
      ExplicitTop = -5
    end
  end
end
