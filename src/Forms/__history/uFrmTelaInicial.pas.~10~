unit uFrmTelaInicial;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, uFrmPessoa,
  uFrmPedidos;

type
  TFrmTelaInicial = class(TForm)
    pnlPrincipal: TPanel;
    pnlMenu: TPanel;
    btnPedidos: TButton;
    btnPessoa: TButton;
    procedure btnPedidosClick(Sender: TObject);
    procedure btnPessoaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaInicial: TFrmTelaInicial;

implementation

{$R *.dfm}

procedure TFrmTelaInicial.btnPedidosClick(Sender: TObject);
begin
  FrmPedidos := TFrmPedidos.Create(nil);
  try
    FrmPedidos.ShowModal;
  finally
    FrmPedidos.Free;
  end;
end;

procedure TFrmTelaInicial.btnPessoaClick(Sender: TObject);
begin
  FrmPessoa := TFrmPessoa.Create(nil);
  try
    FrmPessoa.ShowModal;
  finally
    FrmPessoa.Free;
  end;
end;

end.
