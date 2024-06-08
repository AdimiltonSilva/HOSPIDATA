unit View.Listagem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, QRCtrls, QuickRpt;

type
  TFrmListagem = class(TForm)
    qrListagem: TQuickRep;
    PageHeaderBand1: TQRBand;
    SummaryBand1: TQRBand;
    qrlDev: TQRLabel;
    QRLabel1: TQRLabel;
    qrlTitulo: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRSysData3: TQRSysData;
    QRSysData4: TQRSysData;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    qrlDepartamento: TQRLabel;
    QRLabel4: TQRLabel;
    qrdbtDepartamento: TQRDBText;
    qrdbtNome: TQRDBText;
    QRLabel2: TQRLabel;
    qrdbtFuncao: TQRDBText;
    procedure QRSysData3Print(sender: TObject; var Value: string);
    procedure QRSysData4Print(sender: TObject; var Value: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation


{$R *.dfm}

procedure TFrmListagem.QRSysData3Print(sender: TObject; var Value: string);
begin
  Value := 'Pag: ' + Value;
end;

procedure TFrmListagem.QRSysData4Print(sender: TObject; var Value: string);
begin
  Value := 'Total de registros: ' + Value;
end;

end.
