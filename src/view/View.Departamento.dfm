inherited FrmCadastroDepartamento: TFrmCadastroDepartamento
  Caption = 'Cadastro de Departamentos'
  StyleElements = [seFont, seClient, seBorder]
  TextHeight = 13
  inherited pnlcontainer: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited pgcMain: TPageControl
      ActivePage = tsEdit
      inherited tsConsulta: TTabSheet
        inherited pnlMainConsultar: TPanel
          StyleElements = [seFont, seClient, seBorder]
          inherited pnlPesquisar: TPanel
            StyleElements = [seFont, seClient, seBorder]
            inherited lblPesquisarCodigo: TLabel
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited edtPesquisar: TEdit
              StyleElements = [seFont, seClient, seBorder]
            end
            inherited btnPesquisar: TButton
              OnClick = btnPesquisarClick
            end
          end
          inherited pnlNavegador: TPanel
            StyleElements = [seFont, seClient, seBorder]
            inherited dbnGridConsultar: TDBNavigator
              Hints.Strings = ()
            end
          end
        end
      end
      inherited tsEdit: TTabSheet
        inherited pnlMainEditar: TPanel
          StyleElements = [seFont, seClient, seBorder]
          object lblLocal: TLabel
            Left = 10
            Top = 106
            Width = 24
            Height = 13
            Caption = 'Local'
          end
          object lblDesc: TLabel
            Left = 10
            Top = 60
            Width = 27
            Height = 13
            Caption = 'Nome'
          end
          object lblCodigo: TLabel
            Left = 10
            Top = 14
            Width = 33
            Height = 13
            Caption = 'C'#243'digo'
          end
          object edtId: TEdit
            Left = 10
            Top = 30
            Width = 60
            Height = 21
            Alignment = taRightJustify
            CharCase = ecUpperCase
            Enabled = False
            TabOrder = 0
          end
          object edtLocal: TEdit
            Left = 10
            Top = 122
            Width = 330
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 100
            TabOrder = 2
          end
          object edtNome: TEdit
            Left = 10
            Top = 76
            Width = 330
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 100
            TabOrder = 1
          end
        end
      end
    end
  end
  inherited pnlBottuns: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited btnExcluir: TButton
      OnClick = btnExcluirClick
    end
  end
  inherited dsConsultar: TDataSource
    OnDataChange = dsConsultarDataChange
  end
end
