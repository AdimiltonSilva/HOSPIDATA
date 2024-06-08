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
    function BuscarIdPorDepartamento(AValue: string): IModelDepartamento;
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
    function BuscarIdPorFuncao(AValue: string): IModelFuncao;
    function ListarTodos: IModelFuncao;
    function Salvar: IModelFuncao;
    function Alterar: IModelFuncao;
    function Excluir(AValue: Integer): IModelFuncao;
  end;

  IModelEmpregado = interface
    ['{84AA2E1A-2584-4F30-9EF8-EC165B3B312E}']
    function Id_Empregado: Integer; overload;
    function Id_Empregado(AValue: Integer): IModelEmpregado; overload;
    function Cod_Departamento: Integer; overload;
    function Cod_Departamento(AValue: Integer): IModelEmpregado; overload;
    function Cod_Emp_Funcao: Integer; overload;
    function Cod_Emp_Funcao(AValue: Integer): IModelEmpregado; overload;
    function Nm_Empregado: string; overload;
    function Nm_Empregado(AValue: string): IModelEmpregado; overload;
    function Nm_Funcao: string; overload;
    function Nm_Funcao(AValue: string): IModelEmpregado; overload;
    function Data_Admissao: TDate; overload;
    function Data_Admissao(AValue: TDate): IModelEmpregado; overload;
    function Salario: Currency; overload;
    function Salario(AValue: Currency): IModelEmpregado; overload;
    function Comissao: Currency; overload;
    function Comissao(AValue: Currency): IModelEmpregado; overload;

    function BuscarPorId(AValue: Integer): IModelEmpregado;
    function ListarTodos: IModelEmpregado;
    function Salvar: IModelEmpregado;
    function Alterar: IModelEmpregado;
    function Excluir(AValue: Integer): IModelEmpregado;
  end;

implementation

end.
