unit Dao.Empregado;

interface

uses
  System.SysUtils,

  Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client, FireDAC.DApt,
  FireDAC.Phys.PGDef, FireDAC.Phys.PG,

  UntConexao, Model.Interfaces, Dao.Interfaces;

type
  TDAOEmpregado = class(TInterfacedObject, IDAOEmpregado)
    private
      FConexao: TConexao;
      FDQryEmpregado: TFDQuery;
      FDataSource: TDataSource;
    public
      constructor Create(var ADatasource: TDataSource);
      destructor Destroy; override;

      class function New(var ADataSource: TDataSource): IDAOEmpregado;
      function BuscarPorId(AValue: Integer): IDAOEmpregado;
      function ListarTodos: IDAOEmpregado;
      function Salvar(AEmpregado: IModelEmpregado): IDAOEmpregado;
      function Alterar(AEmpregado: IModelEmpregado): IDAOEmpregado;
      function Excluir(AValue: Integer): IDAOEmpregado;
  end;

implementation

{ TDAOEmpregado }

constructor TDAOEmpregado.Create(var ADatasource: TDataSource);
begin
  FConexao := TConexao.Create;

  FDQryEmpregado := TFDQuery.Create(nil);
  FDQryEmpregado.Connection := FConexao.GetConexao;

  FDataSource := ADatasource;
  FDataSource.DataSet := TDataSet(FDQryEmpregado);
end;

destructor TDAOEmpregado.Destroy;
begin
  inherited Destroy;
end;

class function TDAOEmpregado.New(var ADataSource: TDataSource): IDAOEmpregado;
begin
  Result := Self.Create(ADataSource);
end;

function TDAOEmpregado.BuscarPorId(AValue: Integer): IDAOEmpregado;
begin
  Result := Self;

  FDQryEmpregado.Close;
  FDQryEmpregado.SQL.Clear;
  FDQryEmpregado.SQL.Add('SELECT e.id_empregado, e.nm_empregado, e.data_admissao, ');
  FDQryEmpregado.SQL.Add('       e.cod_emp_funcao, e.nm_funcao, e.cod_departamento, d.nm_departamento, ');
  FDQryEmpregado.SQL.Add('       e.salario, e.comissao ');
  FDQryEmpregado.SQL.Add('  FROM empregados e ');
  FDQryEmpregado.SQL.Add(' INNER JOIN departamentos d ON d.id_departamento = e.cod_departamento ');
  FDQryEmpregado.SQL.Add(' WHERE e.id_empregado = :idEmpregado');
  FDQryEmpregado.ParamByName('idEmpregado').AsInteger := AValue;
  FDQryEmpregado.Open;

  if FDQryEmpregado.IsEmpty then
    raise Exception.Create('Empregado não existe.');
end;

function TDAOEmpregado.ListarTodos: IDAOEmpregado;
begin
  Result := Self;

  try
    FDQryEmpregado.Close;
    FDQryEmpregado.SQL.Clear;
    FDQryEmpregado.SQL.Add('SELECT e.id_empregado, e.nm_empregado, e.data_admissao, ');
    FDQryEmpregado.SQL.Add('       e.cod_emp_funcao, e.nm_funcao, e.cod_departamento, d.nm_departamento, ');
    FDQryEmpregado.SQL.Add('       e.salario, e.comissao ');
    FDQryEmpregado.SQL.Add('  FROM empregados e ');
    FDQryEmpregado.SQL.Add(' INNER JOIN departamentos d ON d.id_departamento = e.cod_departamento ');
    FDQryEmpregado.SQL.Add(' INNER JOIN emp_funcoes ef ON ef.id_emp_funcao = e.cod_emp_funcao ');
    FDQryEmpregado.SQL.Add(' ORDER BY e.id_empregado');
    FDQryEmpregado.Open;
  except on E: Exception do
    raise Exception.Create('Error ao listar: ' + E.Message);
  end;
end;

