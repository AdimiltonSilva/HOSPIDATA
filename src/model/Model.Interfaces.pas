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

implementation

end.
