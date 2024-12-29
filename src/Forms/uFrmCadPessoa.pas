unit uFrmCadPessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, uPessoa,
  uDmConexao, uCepService;

type
  TFrmCadPessoa = class(TForm)
    pnlPrincipal: TPanel;
    edtNome: TEdit;
    edtCpfCnpj: TEdit;
    edtTelefone: TEdit;
    edtEndereco: TEdit;
    btnSalvar: TButton;
    lblNome: TLabel;
    lblCpfCnpj: TLabel;
    lblTelefone: TLabel;
    lblEndereco: TLabel;
    edtCep: TEdit;
    lblCep: TLabel;
    edtEstado: TEdit;
    lblEstado: TLabel;
    edtCidade: TEdit;
    lblCidade: TLabel;
    procedure btnSalvarClick(Sender: TObject);
    procedure edtCepKeyPress(Sender: TObject; var Key: Char);
    procedure edtCepExit(Sender: TObject);
    procedure edtEditarClick(Sender: TObject);
  private
    { Private declarations }
    FPessoaID: Integer;
    procedure BuscarCepEPreencher;
  public
    { Public declarations }
    procedure PrepararFormularioParaEdicao(const PessoaID: Integer);
  end;

var
  FrmCadPessoa: TFrmCadPessoa;

implementation

uses
  uFrmPessoa;

{$R *.dfm}

procedure TFrmCadPessoa.btnSalvarClick(Sender: TObject);
var
  Pessoa: TPessoa;
begin
  Pessoa := TPessoa.Create;
  try
    Pessoa.ID := FPessoaID;
    Pessoa.Nome := edtNome.Text;
    Pessoa.CpfCnpj := edtCpfCnpj.Text;
    Pessoa.Telefone := edtTelefone.Text;
    Pessoa.Endereco := edtEndereco.Text;
    Pessoa.Cep := edtCep.Text;
    Pessoa.Cidade := edtCidade.Text;
    Pessoa.Estado := edtEstado.Text;

    if FPessoaID = 0 then
    begin
      Pessoa.Inserir(DmConexao.Conn);
      ShowMessage('Pessoa cadastrada com sucesso!');
    end
    else
    begin
      Pessoa.Editar(DmConexao.Conn);
      ShowMessage('Pessoa editada com sucesso!');
    end;

    if Assigned(FrmPessoa) then
      FrmPessoa.AtualizarGrid;

    ModalResult := mrOk;
  finally
    Pessoa.Free;
  end;
end;

procedure TFrmCadPessoa.BuscarCepEPreencher;
var
  Endereco, Cidade, Estado: string;
  CepService: TCepService;
begin
  CepService := TCepService.Create;
  try
    if CepService.BuscarCep(edtCep.Text, Endereco, Cidade, Estado) then
    begin
      edtEndereco.Text := Endereco;
      edtCidade.Text := Cidade;
      edtEstado.Text := Estado;
    end
    else
    begin
      ShowMessage('CEP inválido ou não encontrado.');
    end;
  finally
    CepService.Free;
  end;
end;

procedure TFrmCadPessoa.edtCepExit(Sender: TObject);
begin
  BuscarCepEPreencher;
end;

procedure TFrmCadPessoa.edtCepKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    BuscarCepEPreencher;
  end;
end;

procedure TFrmCadPessoa.edtEditarClick(Sender: TObject);
var
  Pessoa: TPessoa;
begin
  Pessoa := TPessoa.Create;
  try
    Pessoa.Nome := edtNome.Text;
    Pessoa.CpfCnpj := edtCpfCnpj.Text;
    Pessoa.Telefone := edtTelefone.Text;
    Pessoa.Endereco := edtEndereco.Text;
    Pessoa.Cep := edtCep.Text;
    Pessoa.Cidade := edtCidade.Text;
    Pessoa.Estado := edtEstado.Text;
    Pessoa.Editar(DmConexao.Conn);

    if Assigned(FrmPessoa) then
      FrmPessoa.AtualizarGrid;

    Close;
  finally
    Pessoa.Free;
  end;
end;

procedure TFrmCadPessoa.PrepararFormularioParaEdicao(const PessoaID: Integer);
var
  Pessoa: TPessoa;
begin
  FPessoaID := PessoaID;

  if PessoaID > 0 then
  begin
    Pessoa := TPessoa.BuscarPorID(DmConexao.Conn, PessoaID);
    try
      if Assigned(Pessoa) then
      begin
        edtNome.Text := Pessoa.Nome;
        edtCpfCnpj.Text := Pessoa.CpfCnpj;
        edtTelefone.Text := Pessoa.Telefone;
        edtEndereco.Text := Pessoa.Endereco;
        edtCep.Text := Pessoa.Cep;
        edtCidade.Text := Pessoa.Cidade;
        edtEstado.Text := Pessoa.Estado;
      end
      else
        ShowMessage('Pessoa não encontrada!');
    finally
      Pessoa.Free;
    end;
  end
  else
  begin
    edtNome.Clear;
    edtCpfCnpj.Clear;
    edtTelefone.Clear;
    edtEndereco.Clear;
    edtCep.Clear;
    edtCidade.Clear;
    edtEstado.Clear;
  end;
end;

end.
