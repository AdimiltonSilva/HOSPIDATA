unit Model.Empregado;

interface

uses
  System.SysUtils,
  Data.DB,
  Model.Interfaces,
  Dao.Interfaces,
  Dao.Empregado;

type
  TModelEmpregado = class(TInterfacedObject, IModelEmpregado)
    private
      FId_Empregado: Integer;
      FCod_Departamento: Integer;
      FCod_Emp_Funcao: Integer;
      FNm_Empregado: string;
      FNm_Funcao: string;
      FData_Admissao: TDate;
      FSalario: Currency;
      FComissao: Currency;
      FDAOEmpregado: IDAOEmpregado;
      FDataSource: TDataSource;
    public
      constructor Create(var ADataSource: TDataSource);
      destructor Destroy; override;

      class function New(var ADataSource: TDataSource): IModelEmpregado;

      function Id_Empregado: Integer; overload;
      function Id_Empregado(AValue: Integer): IModelEmpregado overload;
      function Cod_Departamento: Integer; overload;
      function Cod_Departamento(AValue: Integer): IModelEmpregado overload;
      function Cod_Emp_Funcao: Integer; overload;
      function Cod_Emp_Funcao(AValue: Integer): IModelEmpregado overload;
      function Nm_Empregado: string; overload;
      function Nm_Empregado(AValue: string): IModelEmpregado overload;
      function Nm_Funcao: string; overload;
      function Nm_Funcao(AValue: string): IModelEmpregado overload;
      function Data_Admissao: TDate; overload;
      function Data_Admissao(AValue: TDate): IModelEmpregado; overload;
      function Salario: Currency; overload;
      function Salario(AValue: Currency): IModelEmpregado overload;
      function Comissao: Currency; overload;
      function Comissao(AValue: Currency): IModelEmpregado overload;

      function BuscarPorId(Avalue: Integer): IModelEmpregado;
      function ListarTodos: IModelEmpregado;
      function Salvar: IModelEmpregado;
      function Alterar: IModelEmpregado;
      function Excluir(AValue: Integer): IModelEmpregado;
  end;


implementation

{ TModelEmpregado }

constructor TModelEmpregado.Create(var ADataSource: TDatasource);
begin
  Self.FDataSource := ADataSource;
  FDAOEmpregado := TDAOEmpregado.New(FDataSource)
end;

destructor TModelEmpregado.Destroy;
begin
  inherited Destroy;
end;

class function TModelEmpregado.New(var ADataSource: TDataSource): IModelEmpregado;
begin
  Result := Self.Create(ADataSource);
end;

function TModelEmpregado.Id_Empregado: Integer;
begin
    Result := Self.FId_Empregado;
end;

function TModelEmpregado.Id_Empregado(AValue: Integer): IModelEmpregado;
begin
  Result := Self;
  Self.FId_Empregado := AValue;
end;

function TModelEmpregado.Cod_Departamento: Integer;
begin
  Result := Self.FCod_Departamento;
end;

function TModelEmpregado.Cod_Departamento(AValue: Integer): IModelEmpregado;
begin
  Result := Self;
  Self.FCod_Departamento := AValue;
end;

function TModelEmpregado.Cod_Emp_Funcao: Integer;
begin
  Result := Self.FCod_Emp_Funcao;
end;

function TModelEmpregado.Cod_Emp_Funcao(AValue: Integer): IModelEmpregado;
begin
  Result := Self;
  Self.FCod_Emp_Funcao := AValue;
end;

function TModelEmpregado.Nm_Empregado: string;
begin
  Result := Self.FNm_Empregado;
end;

function TModelEmpregado.Nm_Empregado(AValue: string): IModelEmpregado;
begin
  Result := Self;
  Self.FNm_Empregado := AValue;
end;

function TModelEmpregado.Nm_Funcao: string;
begin
  Result := Self.FNm_Funcao;
end;

function TModelEmpregado.Nm_Funcao(AValue: string): IModelEmpregado;
begin
  Result := Self;
  Self.FNm_Funcao := AValue;
end;

function TModelEmpregado.Data_Admissao: TDate;
begin
  Result := Self.FData_Admissao;
end;

function TModelEmpregado.Data_Admissao(AValue: TDate): IModelEmpregado;
begin
  Result := Self;
  Self.FData_Admissao := AValue;
end;

function TModelEmpregado.Salario: Currency;
begin
  Result := Self.FSalario;
end;

function TModelEmpregado.Salario(AValue: Currency): IModelEmpregado;
begin
  Result := Self;
  Self.FSalario := AValue;
end;

function TModelEmpregado.Comissao: Currency;
begin
  Result := Self.FComissao;
end;

function TModelEmpregado.Comissao(AValue: Currency): IModelEmpregado;
begin
  Result := Self;
  Self.FComissao := AValue;
end;

function TModelEmpregado.BuscarPorId(Avalue: Integer): IModelEmpregado;
begin
  Result := Self;
  FDAOEmpregado.BuscarPorId(AValue);
end;

function TModelEmpregado.ListarTodos: IModelEmpregado;
begin
  Result := Self;
  FDAOEmpregado.ListarTodos;
end;

function TModelEmpregado.Salvar: IModelEmpregado;
begin
  Result := Self;
  FDAOEmpregado.Salvar(Self);
end;

function TModelEmpregado.Alterar: IModelEmpregado;
begin
  Result := Self;
  FDAOEmpregado.Alterar(Self)
end;

function TModelEmpregado.Excluir(AValue: Integer): IModelEmpregado;
begin
  Result := Self;
  FDAOEmpregado.Excluir(AValue);
end;

end.