function TDAOEmpregado.Salvar(AEmpregado: IModelEmpregado): IDAOEmpregado;
begin
   Result := Self;

  try
    FDQryEmpregado.Close;
    FDQryEmpregado.SQL.Clear;
    FDQryEmpregado.SQL.Add(' INSERT INTO empregados (nm_empregado, cod_departamento, ');
    FDQryEmpregado.SQL.Add('                         cod_emp_funcao, nm_funcao, data_admissao, ');
    FDQryEmpregado.SQL.Add('                         salario, comissao) ');
    FDQryEmpregado.SQL.Add('                 VALUES (:nmEmpregado, :idDepartamento, ');
    FDQryEmpregado.SQL.Add('                         :idFuncao, :nmFuncao, :dataAdmissao, ');
    FDQryEmpregado.SQL.Add('                         :salario, :comissao) ');
    FDQryEmpregado.ParamByName('nmEmpregado').AsString := AEmpregado.Nm_Empregado;
    FDQryEmpregado.ParamByName('idDepartamento').AsInteger := AEmpregado.Cod_Departamento;
    FDQryEmpregado.ParamByName('idFuncao').AsInteger := AEmpregado.Cod_Emp_Funcao;
    FDQryEmpregado.ParamByName('nmFuncao').AsString := AEmpregado.Nm_Funcao;
    FDQryEmpregado.ParamByName('dataAdmissao').AsDate := AEmpregado.Data_Admissao;
    FDQryEmpregado.ParamByName('salario').AsCurrency := AEmpregado.Salario;
    FDQryEmpregado.ParamByName('comissao').AsCurrency := AEmpregado.Comissao;
    FDQryEmpregado.ExecSQL;
  except on E: Exception do
    raise Exception.Create('Error ao salvar: ' + E.Message);
  end;
end;

function TDAOEmpregado.Alterar(AEmpregado: IModelEmpregado): IDAOEmpregado;
begin
   Result := Self;

  try
    FDQryEmpregado.Close;
    FDQryEmpregado.SQL.Clear;
    FDQryEmpregado.SQL.Add('UPDATE empregados ');
    FDQryEmpregado.SQL.Add('   SET nm_empregado = :nmEmpregado, ');
    FDQryEmpregado.SQL.Add('       cod_departamento = :idDepartamento, ');
    FDQryEmpregado.SQL.Add('       cod_emp_funcao = :idFuncao, ');
    FDQryEmpregado.SQL.Add('       nm_funcao = :nmFuncao, ');
    FDQryEmpregado.SQL.Add('       data_admissao = :dataAdmissao, ');
    FDQryEmpregado.SQL.Add('       salario = :salario, ');
    FDQryEmpregado.SQL.Add('       comissao = :comissao ');
    FDQryEmpregado.SQL.Add(' WHERE id_empregado = :idEmpregado');
    FDQryEmpregado.ParamByName('nmEmpregado').AsString := AEmpregado.Nm_Empregado;
    FDQryEmpregado.ParamByName('idDepartamento').AsInteger := AEmpregado.Cod_Departamento;
    FDQryEmpregado.ParamByName('idFuncao').AsInteger := AEmpregado.Cod_Emp_Funcao;
    FDQryEmpregado.ParamByName('nmFuncao').AsString := AEmpregado.Nm_Funcao;
    FDQryEmpregado.ParamByName('dataAdmissao').AsDate := AEmpregado.Data_Admissao;
    FDQryEmpregado.ParamByName('salario').AsCurrency := AEmpregado.Salario;
    FDQryEmpregado.ParamByName('comissao').AsCurrency := AEmpregado.Comissao;
    FDQryEmpregado.ParamByName('idEmpregado').AsInteger := AEmpregado.Id_Empregado;
    FDQryEmpregado.ExecSQL;
  except on E: Exception do
    raise Exception.Create('Error ao alterar: ' + E.Message);
  end;
end;

function TDAOEmpregado.Excluir(AValue: Integer): IDAOEmpregado;
begin
   Result := Self;

  try
    FDQryEmpregado.Close;
    FDQryEmpregado.SQL.Clear;
    FDQryEmpregado.SQL.Add('DELETE FROM empregados ');
    FDQryEmpregado.SQL.Add(' WHERE id_empregado = :idEmpregado ');
    FDQryEmpregado.ParamByName('idEmpregado').AsInteger := AValue;
    FDQryEmpregado.ExecSQL;
  except on E: Exception do
    raise Exception.Create('Error ao excluir: ' + E.Message);
  end;
end;

end.
