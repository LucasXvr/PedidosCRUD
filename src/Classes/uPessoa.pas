unit uPessoa;

interface

uses
  System.SysUtils, System.Classes, Data.DB, FireDAC.Comp.Client, FireDAC.DApt;

type

  TPessoa = class
    private
      FCpfCnpj: string;
      FID: Integer;
      FNome: string;
      FEndereco: string;
      FTelefone: string;
      FCep: string;
      FCidade: string;
      FEstado: string;

      procedure ConfigurarParametros(Query: TFDQuery);
    public
      // Propriedades
      property ID: Integer read FID write FID;
      property Nome: string read FNome write FNome;
      property CpfCnpj: string read FCpfCnpj write FCpfCnpj;
      property Telefone: string read FTelefone write FTelefone;
      property Endereco: string read FEndereco write FEndereco;
      property Cep: string read FCep write FCep;
      property Cidade: string read FCidade write FCidade;
      property Estado: string read FEstado write FEstado;

      // M�todos CRUD
      procedure Inserir(Connection: TFDConnection);
      procedure Editar(Connection: TFDConnection);
      procedure Excluir(Connection: TFDConnection);
      class function BuscarTodos(Connection: TFDConnection): TDataSet;
      class function BuscarPorID(Connection: TFDConnection; AID: Integer): TPessoa;
  end;

implementation

{ TPessoa }

class function TPessoa.BuscarPorID(Connection: TFDConnection; AID: Integer): TPessoa;
var
  Query: TFDQuery;
  Pessoa: TPessoa;
begin
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := Connection;
    Query.SQL.Text := 'SELECT * FROM Pessoa WHERE ID = :ID';
    Query.ParamByName('ID').AsInteger := AID;
    Query.Open;

    if not Query.IsEmpty then
    begin
      Pessoa := TPessoa.Create;
      Pessoa.ID := Query.FieldByName('ID').AsInteger;
      Pessoa.Nome := Query.FieldByName('Nome').AsString;
      Pessoa.CpfCnpj := Query.FieldByName('CpfCnpj').AsString;
      Pessoa.Telefone := Query.FieldByName('Telefone').AsString;
      Pessoa.Endereco := Query.FieldByName('Endereco').AsString;
      Pessoa.Cep := Query.FieldByName('Cep').AsString;
      Pessoa.Cidade := Query.FieldByName('Cidade').AsString;
      Pessoa.Estado := Query.FieldByName('Estado').AsString;
      Result := Pessoa;
    end
    else
      Result := nil;
  finally
    Query.Free;
  end;
end;

class function TPessoa.BuscarTodos(Connection: TFDConnection): TDataSet;
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := Connection;
    Query.SQL.Text := 'SELECT * FROM Pessoa ORDER BY Nome';
    Query.Open;
    Result := Query;
  except
    Query.Free;
    raise;
  end;
end;

procedure TPessoa.ConfigurarParametros(Query: TFDQuery);
begin
  Query.ParamByName('Nome').AsString := FNome;
  Query.ParamByName('CpfCnpj').AsString := FCpfCnpj;
  Query.ParamByName('Telefone').AsString := FTelefone;
  Query.ParamByName('Endereco').AsString := FEndereco;
  Query.ParamByName('Cep').AsString := FCep;
  Query.ParamByName('Cidade').AsString := FCidade;
  Query.ParamByName('Estado').AsString := FEstado;
end;

procedure TPessoa.Editar(Connection: TFDConnection);
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := Connection;
    Query.SQL.Text :=
      'UPDATE Pessoa SET Nome = :Nome, CpfCnpj = :CpfCnpj, Telefone = :Telefone, ' +
      'Endereco = :Endereco, Cep = :Cep, Cidade = :Cidade, Estado = :Estado WHERE ID = :ID';
    ConfigurarParametros(Query);
    Query.ParamByName('ID').AsInteger := FID;
    Query.ExecSQL;
  finally
    Query.Free;
  end;
end;

procedure TPessoa.Excluir(Connection: TFDConnection);
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := Connection;
    Query.SQL.Text := 'DELETE FROM Pessoa WHERE ID = :ID';
    Query.ParamByName('ID').AsInteger := FID;
    Query.ExecSQL;
  finally
    Query.Free;
  end;
end;

procedure TPessoa.Inserir(Connection: TFDConnection);
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := Connection;
    Query.SQL.Text :=
      'INSERT INTO Pessoa (Nome, CpfCnpj, Telefone, Endereco, Cep, Cidade, Estado) ' +
      'VALUES (:Nome, :CpfCnpj, :Telefone, :Endereco, :Cep, :Cidade, :Estado)';
    ConfigurarParametros(Query);
    Query.ExecSQL;
  finally
    Query.Free;
  end;
end;

end.
