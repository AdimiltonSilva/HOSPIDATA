unit View.Empregado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.Modelo, Data.DB, Vcl.Buttons,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,

  Controller.Interfaces, Controller.Empregado, Controller.Funcao, Controller.Departamento;

type
  TFrmCadastroEmpregado = class(TFrmCadastroPadrao)
    lblCodigo: TLabel;
    edtId: TEdit;
    lblDesc: TLabel;
    edtNome: TEdit;
    lblDataAdmissao: TLabel;
    dtpDataAdmissao: TDateTimePicker;
    cbbFuncao: TComboBox;
    cbbDepartamento: TComboBox;
    lblFuncao: TLabel;
    lblDepartamento: TLabel;
    lblSalario: TLabel;
    lblComissao: TLabel;
    edtSalario: TEdit;
    edtComissao: TEdit;
    dsFuncao: TDataSource;
    dsDepartamento: TDataSource;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure edtSalarioEnter(Sender: TObject);
    procedure edtSalarioExit(Sender: TObject);
    procedure edtComissaoEnter(Sender: TObject);
    procedure edtComissaoExit(Sender: TObject);
    procedure dsConsultarDataChange(Sender: TObject; Field: TField);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
    FControllerEmpregado: IControllerEmpregado;
    FControllerFuncao: IControllerFuncao;
    FControllerDepartamento: IControllerDepartamento;
    procedure ConfigurarGrid;
    procedure CarregarCbbFuncao;
    procedure CarregarCbbDepartamento;
  public
    { Public declarations }
  end;

var
  FrmCadastroEmpregado: TFrmCadastroEmpregado;

implementation

{$R *.dfm}

uses View.Listagem;

procedure TFrmCadastroEmpregado.FormCreate(Sender: TObject);
begin
  inherited;

  FControllerFuncao := TControllerFuncao.New(dsFuncao);
  FControllerFuncao.ListarTodos;
  CarregarCbbFuncao;

  FControllerDepartamento := TControllerDepartamento.New(dsDepartamento);
  FControllerDepartamento.ListarTodos;
  CarregarCbbDepartamento;

  FControllerEmpregado := TControllerEmpregado.New(dsConsultar);
  FControllerEmpregado.ListarTodos;

  ConfigurarGrid;
end;

procedure TFrmCadastroEmpregado.CarregarCbbFuncao;
begin
  dsFuncao.DataSet.First;
  while not dsFuncao.DataSet.Eof do
  begin
    cbbFuncao.Items.Add(dsFuncao.DataSet.FieldByName('nm_funcao').AsString);
    dsFuncao.DataSet.Next;
  end;
end;

procedure TFrmCadastroEmpregado.CarregarCbbDepartamento;
begin
  dsDepartamento.DataSet.First;
  while not dsDepartamento.DataSet.Eof do
  begin
    cbbDepartamento.Items.Add(dsDepartamento.DataSet.FieldByName('nm_departamento').AsString);
    dsDepartamento.DataSet.Next;
  end;
end;

procedure TFrmCadastroEmpregado.ConfigurarGrid;
begin
  dbgConsultar.Columns.Items[0].Width := 30;
  dbgConsultar.Columns.Items[0].Title.Caption := 'ID';
  dbgConsultar.Columns.Items[1].Width := 170;
  dbgConsultar.Columns.Items[1].Title.Caption := 'EMPREGADO';
  dbgConsultar.Columns.Items[2].Width := 60;
  dbgConsultar.Columns.Items[2].Title.Caption := 'ADMISSÃO';
  dbgConsultar.Columns.Items[3].Width := 0;
  dbgConsultar.Columns.Items[3].Title.Caption := 'ID.FC';
  dbgConsultar.Columns.Items[4].Width := 170;
  dbgConsultar.Columns.Items[4].Title.Caption := 'FUNÇÃO';
  dbgConsultar.Columns.Items[5].Width := 0;
  dbgConsultar.Columns.Items[5].Title.Caption := 'ID.DP';
  dbgConsultar.Columns.Items[6].Width := 170;
  dbgConsultar.Columns.Items[6].Title.Caption := 'DEPARTAMENTO';
  dbgConsultar.Columns.Items[7].Width := 80;
  dbgConsultar.Columns.Items[7].Title.Caption := 'SALÁRIO';
  dbgConsultar.Columns.Items[8].Width := 80;
  dbgConsultar.Columns.Items[8].Title.Caption := 'COMISSÃO';
end;

procedure TFrmCadastroEmpregado.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  if StrToIntDef(edtPesquisar.Text, 0) > 0 then
    FControllerEmpregado
      .BuscarPorId(StrToIntDef(edtPesquisar.Text, 0))
  else
    FControllerEmpregado
      .ListarTodos;
end;

procedure TFrmCadastroEmpregado.edtSalarioEnter(Sender: TObject);
begin
  inherited;

  edtSalario.Text := StringReplace(edtSalario.Text, '.', '', [rfReplaceAll, rfIgnoreCase]);
  edtSalario.Text := StringReplace(edtSalario.Text, ',', '', [rfReplaceAll, rfIgnoreCase]);
  edtSalario.SelectAll;
end;

