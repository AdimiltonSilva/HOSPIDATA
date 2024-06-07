unit View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList, Vcl.Menus;

type
  TFrmPrincipal = class(TForm)
    actlstMenu: TActionList;
    mmMenu: TMainMenu;
    actDepartamento: TAction;
    actEmpregado: TAction;
    actSair: TAction;
    Cadastro: TMenuItem;
    mniCliente: TMenuItem;
    mniFornecedor: TMenuItem;
    mniSair: TMenuItem;
    actFuncao: TAction;
    Funo1: TMenuItem;
    procedure actDepartamentoExecute(Sender: TObject);
    procedure actSairExecute(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure actFuncaoExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses
  View.Departamento, View.Funcao;


{$R *.dfm}

procedure TFrmPrincipal.actDepartamentoExecute(Sender: TObject);
var
  FrmDepartamento: TFrmCadastroDepartamento;
begin
  FrmDepartamento := TFrmCadastroDepartamento.Create(nil);

  try
    FrmDepartamento.ShowModal;
  finally
    if FrmDepartamento <> nil then
      FreeAndNil(FrmDepartamento);
  end;
end;

procedure TFrmPrincipal.actFuncaoExecute(Sender: TObject);
var
  FrmFuncao: TFrmCadastroFuncao;
begin
  FrmFuncao := TFrmCadastroFuncao.Create(nil);

  try
    FrmFuncao.ShowModal;
  finally
    if FrmFuncao <> nil then
      FreeAndNil(FrmFuncao);
  end;
end;

procedure TFrmPrincipal.actSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TFrmPrincipal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if Application.MessageBox('Sair do sistema?', 'Confirmar', MB_YESNO + MB_ICONQUESTION) = mrYes then
    Application.Terminate
  else
    CanClose := False;
end;

procedure TFrmPrincipal.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0,0);
  end;
end;

end.
