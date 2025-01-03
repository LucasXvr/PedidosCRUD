unit uDmConexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.Phys.SQLiteDef, FireDAC.Phys.SQLite;

type
  TDmConexao = class(TDataModule)
    Conn: TFDConnection;
    FDPhysSQLiteDriverLink: TFDPhysSQLiteDriverLink;
    procedure ConnBeforeConnect(Sender: TObject);
    procedure ConnAfterConnect(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  private
    procedure CriarTabelas;
  public
    { Public declarations }
  end;

var
  DmConexao: TDmConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDmConexao.ConnAfterConnect(Sender: TObject);
begin
  CriarTabelas;
end;

procedure TDmConexao.ConnBeforeConnect(Sender: TObject);
begin
  Conn.DriverName := 'SQLite';

  {$IFDEF MSWINDOWS}
    Conn.Params.Values['DataBase'] := System.SysUtils.GetCurrentDir + '/banco.db';
  {$ELSE}
    Conn.Params.Values['DataBase'] := TPath.Combine(TPath.GetDocumentsPath, 'banco.db');
  {$ENDIF}
end;

procedure TDmConexao.CriarTabelas;
begin
  try
    Conn.ExecSQL(
      'CREATE TABLE IF NOT EXISTS Pessoa (' +
      '  ID INTEGER PRIMARY KEY AUTOINCREMENT, ' +
      '  Nome VARCHAR(60) NOT NULL, ' +
      '  CpfCnpj VARCHAR(30) NOT NULL, ' +
      '  Telefone VARCHAR(30), ' +
      '  Endereco VARCHAR(125), ' +
      '  Cep VARCHAR(20), ' +
      '  Cidade VARCHAR(35), ' +
      '  Estado VARCHAR(2) ' +
      ');'
    );
    Conn.ExecSQL(
      'CREATE TABLE IF NOT EXISTS Produto (' +
      '  ID INTEGER PRIMARY KEY AUTOINCREMENT, ' +
      '  Descricao VARCHAR(255) NOT NULL, ' +
      '  UnidadeMedida VARCHAR(50) NOT NULL ' +
      ');'
    );
    Conn.ExecSQL(
      'CREATE TABLE IF NOT EXISTS Pedido (' +
      '  ID INTEGER PRIMARY KEY AUTOINCREMENT, ' +
      '  DataPedido DATE NOT NULL, ' +
      '  ClienteID INTEGER NOT NULL, ' +
      '  Total REAL NOT NULL, ' +
      '  FOREIGN KEY (ClienteID) REFERENCES Pessoa(ID) ' +
      ');'
    );
    Conn.ExecSQL(
      'CREATE TABLE IF NOT EXISTS ItemPedido (' +
      '  ID INTEGER PRIMARY KEY AUTOINCREMENT, ' +
      '  PedidoID INTEGER NOT NULL, ' +
      '  ProdutoID INTEGER NOT NULL, ' +
      '  Quantidade REAL NOT NULL, ' +
      '  UnidadeMedida VARCHAR(50) NOT NULL, ' +
      '  Valor REAL NOT NULL, ' +
      '  Total REAL NOT NULL, ' +
      '  FOREIGN KEY (PedidoID) REFERENCES Pedido(ID), ' +
      '  FOREIGN KEY (ProdutoID) REFERENCES Produto(ID) ' +
      ');'
    );
  except on E: Exception do
    raise Exception.Create('Erro ao criar tabelas: ' + E.Message);
  end;
end;

procedure TDmConexao.DataModuleCreate(Sender: TObject);
begin
  Conn.Connected := True;
end;

end.