procedure TFrmCadastroEmpregado.edtSalarioExit(Sender: TObject);
begin
  inherited;

  edtSalario.Text := FormatFloat('#,##0.00', StrToCurrDef(edtSalario.Text, 0)/100);
end;

procedure TFrmCadastroEmpregado.edtComissaoEnter(Sender: TObject);
begin
  inherited;

  edtComissao.Text := StringReplace(edtComissao.Text, '.', '', [rfReplaceAll, rfIgnoreCase]);
  edtComissao.Text := StringReplace(edtComissao.Text, ',', '', [rfReplaceAll, rfIgnoreCase]);
  edtComissao.SelectAll;
end;

procedure TFrmCadastroEmpregado.edtComissaoExit(Sender: TObject);
begin
  inherited;

  edtComissao.Text := FormatFloat('#,##0.00', StrToCurrDef(edtComissao.Text, 0)/100);
end;

procedure TFrmCadastroEmpregado.btnIncluirClick(Sender: TObject);
begin
  inherited;

  edtId.Enabled := False;
  edtNome.SetFocus;
end;

procedure TFrmCadastroEmpregado.btnAlterarClick(Sender: TObject);
begin
  inherited;

  edtId.Enabled := False;
  edtNome.SetFocus;
end;

procedure TFrmCadastroEmpregado.btnExcluirClick(Sender: TObject);
begin
  if Application.MessageBox('Confirma Exclusão' , 'Atenção !!!', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = mrYes then
  begin
    FControllerEmpregado
      .Excluir(StrToIntDef(edtId.Text, 0))
      .ListarTodos;

    ConfigurarGrid;
  end;

  inherited;
end;

procedure TFrmCadastroEmpregado.btnSalvarClick(Sender: TObject);
begin
  FControllerDepartamento.BuscarIdPorDepartamento(cbbDepartamento.Text);
  FControllerFuncao.BuscarIdPorFuncao(cbbFuncao.Text);

  if (FOperacao = opIncluir) then
    FControllerEmpregado
      .Id_Empregado(StrToIntDef(edtId.Text, 0))
      .Cod_Departamento( dsDepartamento.DataSet.FieldByName('id_departamento').AsInteger )
      .Cod_Emp_Funcao( dsFuncao.DataSet.FieldByName('id_emp_funcao').AsInteger )
      .Nm_Empregado(edtNome.Text)
      .Nm_Funcao(cbbFuncao.Text)
      .Data_Admissao(dtpDataAdmissao.Date)
      .Salario(StrToCurrDef(StringReplace(edtSalario.Text, '.','', [rfReplaceAll, rfIgnoreCase]), 0))
      .Comissao(StrToCurrDef(StringReplace(edtComissao.Text, '.','', [rfReplaceAll, rfIgnoreCase]), 0))
      .Salvar
      .ListarTodos
  else
    FControllerEmpregado
      .Id_Empregado(StrToIntDef(edtId.Text, 0))
      .Cod_Departamento( dsDepartamento.DataSet.FieldByName('id_departamento').AsInteger )
      .Cod_Emp_Funcao( dsFuncao.DataSet.FieldByName('id_emp_funcao').AsInteger )
      .Nm_Empregado(edtNome.Text)
      .Nm_Funcao(cbbFuncao.Text)
      .Data_Admissao(dtpDataAdmissao.Date)
      .Salario(StrToCurrDef(StringReplace(edtSalario.Text, '.','', [rfReplaceAll, rfIgnoreCase]), 0))
      .Comissao(StrToCurrDef(StringReplace(edtComissao.Text, '.','', [rfReplaceAll, rfIgnoreCase]), 0))
      .Alterar
      .ListarTodos;

  ConfigurarGrid;

  inherited;
end;

procedure TFrmCadastroEmpregado.btnImprimirClick(Sender: TObject);
var
  FrmListagem: TFrmListagem;
begin
  inherited;

  FrmListagem := TFrmListagem.Create(nil);

  try
    FrmListagem.qrListagem.DataSet := dsConsultar.DataSet;
    FrmListagem.qrdbtDepartamento.DataSet := dsConsultar.DataSet;
    FrmListagem.qrdbtNome.DataSet := dsConsultar.DataSet;
    FrmListagem.qrdbtFuncao.DataSet := dsConsultar.DataSet;

    FrmListagem.qrListagem.Preview;
  finally
    if FrmListagem <> nil then
      FreeAndNil(FrmListagem);
  end;
end;

procedure TFrmCadastroEmpregado.dsConsultarDataChange(Sender: TObject; Field: TField);
begin
  inherited;

  edtId.Text := dsConsultar.DataSet.FieldByName('id_empregado').AsString;
  edtNome.Text := dsConsultar.DataSet.FieldByName('nm_empregado').AsString;
  dtpDataAdmissao.Date := dsConsultar.DataSet.FieldByName('data_admissao').AsDateTime;
  cbbFuncao.Text := dsConsultar.DataSet.FieldByName('nm_funcao').AsString;
  cbbDepartamento.Text := dsConsultar.DataSet.FieldByName('nm_departamento').AsString;
  edtSalario.Text := FormatFloat('#,##0.00', dsConsultar.DataSet.FieldByName('salario').AsCurrency);
  edtComissao.Text := FormatFloat('#,##0.00', dsConsultar.DataSet.FieldByName('comissao').AsCurrency);
end;

end.
