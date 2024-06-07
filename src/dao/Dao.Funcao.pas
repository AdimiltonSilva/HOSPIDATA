unit Dao.Funcao;

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
  TDAOFuncao = class(TInterfacedObject, IDAOFuncao)
    private
      FConexao: TConexao;
      FDQryFuncao: TFDQuery;
      FDataSource: TDataSource;
    public
      constructor Create(var ADatasource: TDataSource);
      destructor Destroy; override;

      class function New(var ADataSource: TDataSource): IDAOFuncao;
      function BuscarPorId(AValue: Integer): IDAOFuncao;
      function ListarTodos: IDAOFuncao;
      function Salvar(AFuncao: IModelFuncao): IDAOFuncao;
      function Alterar(AFuncao: IModelFuncao): IDAOFuncao;
      function Excluir(AValue: Integer): IDAOFuncao;
  end;

implementation

{ TDAOFuncao }

constructor TDAOFuncao.Create(var ADatasource: TDataSource);
begin
  FConexao := TConexao.Create;

  FDQryFuncao := TFDQuery.Create(nil);
  FDQryFuncao.Connection := FConexao.GetConexao;

  FDataSource := ADatasource;
  FDataSource.DataSet := TDataSet(FDQryFuncao);
end;

destructor TDAOFuncao.Destroy;
begin
  inherited Destroy;
end;

class function TDAOFuncao.New(var ADataSource: TDataSource): IDAOFuncao;
begin
  Result := Self.Create(ADataSource);
end;

function TDAOFuncao.BuscarPorId(AValue: Integer): IDAOFuncao;
begin
  Result := Self;

  FDQryFuncao.Close;
  FDQryFuncao.SQL.Clear;
  FDQryFuncao.SQL.Add('SELECT ef.id_emp_funcao, ef.nm_funcao ');
  FDQryFuncao.SQL.Add('  FROM emp_funcoes ef ');
  FDQryFuncao.SQL.Add(' WHERE ef.id_emp_funcao = :id_emp_funcao');
  FDQryFuncao.ParamByName('id_emp_funcao').AsInteger := AValue;
  FDQryFuncao.Open;

  if FDQryFuncao.IsEmpty then
    raise Exception.Create('Função não existe.');
end;

function TDAOFuncao.ListarTodos: IDAOFuncao;
begin
  Result := Self;

  try
    FDQryFuncao.Close;
    FDQryFuncao.SQL.Clear;
    FDQryFuncao.SQL.Add('SELECT ef.id_emp_funcao, ef.nm_funcao ');
    FDQryFuncao.SQL.Add('  FROM emp_funcoes ef ');
    FDQryFuncao.SQL.Add(' ORDER BY ef.id_emp_funcao');
    FDQryFuncao.Open;
  except on E: Exception do
    raise Exception.Create('Error ao listar: ' + E.Message);
  end;
end;

function TDAOFuncao.Salvar(AFuncao: IModelFuncao): IDAOFuncao;
begin
   Result := Self;

  try
    FDQryFuncao.Close;
    FDQryFuncao.SQL.Clear;
    FDQryFuncao.SQL.Add(' INSERT INTO emp_funcoes (nm_funcao) ');
    FDQryFuncao.SQL.Add(' VALUES (:nm_funcao) ');
    FDQryFuncao.ParamByName('nm_funcao').AsString := AFuncao.Nm_Funcao;
    FDQryFuncao.ExecSQL;
  except on E: Exception do
    raise Exception.Create('Error ao salvar: ' + E.Message);
  end;
end;

function TDAOFuncao.Alterar(AFuncao: IModelFuncao): IDAOFuncao;
begin
   Result := Self;

  try
    FDQryFuncao.Close;
    FDQryFuncao.SQL.Clear;
    FDQryFuncao.SQL.Add('UPDATE emp_funcoes ');
    FDQryFuncao.SQL.Add('   SET nm_funcao = :nm_funcao ');
    FDQryFuncao.SQL.Add(' WHERE id_emp_funcao = :id_emp_funcao');
    FDQryFuncao.ParamByName('nm_funcao').AsString := AFuncao.Nm_Funcao;
    FDQryFuncao.ParamByName('id_emp_funcao').AsInteger := AFuncao.Id_Emp_Funcao;
    FDQryFuncao.ExecSQL;
  except on E: Exception do
    raise Exception.Create('Error ao alterar: ' + E.Message);
  end;
end;

function TDAOFuncao.Excluir(AValue: Integer): IDAOFuncao;
begin
   Result := Self;

  try
    FDQryFuncao.Close;
    FDQryFuncao.SQL.Clear;
    FDQryFuncao.SQL.Add('DELETE FROM emp_funcoes ');
    FDQryFuncao.SQL.Add(' WHERE ef.id_emp_funcao = :id_emp_funcao ');
    FDQryFuncao.ParamByName('id_emp_funcao').AsInteger := AValue;
    FDQryFuncao.ExecSQL;
  except on E: Exception do
    raise Exception.Create('Error ao excluir: ' + E.Message);
  end;
end;

end.
