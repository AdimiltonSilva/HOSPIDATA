unit Controller.Funcao;

interface

uses System.SysUtils,
     Data.DB,
     Model.Funcao,
     Model.Interfaces,
     Controller.Interfaces;

type
  TControllerFuncao = class(TInterfacedObject, IControllerFuncao)
    private
      FDataSource: TDataSource;
      FModelFuncao: IModelFuncao;
    public
      constructor Create(var ADataSource: TDataSource);
      destructor Destroy; override;
      class function New(var ADataSource: TDataSource): IControllerFuncao;

      function Id_Emp_Funcao: Integer; overload;
      function Id_Emp_Funcao(AValue: Integer): IControllerFuncao; overload;
      function Nm_Funcao: string; overload;
      function Nm_Funcao(AValue: string): IControllerFuncao; overload;

      function BuscarPorId(AValue: Integer): IControllerFuncao;
      function ListarTodos: IControllerFuncao;
      function Salvar: IControllerFuncao;
      function Alterar: IControllerFuncao;
      function Excluir(AValue: Integer): IControllerFuncao;
  end;

implementation

{ TControllerFuncao }

constructor TControllerFuncao.Create(var ADataSource: TDataSource);
begin
  FDataSource := ADataSource;
  FModelFuncao := TModelFuncao.New(FDataSource);
end;

destructor TControllerFuncao.Destroy;
begin
  inherited Destroy;
end;

class function TControllerFuncao.New(var ADataSource: TDataSource): IControllerFuncao;
begin
  Result := Self.Create(ADataSource);
end;

function TControllerFuncao.Id_Emp_Funcao: Integer;
begin
  Result := FModelFuncao.Id_Emp_Funcao;
end;

function TControllerFuncao.Id_Emp_Funcao(AValue: Integer): IControllerFuncao;
begin
  Result := Self;
  FModelFuncao.Id_Emp_Funcao(AValue);
end;

function TControllerFuncao.Nm_Funcao: string;
begin
  Result := FModelFuncao.Nm_Funcao;
end;

function TControllerFuncao.Nm_Funcao(AValue: string): IControllerFuncao;
begin
  Result := Self;

  if AValue.isEmpty then
    raise Exception.Create('o Nome da Funcao não pode ser vazia.');

  FModelFuncao.Nm_Funcao(AValue);
end;

function TControllerFuncao.Salvar: IControllerFuncao;
begin
  Result := Self;
  FModelFuncao.Salvar;
end;

function TControllerFuncao.BuscarPorId(AValue: Integer): IControllerFuncao;
begin
  Result := Self;
  FModelFuncao.BuscarPorId(AValue);
end;

function TControllerFuncao.ListarTodos: IControllerFuncao;
begin
  Result := Self;
  FModelFuncao.ListarTodos;
end;

function TControllerFuncao.Alterar: IControllerFuncao;
begin
  Result := Self;
  FModelFuncao.Alterar;
end;

function TControllerFuncao.Excluir(AValue: Integer): IControllerFuncao;
begin
  Result := Self;
  FModelFuncao.Excluir(AValue);
end;

end.
