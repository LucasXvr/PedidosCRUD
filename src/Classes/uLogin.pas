unit uLogin;

interface

uses
  uILogin;

type

  TLogin = class(TInterfacedObject, ILogin)
  public
    function ValidarLogin(Usuario, Senha: string): Boolean;
    constructor create;
    destructor destroy; override;
    class function Login: ILogin;
  end;

implementation

{ TLogin }

constructor TLogin.create;
begin

end;

destructor TLogin.destroy;
begin

  inherited;
end;

class function TLogin.Login: ILogin;
begin
  Result := Self.create;
end;

function TLogin.ValidarLogin(Usuario, Senha: string): Boolean;
begin
  Result := (Usuario = 'admin') and (Senha = 'senha123');
end;

end.
