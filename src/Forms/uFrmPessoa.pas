unit uFrmPessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids;

type
  TFrmPessoa = class(TForm)
    pnlPrincipal: TPanel;
    dbgPessoa: TDBGrid;
    pnlTopo: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPessoa: TFrmPessoa;

implementation

{$R *.dfm}

end.
