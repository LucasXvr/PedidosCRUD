unit uFrmLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, uILogin,
  uLogin, uFrmTelaInicial;

type
  TFrmLogin = class(TForm)
    pnlPrincipal: TPanel;
    edtNome: TEdit;
    edtSenha: TEdit;
    btnLogin: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure btnLoginClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.dfm}

procedure TFrmLogin.btnLoginClick(Sender: TObject);
var
  Login: ILogin;
begin
  Login := TLogin.Login;

  if Login.ValidarLogin(edtNome.Text, edtSenha.Text) then
  begin
    ShowMessage('Login bem-sucedido!');

    FrmTelaInicial := TFrmTelaInicial.Create(nil);
    try
      Self.Hide;
      FrmTelaInicial.ShowModal;
    finally
      Self.Show;
      FreeAndNil(FrmTelaInicial);
    end;
  end
  else
    ShowMessage('Usuário ou senha incorretos!');
end;

end.
