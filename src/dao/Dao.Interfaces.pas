unit Dao.Interfaces;

interface

uses Model.Interfaces;

type
  IDAODepartamento = interface
    ['{667E0D8D-ACC7-42D9-A74E-2B945108617E}']
    function BuscarPorId(AValue: Integer): IDAODepartamento;
    function ListarTodos: IDAODepartamento;
    function Salvar(ADepartamento: IModelDepartamento): IDAODepartamento;
    function Alterar(ADepartamento: IModelDepartamento): IDAODepartamento;
    function Excluir(AValue: Integer): IDAODepartamento;
  end;

implementation

end.
