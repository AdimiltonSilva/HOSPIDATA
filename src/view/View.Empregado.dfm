inherited FrmCadastroEmpregado: TFrmCadastroEmpregado
  Caption = 'Cadastro de Empregados'
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
          object lblCodigo: TLabel
            Left = 10
            Top = 14
            Width = 33
            Height = 13
            Caption = 'C'#243'digo'
          end
          object lblDesc: TLabel
            Left = 10
            Top = 60
            Width = 27
            Height = 13
            Caption = 'Nome'
          end
          object lblDataAdmissao: TLabel
            Left = 350
            Top = 60
            Width = 86
            Height = 13
            Caption = 'Data de Admiss'#227'o'
          end
          object lblFuncao: TLabel
            Left = 10
            Top = 106
            Width = 35
            Height = 13
            Caption = 'Fun'#231#227'o'
          end
          object lblDepartamento: TLabel
            Left = 235
            Top = 106
            Width = 69
            Height = 13
            Caption = 'Departamento'
          end
          object lblSalario: TLabel
            Left = 10
            Top = 152
            Width = 32
            Height = 13
            Caption = 'Sal'#225'rio'
          end
          object lblComissao: TLabel
            Left = 125
            Top = 152
            Width = 45
            Height = 13
            Caption = 'Comiss'#227'o'
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
          object edtNome: TEdit
            Left = 10
            Top = 76
            Width = 330
            Height = 21
            CharCase = ecUpperCase
            MaxLength = 100
            TabOrder = 1
          end
          object dtpDataAdmissao: TDateTimePicker
            Left = 350
            Top = 76
            Width = 100
            Height = 21
            Date = 45450.000000000000000000
            Time = 0.772353935186401900
            TabOrder = 2
          end
          object cbbFuncao: TComboBox
            Left = 10
            Top = 122
            Width = 215
            Height = 21
            TabOrder = 3
          end
          object cbbDepartamento: TComboBox
            Left = 235
            Top = 122
            Width = 215
            Height = 21
            TabOrder = 4
          end
          object edtSalario: TEdit
            Left = 10
            Top = 168
            Width = 100
            Height = 21
            Alignment = taRightJustify
            CharCase = ecUpperCase
            MaxLength = 100
            NumbersOnly = True
            TabOrder = 5
            OnEnter = edtSalarioEnter
            OnExit = edtSalarioExit
          end
          object edtComissao: TEdit
            Left = 125
            Top = 168
            Width = 100
            Height = 21
            Alignment = taRightJustify
            CharCase = ecUpperCase
            MaxLength = 100
            NumbersOnly = True
            TabOrder = 6
            OnEnter = edtComissaoEnter
            OnExit = edtComissaoExit
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
  object dsFuncao: TDataSource
    Left = 96
    Top = 248
  end
  object dsDepartamento: TDataSource
    Left = 96
    Top = 312
  end
end
