object FrmTelaInicial: TFrmTelaInicial
  Left = 0
  Top = 0
  Caption = 'Tela Inicial'
  ClientHeight = 571
  ClientWidth = 803
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
    Width = 803
    Height = 571
    Align = alClient
    TabOrder = 0
    object pnlMenu: TPanel
      Left = 1
      Top = 1
      Width = 801
      Height = 88
      Align = alTop
      TabOrder = 0
      object btnPedidos: TButton
        Left = 97
        Top = 1
        Width = 96
        Height = 86
        Align = alLeft
        Caption = 'Pedidos'
        TabOrder = 0
        OnClick = btnPedidosClick
        ExplicitLeft = 1
      end
      object btnPessoa: TButton
        Left = 1
        Top = 1
        Width = 96
        Height = 86
        Align = alLeft
        Caption = 'Pessoa'
        TabOrder = 1
        OnClick = btnPessoaClick
      end
    end
  end
end
