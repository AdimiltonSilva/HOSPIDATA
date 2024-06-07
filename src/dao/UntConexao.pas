unit UntConexao;

interface

uses
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client,
  FireDAC.Phys.PGDef, FireDAC.Phys.PG;

type
  TConexao = class
    private
      FConn: TFDConnection;
      FDPhysPgDriverLink: TFDPhysPgDriverLink;

      procedure ConfigurarConexao;
    public
      constructor Create;
      destructor Destroy; override;

      function GetConexao: TFDConnection;
  end;

  const
    BANCO_DADOS = 'hospidata';

implementation

{ TConexao }

constructor TConexao.Create;
begin
  FConn := TFDConnection.Create(nil);

  ConfigurarConexao;

  Inherited;
end;

destructor TConexao.Destroy;
begin
  inherited Destroy;
end;

procedure TConexao.ConfigurarConexao;
begin
  FConn.DriverName := 'PG';
  FConn.Params.DriverID := 'PG';
  FConn.Params.Database := BANCO_DADOS;
  FConn.Params.UserName := 'postgres';
  FConn.Params.Password := 'Notlimida@72';
  FConn.Params.Add('Server=localhost');
  FConn.Params.Add('Port=5432');
  FConn.LoginPrompt := False;
end;

function TConexao.GetConexao: TFDConnection;
begin
  Result := FConn;
end;

end.
