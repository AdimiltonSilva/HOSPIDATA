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

  IDAOFuncao = interface
    ['{8D8FA5B9-AA5C-4DF8-BDA0-95299A82E2BE}']
    function BuscarPorId(AValue: Integer): IDAOFuncao;
    function ListarTodos: IDAOFuncao;
    function Salvar(AFuncao: IModelFuncao): IDAOFuncao;
    function Alterar(AFuncao: IModelFuncao): IDAOFuncao;
    function Excluir(AValue: Integer): IDAOFuncao;
  end;

implementation

end.
