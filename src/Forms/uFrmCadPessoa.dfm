object FrmCadPessoa: TFrmCadPessoa
  Left = 0
  Top = 0
  Caption = 'Cadastrar Pessoa'
  ClientHeight = 334
  ClientWidth = 637
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
    Width = 637
    Height = 334
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitWidth = 633
    ExplicitHeight = 356
    object lblNome: TLabel
      Left = 32
      Top = 27
      Width = 33
      Height = 15
      Caption = 'Nome'
    end
    object lblCpfCnpj: TLabel
      Left = 336
      Top = 27
      Width = 46
      Height = 15
      Caption = 'Cpj Cnpj'
    end
    object lblTelefone: TLabel
      Left = 32
      Top = 92
      Width = 44
      Height = 15
      Caption = 'Telefone'
    end
    object lblEndereco: TLabel
      Left = 32
      Top = 159
      Width = 49
      Height = 15
      Caption = 'Endereco'
    end
    object lblCep: TLabel
      Left = 336
      Top = 92
      Width = 21
      Height = 15
      Caption = 'CEP'
    end
    object lblEstado: TLabel
      Left = 552
      Top = 159
      Width = 35
      Height = 15
      Caption = 'Estado'
    end
    object lblCidade: TLabel
      Left = 304
      Top = 159
      Width = 37
      Height = 15
      Caption = 'Cidade'
    end
    object edtNome: TEdit
      Left = 32
      Top = 48
      Width = 226
      Height = 26
      TabOrder = 0
    end
    object edtCpfCnpj: TEdit
      Left = 336
      Top = 48
      Width = 226
      Height = 26
      TabOrder = 1
    end
    object edtTelefone: TEdit
      Left = 32
      Top = 113
      Width = 226
      Height = 26
      TabOrder = 2
    end
    object edtEndereco: TEdit
      Left = 32
      Top = 180
      Width = 249
      Height = 26
      TabOrder = 3
    end
    object btnSalvar: TButton
      Left = 32
      Top = 248
      Width = 121
      Height = 57
      Caption = 'Salvar'
      TabOrder = 4
      OnClick = btnSalvarClick
    end
    object edtCep: TEdit
      Left = 336
      Top = 113
      Width = 226
      Height = 26
      TabOrder = 5
      OnExit = edtCepExit
      OnKeyPress = edtCepKeyPress
    end
    object edtEstado: TEdit
      Left = 552
      Top = 180
      Width = 65
      Height = 26
      TabOrder = 6
    end
    object edtCidade: TEdit
      Left = 304
      Top = 180
      Width = 226
      Height = 26
      TabOrder = 7
    end
  end
end