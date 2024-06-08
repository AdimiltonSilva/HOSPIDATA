unit Controller.Departamento;

interface

uses System.SysUtils,
     Data.DB,
     Model.Departamento,
     Model.Interfaces,
     Controller.Interfaces;

type
  TControllerDepartamento = class(TInterfacedObject, IControllerDepartamento)
    private
      FDataSource: TDataSource;
      FModelDepartamento: IModelDepartamento;
    public
      constructor Create(var ADataSource: TDataSource);
      destructor Destroy; override;
      class function New(var ADataSource: TDataSource): IControllerDepartamento;

      function Id_Departamento: Integer; overload;
      function Id_Departamento(AValue: Integer): IControllerDepartamento; overload;
      function Nm_Departamento: string; overload;
      function Nm_Departamento(AValue: string): IControllerDepartamento; overload;
      function Local: string; overload;
      function Local(AValue: string): IControllerDepartamento; overload;

      function BuscarPorId(AValue: Integer): IControllerDepartamento;
      function BuscarIdPorDepartamento(AValue: string): IControllerDepartamento;
      function ListarTodos: IControllerDepartamento;
      function Salvar: IControllerDepartamento;
      function Alterar: IControllerDepartamento;
      function Excluir(AValue: Integer): IControllerDepartamento;
  end;

implementation

{ TControllerDepartamento }

constructor TControllerDepartamento.Create(var ADataSource: TDataSource);
begin
  FDataSource := ADataSource;
  FModelDepartamento := TModelDepartamento.New(FDataSource);
end;

destructor TControllerDepartamento.Destroy;
begin
  inherited Destroy;
end;

class function TControllerDepartamento.New(var ADataSource: TDataSource): IControllerDepartamento;
begin
  Result := Self.Create(ADataSource);
end;

function TControllerDepartamento.Id_Departamento: Integer;
begin
  Result := FModelDepartamento.Id_Departamento;
end;

function TControllerDepartamento.Id_Departamento(AValue: Integer): IControllerDepartamento;
begin
  Result := Self;
  FModelDepartamento.Id_Departamento(AValue);
end;

function TControllerDepartamento.Nm_Departamento: string;
begin
  Result := FModelDepartamento.Nm_Departamento;
end;

function TControllerDepartamento.Nm_Departamento(AValue: string): IControllerDepartamento;
begin
  Result := Self;

  if AValue.isEmpty then
    raise Exception.Create('o Nome do departamento não pode ser vazio.');

  FModelDepartamento.Nm_Departamento(AValue);
end;

function TControllerDepartamento.Local: string;
begin
  Result := FModelDepartamento.Local;
end;

function TControllerDepartamento.Local(AValue: string): IControllerDepartamento;
begin
  Result := Self;

  if AValue.IsEmpty then
    raise Exception.Create('O local do departamento não pode ser vazio.');

  FModelDepartamento.Local(AValue);
end;

function TControllerDepartamento.Salvar: IControllerDepartamento;
begin
  Result := Self;
  FModelDepartamento.Salvar;
end;

function TControllerDepartamento.BuscarPorId(AValue: Integer): IControllerDepartamento;
begin
  Result := Self;
  FModelDepartamento.BuscarPorId(AValue);
end;

function TControllerDepartamento.BuscarIdPorDepartamento(AValue: string): IControllerDepartamento;
begin
  Result := Self;
  FModelDepartamento.BuscarIdPorDepartamento(AValue);
end;

function TControllerDepartamento.ListarTodos: IControllerDepartamento;
begin
  Result := Self;
  FModelDepartamento.ListarTodos;
end;

function TControllerDepartamento.Alterar: IControllerDepartamento;
begin
  Result := Self;
  FModelDepartamento.Alterar;
end;

function TControllerDepartamento.Excluir(AValue: Integer): IControllerDepartamento;
begin
  Result := Self;
  FModelDepartamento.Excluir(AValue);
end;

end.
