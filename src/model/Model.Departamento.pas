unit Model.Departamento;

interface

uses
  Data.DB,
  Model.Interfaces,
  Dao.Interfaces,
  Dao.Departamento;

type
  TModelDepartamento = class(TInterfacedObject, IModelDepartamento)
    private
      FId_Departamento: integer;
      FNm_Departamento: string;
      FLocal: string;
      FDAODepartamento: IDAODepartamento;
      FDataSource: TDataSource;
    public
      constructor Create(var ADataSource: TDataSource);
      destructor Destroy; override;

      class function New(var ADataSource: TDataSource): IModelDepartamento;

      function Id_Departamento: Integer; overload;
      function Id_Departamento(AValue: Integer): IModelDepartamento overload;
      function Nm_Departamento: string; overload;
      function Nm_Departamento(AValue: string): IModelDepartamento overload;
      function Local: string; overload;
      function Local(AValue: string): IModelDepartamento overload;

      function BuscarPorId(Avalue: Integer): IModelDepartamento;
      function ListarTodos: IModelDepartamento;
      function Salvar: IModelDepartamento;
      function Alterar: IModelDepartamento;
      function Excluir(AValue: Integer): IModelDepartamento;
  end;


implementation

{ TModelDepartamento }

constructor TModelDepartamento.Create(var ADataSource: TDatasource);
begin
  Self.FDataSource := ADataSource;
  FDAODepartamento := TDAODepartamento.New(FDataSource)
end;

destructor TModelDepartamento.Destroy;
begin
  inherited Destroy;
end;

class function TModelDepartamento.New(var ADataSource: TDataSource): IModelDepartamento;
begin
  Result := Self.Create(ADataSource);
end;

function TModelDepartamento.Id_Departamento: Integer;
begin
    Result := Self.FId_Departamento;
end;

function TModelDepartamento.Id_Departamento(AValue: Integer): IModelDepartamento;
begin
  Result := Self;
  Self.FId_Departamento := AValue;
end;

function TModelDepartamento.Nm_Departamento: string;
begin
  Result := Self.FNm_Departamento;
end;

function TModelDepartamento.Nm_Departamento(AValue: string): IModelDepartamento;
begin
  Result := Self;
  Self.FNm_Departamento := AValue;
end;

function TModelDepartamento.Local: string;
begin
  Result := self.FLocal;
end;

function TModelDepartamento.Local(AValue: string): IModelDepartamento;
begin
  Result := Self;
  Self.FLocal := AValue;
end;

function TModelDepartamento.BuscarPorId(Avalue: Integer): IModelDepartamento;
begin
  Result := Self;
  FDAODepartamento.BuscarPorId(AValue);
end;

function TModelDepartamento.ListarTodos: IModelDepartamento;
begin
  Result := Self;
  FDAODepartamento.ListarTodos;
end;

function TModelDepartamento.Salvar: IModelDepartamento;
begin
  Result := Self;
  FDAODepartamento.Salvar(Self);
end;

function TModelDepartamento.Alterar: IModelDepartamento;
begin
  Result := Self;
  FDAODepartamento.Alterar(Self)
end;

function TModelDepartamento.Excluir(AValue: Integer): IModelDepartamento;
begin
  Result := Self;
  FDAODepartamento.Excluir(AValue);
end;

end.
