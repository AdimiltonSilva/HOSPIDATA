program hospidata;

uses
  Vcl.Forms,
  View.Principal in 'src\view\View.Principal.pas' {FrmPrincipal},
  View.Modelo in 'src\view\View.Modelo.pas' {FrmCadastroPadrao},
  View.Departamento in 'src\view\View.Departamento.pas' {FrmCadastroDepartamento},
  Model.Departamento in 'src\model\Model.Departamento.pas',
  Dao.Interfaces in 'src\dao\Dao.Interfaces.pas',
  UntConexao in 'src\dao\UntConexao.pas',
  Controller.Departamento in 'src\controller\Controller.Departamento.pas',
  Dao.Departamento in 'src\dao\Dao.Departamento.pas',
  Model.Interfaces in 'src\model\Model.Interfaces.pas',
  Controller.Interfaces in 'src\controller\Controller.Interfaces.pas',
  Dao.Funcao in 'src\dao\Dao.Funcao.pas',
  Controller.Funcao in 'src\controller\Controller.Funcao.pas',
  Model.Funcao in 'src\model\Model.Funcao.pas',
  View.Funcao in 'src\view\View.Funcao.pas' {FrmCadastroFuncao},
  Dao.Empregado in 'src\dao\Dao.Empregado.pas',
  Controller.Empregado in 'src\controller\Controller.Empregado.pas',
  Model.Empregado in 'src\model\Model.Empregado.pas',
  View.Empregado in 'src\view\View.Empregado.pas' {FrmCadastroEmpregado},
  View.Listagem in 'src\view\View.Listagem.pas' {FrmListagem};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TFrmCadastroFuncao, FrmCadastroFuncao);
  Application.CreateForm(TFrmCadastroEmpregado, FrmCadastroEmpregado);
  Application.Run;
end.
