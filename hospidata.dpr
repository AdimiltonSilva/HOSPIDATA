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
  Controller.Interfaces in 'src\controller\Controller.Interfaces.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
