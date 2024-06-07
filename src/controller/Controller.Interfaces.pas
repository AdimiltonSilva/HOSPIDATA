unit Controller.Interfaces;

interface

type
  IControllerDepartamento = interface
    ['{1D871B8A-B417-4AE7-9851-E34F060A828B}']
    function Id_Departamento: Integer; overload;
    function Id_Departamento(AValue: Integer): IControllerDepartamento overload;
    function Nm_Departamento: string; overload;
    function Nm_Departamento(AValue: string): IControllerDepartamento overload;
    function Local: string; overload;
    function Local(AValue: string): IControllerDepartamento overload;

    function BuscarPorId(AValue: Integer): IControllerDepartamento;
    function ListarTodos: IControllerDepartamento;
    function Salvar: IControllerDepartamento;
    function Alterar: IControllerDepartamento;
    function Excluir(AValue: Integer): IControllerDepartamento;
  end;

implementation

end.
