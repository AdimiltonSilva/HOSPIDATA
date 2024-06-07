unit Model.Interfaces;

interface

type
  IModelDepartamento = interface
    ['{D12CC25B-5818-421F-88CE-498BF964DEAF}']
    function Id_Departamento: Integer; overload;
    function Id_Departamento(AValue: Integer): IModelDepartamento overload;
    function Nm_Departamento: string; overload;
    function Nm_Departamento(AValue: string): IModelDepartamento overload;
    function Local: string; overload;
    function Local(AValue: string): IModelDepartamento overload;

    function BuscarPorId(AValue: Integer): IModelDepartamento;
    function ListarTodos: IModelDepartamento;
    function Salvar: IModelDepartamento;
    function Alterar: IModelDepartamento;
    function Excluir(AValue: Integer): IModelDepartamento;
  end;

  IModelFuncao = interface
    ['{A3193CF4-12CC-40B0-B9E8-FF0ECB6A7E25}']
    function Id_Emp_Funcao: Integer; overload;
    function Id_Emp_Funcao(AValue: Integer): IModelFuncao; overload;
    function Nm_Funcao: string; overload;
    function Nm_Funcao(AValue: string): IModelFuncao; overload;

    function BuscarPorId(AValue: Integer): IModelFuncao;
    function ListarTodos: IModelFuncao;
    function Salvar: IModelFuncao;
    function Alterar: IModelFuncao;
    function Excluir(AValue: Integer): IModelFuncao;
  end;

implementation

end.
