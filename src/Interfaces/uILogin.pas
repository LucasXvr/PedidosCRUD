unit uILogin;

interface

type

  ILogin = interface
    ['{C70E278F-7F69-4B2F-ACC9-76FBD376D258}']
    function ValidarLogin(Usuario, Senha: string): Boolean;
  end;

implementation

end.
