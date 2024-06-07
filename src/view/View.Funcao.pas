unit View.Funcao;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.DBCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  View.Modelo,
  Data.DB,

  Controller.Interfaces, Controller.Funcao;

type
  TFrmCadastroFuncao = class(TFrmCadastroPadrao)
    edtNome: TEdit;
    lblDesc: TLabel;
    edtId: TEdit;
    lblCodigo: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure dsConsultarDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
    FControllerFuncao: IControllerFuncao;
    procedure ConfigurarGrid;
  public
    { Public declarations }
  end;

var
  FrmCadastroFuncao: TFrmCadastroFuncao;

implementation

{$R *.dfm}

procedure TFrmCadastroFuncao.FormCreate(Sender: TObject);
begin
  inherited;

  FControllerFuncao := TControllerFuncao.New(dsConsultar);
  FControllerFuncao.ListarTodos;
  ConfigurarGrid;
end;

procedure TFrmCadastroFuncao.ConfigurarGrid;
begin
  dbgConsultar.Columns.Items[0].Width := 40;
  dbgConsultar.Columns.Items[0].Title.Caption := 'ID';
  dbgConsultar.Columns.Items[1].Width := 280;
  dbgConsultar.Columns.Items[1].Title.Caption := 'FUNCAO';
end;

procedure TFrmCadastroFuncao.btnPesquisarClick(Sender: TObject);
begin
  inherited;

  if StrToIntDef(edtPesquisar.Text, 0) > 0 then
    FControllerFuncao
      .BuscarPorId(StrToIntDef(edtPesquisar.Text, 0))
  else
    FControllerFuncao
      .ListarTodos;

  ConfigurarGrid;
end;

procedure TFrmCadastroFuncao.btnIncluirClick(Sender: TObject);
begin
  inherited;

  edtId.Enabled := False;
  edtNome.SetFocus;
end;

procedure TFrmCadastroFuncao.btnAlterarClick(Sender: TObject);
begin
  inherited;

  edtId.Enabled := False;
  edtNome.SetFocus;
end;

procedure TFrmCadastroFuncao.btnExcluirClick(Sender: TObject);
begin
  if Application.MessageBox('Confirma Exclusão' , 'Atenção !!!', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = mrYes then
  begin
    FControllerFuncao
      .Excluir(StrToIntDef(edtId.Text, 0))
      .ListarTodos;

    ConfigurarGrid;
  end;

  inherited;
end;

procedure TFrmCadastroFuncao.btnSalvarClick(Sender: TObject);
begin
  if (FOperacao = opIncluir) then
    FControllerFuncao
      .Id_Emp_Funcao(StrToIntDef(edtId.Text, 0))
      .Nm_Funcao(edtNome.Text)
      .Salvar
      .ListarTodos
  else
    FControllerFuncao
      .Id_Emp_Funcao(StrToIntDef(edtId.Text, 0))
      .Nm_Funcao(edtNome.Text)
      .Alterar
      .ListarTodos;

  ConfigurarGrid;

  inherited;
end;

procedure TFrmCadastroFuncao.dsConsultarDataChange(Sender: TObject; Field: TField);
begin
  inherited;

  edtId.Text   := dsConsultar.DataSet.FieldByName('id_emp_funcao').AsString;
  edtNome.Text := dsConsultar.DataSet.FieldByName('nm_funcao').AsString;
end;

end.
