unit Controller.Empregado;

interface

uses System.SysUtils,
     Data.DB,
     Model.Empregado,
     Model.Interfaces,
     Controller.Interfaces;

type
  TControllerEmpregado = class(TInterfacedObject, IControllerEmpregado)
    private
      FDataSource: TDataSource;
      FModelEmpregado: IModelEmpregado;
    public
      constructor Create(var ADataSource: TDataSource);
      destructor Destroy; override;
      class function New(var ADataSource: TDataSource): IControllerEmpregado;

      function Id_Empregado: Integer; overload;
      function Id_Empregado(AValue: Integer): IControllerEmpregado; overload;
      function Cod_Departamento: Integer; overload;
      function Cod_Departamento(AValue: Integer): IControllerEmpregado; overload;
      function Cod_Emp_Funcao: Integer; overload;
      function Cod_Emp_Funcao(AValue: Integer): IControllerEmpregado; overload;
      function Nm_Empregado: string; overload;
      function Nm_Empregado(AValue: string): IControllerEmpregado; overload;
      function Nm_Funcao: string; overload;
      function Nm_Funcao(AValue: string): IControllerEmpregado; overload;
      function Data_Admissao: TDate; overload;
      function Data_Admissao(AValue: TDate): IControllerEmpregado; overload;
      function Salario: Currency; overload;
      function Salario(AValue: Currency): IControllerEmpregado; overload;
      function Comissao: Currency; overload;
      function Comissao(AValue: Currency): IControllerEmpregado; overload;

      function BuscarPorId(AValue: Integer): IControllerEmpregado;
      function ListarTodos: IControllerEmpregado;
      function Salvar: IControllerEmpregado;
      function Alterar: IControllerEmpregado;
      function Excluir(AValue: Integer): IControllerEmpregado;
  end;

implementation

{ TControllerEmpregado }

constructor TControllerEmpregado.Create(var ADataSource: TDataSource);
begin
  FDataSource := ADataSource;
  FModelEmpregado := TModelEmpregado.New(FDataSource);
end;

destructor TControllerEmpregado.Destroy;
begin
  inherited Destroy;
end;

class function TControllerEmpregado.New(var ADataSource: TDataSource): IControllerEmpregado;
begin
  Result := Self.Create(ADataSource);
end;

function TControllerEmpregado.Id_Empregado: Integer;
begin
  Result := FModelEmpregado.Id_Empregado;
end;

function TControllerEmpregado.Id_Empregado(AValue: Integer): IControllerEmpregado;
begin
  Result := Self;
  FModelEmpregado.Id_Empregado(AValue);
end;

function TControllerEmpregado.Cod_Departamento: Integer;
begin
  Result := FModelEmpregado.Cod_Departamento;
end;

function TControllerEmpregado.Cod_Departamento(AValue: Integer): IControllerEmpregado;
begin
  Result := Self;
  FModelEmpregado.Cod_Departamento(AValue);
end;

function TControllerEmpregado.Cod_Emp_Funcao: Integer;
begin
  Result := FModelEmpregado.Cod_Emp_Funcao;
end;

function TControllerEmpregado.Cod_Emp_Funcao(AValue: Integer): IControllerEmpregado;
begin
  Result := Self;
  FModelEmpregado.Cod_Emp_Funcao(AValue);
end;

function TControllerEmpregado.Nm_Empregado: string;
begin
  Result := FModelEmpregado.Nm_Empregado;
end;

function TControllerEmpregado.Nm_Empregado(AValue: string): IControllerEmpregado;
begin
  Result := Self;

  if AValue.isEmpty then
    raise Exception.Create('O Nome da Empregado não pode ser vazio.');

  FModelEmpregado.Nm_Empregado(AValue);
end;

function TControllerEmpregado.Nm_Funcao: string;
begin
  Result := FModelEmpregado.Nm_Funcao;
end;

function TControllerEmpregado.Nm_Funcao(AValue: string): IControllerEmpregado;
begin
  Result := Self;
  FModelEmpregado.Nm_Funcao(AValue);
end;

function TControllerEmpregado.Data_Admissao: TDate;
begin
  Result := FModelEmpregado.Data_Admissao;
end;

function TControllerEmpregado.Data_Admissao(AValue: TDate): IControllerEmpregado;
begin
  Result := Self;
  FModelEmpregado.Data_Admissao(AValue);
end;

function TControllerEmpregado.Salario: Currency;
begin
  Result := FModelEmpregado.Salario;
end;

function TControllerEmpregado.Salario(AValue: Currency): IControllerEmpregado;
begin
  Result := Self;
  FModelEmpregado.Salario(AValue);
end;

function TControllerEmpregado.Comissao: Currency;
begin
  Result := FModelEmpregado.Comissao;
end;

function TControllerEmpregado.Comissao(AValue: Currency): IControllerEmpregado;
begin
  Result := Self;
  FModelEmpregado.Comissao(AValue);
end;

function TControllerEmpregado.BuscarPorId(AValue: Integer): IControllerEmpregado;
begin
  Result := Self;
  FModelEmpregado.BuscarPorId(AValue);
end;

function TControllerEmpregado.ListarTodos: IControllerEmpregado;
begin
  Result := Self;
  FModelEmpregado.ListarTodos;
end;

function TControllerEmpregado.Salvar: IControllerEmpregado;
begin
  Result := Self;
  FModelEmpregado.Salvar;
end;

function TControllerEmpregado.Alterar: IControllerEmpregado;
begin
  Result := Self;
  FModelEmpregado.Alterar;
end;

function TControllerEmpregado.Excluir(AValue: Integer): IControllerEmpregado;
begin
  Result := Self;
  FModelEmpregado.Excluir(AValue);
end;

end.
