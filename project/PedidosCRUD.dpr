program PedidosCRUD;

uses
  Vcl.Forms,
  uFrmLogin in '..\src\Forms\uFrmLogin.pas' {FrmLogin},
  uDmConexao in '..\src\DataModules\uDmConexao.pas' {DmConexao: TDataModule},
  uILogin in '..\src\Interfaces\uILogin.pas',
  uLogin in '..\src\Classes\uLogin.pas',
  uFrmPedidos in '..\src\Forms\uFrmPedidos.pas' {FrmPedidos},
  uFrmTelaInicial in '..\src\Forms\uFrmTelaInicial.pas' {FrmTelaInicial},
  uFrmPessoa in '..\src\Forms\uFrmPessoa.pas' {FrmPessoa};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDmConexao, DmConexao);
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.CreateForm(TFrmTelaInicial, FrmTelaInicial);
  Application.CreateForm(TFrmPessoa, FrmPessoa);
  Application.Run;
end.