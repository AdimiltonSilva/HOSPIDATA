unit Model.Funcao;

interface

uses
  Data.DB,
  Model.Interfaces,
  Dao.Interfaces,
  Dao.Funcao;

type
  TModelFuncao = class(TInterfacedObject, IModelFuncao)
    private
      FId_Emp_Funcao: integer;
      FNm_Funcao: string;
      FDAOFuncao: IDAOFuncao;
      FDataSource: TDataSource;
    public
      constructor Create(var ADataSource: TDataSource);
      destructor Destroy; override;

      class function New(var ADataSource: TDataSource): IModelFuncao;

      function Id_Emp_Funcao: Integer; overload;
      function Id_Emp_Funcao(AValue: Integer): IModelFuncao overload;
      function Nm_Funcao: string; overload;
      function Nm_Funcao(AValue: string): IModelFuncao overload;

      function BuscarPorId(Avalue: Integer): IModelFuncao;
      function BuscarIdPorFuncao(AValue: string): IModelFuncao overload;
      function ListarTodos: IModelFuncao;
      function Salvar: IModelFuncao;
      function Alterar: IModelFuncao;
      function Excluir(AValue: Integer): IModelFuncao;
  end;


implementation

{ TModelFuncao }

constructor TModelFuncao.Create(var ADataSource: TDatasource);
begin
  Self.FDataSource := ADataSource;
  FDAOFuncao := TDAOFuncao.New(FDataSource)
end;

destructor TModelFuncao.Destroy;
begin
  inherited Destroy;
end;

class function TModelFuncao.New(var ADataSource: TDataSource): IModelFuncao;
begin
  Result := Self.Create(ADataSource);
end;

function TModelFuncao.Id_Emp_Funcao: Integer;
begin
    Result := Self.FId_Emp_Funcao;
end;

function TModelFuncao.Id_Emp_Funcao(AValue: Integer): IModelFuncao;
begin
  Result := Self;
  Self.FId_Emp_Funcao := AValue;
end;

function TModelFuncao.Nm_Funcao: string;
begin
  Result := Self.FNm_Funcao;
end;

function TModelFuncao.Nm_Funcao(AValue: string): IModelFuncao;
begin
  Result := Self;
  Self.FNm_Funcao := AValue;
end;

function TModelFuncao.BuscarPorId(Avalue: Integer): IModelFuncao;
begin
  Result := Self;
  FDAOFuncao.BuscarPorId(AValue);
end;

function TModelFuncao.BuscarIdPorFuncao(AValue: string): IModelFuncao;
begin
  Result := Self;
  FDAOFuncao.BuscarIdPorFuncao(AValue);
end;

function TModelFuncao.ListarTodos: IModelFuncao;
begin
  Result := Self;
  FDAOFuncao.ListarTodos;
end;

function TModelFuncao.Salvar: IModelFuncao;
begin
  Result := Self;
  FDAOFuncao.Salvar(Self);
end;

function TModelFuncao.Alterar: IModelFuncao;
begin
  Result := Self;
  FDAOFuncao.Alterar(Self)
end;

function TModelFuncao.Excluir(AValue: Integer): IModelFuncao;
begin
  Result := Self;
  FDAOFuncao.Excluir(AValue);
end;

end.
