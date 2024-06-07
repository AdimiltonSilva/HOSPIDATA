unit View.Departamento;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.Modelo, Data.DB, Vcl.Buttons,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,

  Controller.Interfaces, Controller.Departamento;

type
  TFrmCadastroDepartamento = class(TFrmCadastroPadrao)
    edtId: TEdit;
    edtLocal: TEdit;
    lblLocal: TLabel;
    edtNome: TEdit;
    lblDesc: TLabel;
    lblCodigo: TLabel;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure dsConsultarDataChange(Sender: TObject; Field: TField);
    procedure btnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
    FControllerDepartamento: IControllerDepartamento;
    procedure ConfigurarGrid;
  public
    { Public declarations }
  end;

var
  FrmCadastroDepartamento: TFrmCadastroDepartamento;

implementation

{$R *.dfm}

procedure TFrmCadastroDepartamento.FormCreate(Sender: TObject);
begin
  inherited;

  FControllerDepartamento := TControllerDepartamento.New(dsConsultar);
  FControllerDepartamento.ListarTodos;
  ConfigurarGrid;
end;

procedure TFrmCadastroDepartamento.ConfigurarGrid;
begin
  dbgConsultar.Columns.Items[0].Width := 40;
  dbgConsultar.Columns.Items[0].Title.Caption := 'ID';
  dbgConsultar.Columns.Items[1].Width := 280;
  dbgConsultar.Columns.Items[1].Title.Caption := 'DEPARTAMENTO';
  dbgConsultar.Columns.Items[2].Width := 120;
  dbgConsultar.Columns.Items[2].Title.Caption := 'LOCAL';
end;

procedure TFrmCadastroDepartamento.btnPesquisarClick(Sender: TObject);
begin
  inherited;

  if StrToIntDef(edtPesquisar.Text, 0) > 0 then
    FControllerDepartamento
      .BuscarPorId(StrToIntDef(edtPesquisar.Text, 0))
  else
    FControllerDepartamento
      .ListarTodos;

  ConfigurarGrid;
end;

procedure TFrmCadastroDepartamento.btnIncluirClick(Sender: TObject);
begin
  inherited;

  edtId.Enabled := False;
  edtNome.SetFocus;
end;

procedure TFrmCadastroDepartamento.btnAlterarClick(Sender: TObject);
begin
  inherited;

  edtId.Enabled := False;
  edtNome.SetFocus;
end;

procedure TFrmCadastroDepartamento.btnExcluirClick(Sender: TObject);
begin
  if Application.MessageBox('Confirma Exclusão' , 'Atenção !!!', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = mrYes then
  begin
    FControllerDepartamento
      .Excluir(StrToIntDef(edtId.Text, 0))
      .ListarTodos;

    ConfigurarGrid;
  end;

  inherited;
end;

procedure TFrmCadastroDepartamento.btnSalvarClick(Sender: TObject);
begin
  if (FOperacao = opIncluir) then
    FControllerDepartamento
      .Id_Departamento(StrToIntDef(edtId.Text, 0))
      .Nm_Departamento(edtNome.Text)
      .Local(edtLocal.Text)
      .Salvar
      .ListarTodos
  else
    FControllerDepartamento
      .Id_Departamento(StrToIntDef(edtId.Text, 0))
      .Nm_Departamento(edtNome.Text)
      .Local(edtLocal.Text)
      .Alterar
      .ListarTodos;

  ConfigurarGrid;

  inherited;
end;

procedure TFrmCadastroDepartamento.dsConsultarDataChange(Sender: TObject; Field: TField);
begin
  inherited;

  edtId.Text := dsConsultar.DataSet.FieldByName('id_departamento').AsString;
  edtNome.Text := dsConsultar.DataSet.FieldByName('nm_departamento').AsString;
  edtLocal.Text := dsConsultar.DataSet.FieldByName('local').AsString;
end;

end.
