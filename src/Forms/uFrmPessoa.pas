unit uFrmPessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, uFrmCadPessoa, uPessoa, uDmConexao;

type
  TFrmPessoa = class(TForm)
    pnlPrincipal: TPanel;
    pnlMenu: TPanel;
    DBGrid: TDBGrid;
    btnNovo: TButton;
    DsPessoa: TDataSource;
    btnEditar: TButton;
    btnExcluir: TButton;
    pnlBuscar: TPanel;
    procedure btnNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AtualizarGrid;
  end;

var
  FrmPessoa: TFrmPessoa;

implementation

{$R *.dfm}

procedure TFrmPessoa.AtualizarGrid;
begin
  try
    DsPessoa.DataSet := TPessoa.BuscarTodos(DmConexao.Conn);
    DsPessoa.DataSet.Refresh;
  except
    on E: Exception do
      ShowMessage('Erro ao atualizar a lista de pessoas: ' + E.Message);
  end;
end;

procedure TFrmPessoa.btnEditarClick(Sender: TObject);
var
  PessoaID: Integer;
begin
  if not DsPessoa.DataSet.IsEmpty then
  begin
    PessoaID := DsPessoa.DataSet.FieldByName('ID').AsInteger;

    FrmCadPessoa := TFrmCadPessoa.Create(nil);
    try
      FrmCadPessoa.PrepararFormularioParaEdicao(PessoaID);

      if FrmCadPessoa.ShowModal = mrOk then
        AtualizarGrid;
    finally
      FrmCadPessoa.Free;
    end;
  end
  else
    ShowMessage('Selecione uma pessoa para editar.');
end;

procedure TFrmPessoa.btnExcluirClick(Sender: TObject);
var
  PessoaID: Integer;
  Pessoa: TPessoa;
begin
  // Verifica se h� uma pessoa selecionada
  if not DsPessoa.DataSet.IsEmpty then
  begin
    PessoaID := DsPessoa.DataSet.FieldByName('ID').AsInteger;

    if MessageDlg('Deseja realmente excluir esta pessoa?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      Pessoa := TPessoa.Create;
      try
        Pessoa.ID := PessoaID;
        Pessoa.Excluir(DmConexao.Conn);
        AtualizarGrid;
        ShowMessage('Pessoa exclu�da com sucesso!');
      finally
        Pessoa.Free;
      end;
    end;
  end
  else
    ShowMessage('Selecione uma pessoa para excluir.');
end;

procedure TFrmPessoa.btnNovoClick(Sender: TObject);
begin
  FrmCadPessoa := TFrmCadPessoa.Create(nil);
  try
    FrmCadPessoa.ShowModal;
  finally
    FrmCadPessoa.Free;
  end;
end;

procedure TFrmPessoa.FormShow(Sender: TObject);
begin
  AtualizarGrid;
end;

end.
