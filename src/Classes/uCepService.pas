unit uCepService;

interface

uses
  System.SysUtils, System.Classes, System.JSON, System.Net.HttpClient, System.Net.HttpClientComponent, System.Net.URLClient, System.RegularExpressions;

type
  TCepService = class
    private
      FHttpClient: THTTPClient;
    public
      constructor Create;
      destructor Destroy; override;
      function BuscarCep(const ACep: string; out Endereco, Cidade, Estado: string): Boolean;
  end;

implementation

{ TCepService }

function TCepService.BuscarCep(const ACep: string; out Endereco, Cidade, Estado: string): Boolean;
var
  Response: string;
  JsonResponse: TJSONObject;
begin
  // Valida o formato do CEP (8 d�gitos num�ricos)
  if not TRegEx.IsMatch(ACep, '^\d{8}$') then
  begin
    Result := False;
    Exit;  // Formato inv�lido de CEP
  end;

  try
    // Consulta a API ViaCEP
    Response := FHttpClient.Get('https://viacep.com.br/ws/' + ACep + '/json/').ContentAsString;

    // Parse da resposta JSON
    JsonResponse := TJSONObject.ParseJSONValue(Response) as TJSONObject;
    try
      if JsonResponse <> nil then
      begin
        // Verifica se o campo "erro" existe e � true (CEP inexistente)
        if JsonResponse.GetValue<Boolean>('erro', False) then
        begin
          Result := False;
          Exit;
        end;

        Endereco := JsonResponse.GetValue<string>('logradouro');
        Cidade := JsonResponse.GetValue<string>('localidade');
        Estado := JsonResponse.GetValue<string>('uf');
        Result := True;
      end
      else
      begin
        Result := False;
      end;
    finally
      JsonResponse.Free;
    end;
  except
    on E: Exception do
    begin
      Result := False;
    end;
  end;
end;

constructor TCepService.Create;
begin
  FHttpClient := THTTPClient.Create;
end;

destructor TCepService.Destroy;
begin
  FHttpClient.Free;
  inherited;
end;

end.
