unit Dao.Departamento;

interface

uses
  System.SysUtils, System.Generics.Collections,

  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.DApt,
  FireDAC.Phys.PgDef, FireDAC.Phys.Pg,

  UntConexao, Model.Interfaces, Dao.Interfaces;

type
  TDAODepartamento = class(TInterfacedObject, IDAODepartamento)
    private
      FConexao: TConexao;
      FDQryDepartamento: TFDQuery;
      FDataSource: TDataSource;
    public
      constructor Create(var ADataSource: TDataSource);
      destructor Destroy; override;

      class function New(var ADataSource: TDataSource): IDAODepartamento;
      function BuscarPorId(AValue: Integer): IDAODepartamento;
      function ListarTodos: IDAODepartamento;
      function Salvar(ADepartamento: IModelDepartamento): IDAODepartamento;
      function Alterar(ADepartamento: IModelDepartamento): IDAODepartamento;
      function Excluir(AValue: Integer): IDAODepartamento;
  end;

implementation

{ TDAODepartamento }

constructor TDAODepartamento.Create(var ADataSource: TDataSource);
begin
  FConexao := TConexao.Create;

  FDQryDepartamento := TFDQuery.Create(nil);
  FDQryDepartamento.Connection := FConexao.GetConexao;
  FDataSource := ADataSource;
  FDataSource.DataSet := TDataSet(FDQryDepartamento);
end;

destructor TDAODepartamento.Destroy;
begin
  inherited Destroy;
end;

class function TDAODepartamento.New(var ADataSource: TDataSource): IDAODepartamento;
begin
  Result := Self.Create(ADataSource);
end;

function TDAODepartamento.BuscarPorId(AValue: Integer): IDAODepartamento;
begin
  FDQryDepartamento.Close;
  FDQryDepartamento.SQL.Clear;
  FDQryDepartamento.SQL.Add('SELECT d.id_departamento, d.nm_departamento, d.local');
  FDQryDepartamento.SQL.Add('  FROM departamentos d');
  FDQryDepartamento.SQL.Add(' WHERE d.id_departamento = :idDepartamento');
  FDQryDepartamento.ParamByName('idDepartamento').AsInteger := AValue;
  FDQryDepartamento.Open;

  if FDQryDepartamento.IsEmpty then
    raise Exception.Create('Departamento não encontrado');
end;

function TDAODepartamento.ListarTodos: IDAODepartamento;
begin
  Result := Self;

  try
    FDQryDepartamento.Close;
    FDQryDepartamento.SQL.Clear;
    FDQryDepartamento.SQL.Add('SELECT d.id_departamento, d.nm_departamento, d.local');
    FDQryDepartamento.SQL.Add('  FROM departamentos d');
    FDQryDepartamento.SQL.Add('ORDER BY d.id_departamento');
    FDQryDepartamento.Open;
  except on E: Exception do
    raise Exception.Create('Error ao listar: ' + E.Message);
  end;
end;

function TDAODepartamento.Salvar(ADepartamento: IModelDepartamento): IDAODepartamento;
begin
  Result := Self;
  FDQryDepartamento.Close;
  FDQryDepartamento.SQL.Clear;
  FDQryDepartamento.SQL.Add('INSERT INTO departamentos (nm_departamento)');
  FDQryDepartamento.SQL.Add('VALUES (:nm_departamento)');
  FDQryDepartamento.ParamByName('nm_departamento').AsString := ADepartamento.nm_departamento;
  FDQryDepartamento.ExecSQL;
end;

function TDAODepartamento.Alterar(ADepartamento: IModelDepartamento): IDAODepartamento;
begin
  Result := Self;

  try
    FDQryDepartamento.Close;
    FDQryDepartamento.SQL.Clear;
    FDQryDepartamento.SQL.Add('UPDATE departamentos');
    FDQryDepartamento.SQL.Add('   SET nm_departamento = nm_departamento');
    FDQryDepartamento.SQL.Add('WHERE id_departamento = :idDepartamento');
    FDQryDepartamento.ParamByName('idDepartamento').AsInteger := ADepartamento.Id_Departamento;
    FDQryDepartamento.ExecSQL;
  except on E: Exception do
    raise Exception.Create('Error ao alterar: ' + E.Message);
  end;
end;

function TDAODepartamento.Excluir(AValue: Integer): IDAODepartamento;
begin
  Result := Self;

  try
    FDQryDepartamento.Close;
    FDQryDepartamento.SQL.Clear;
    FDQryDepartamento.SQL.Add('DELETE FROM departamentos');
    FDQryDepartamento.SQL.Add('  WHERE id_departamento = :idDepartamento');
    FDQryDepartamento.ParamByName('idDepartamento').AsInteger := AValue;
    FDQryDepartamento.ExecSQL;
  except on E: Exception do
  raise Exception.Create('Error ao Excluir:' + E.Message);
  end;
end;

end.
