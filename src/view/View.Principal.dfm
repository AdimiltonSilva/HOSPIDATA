object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Principal'
  ClientHeight = 242
  ClientWidth = 527
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Menu = mmMenu
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCloseQuery = FormCloseQuery
  OnKeyPress = FormKeyPress
  TextHeight = 13
  object actlstMenu: TActionList
    Left = 256
    Top = 128
    object actDepartamento: TAction
      Category = 'Cadastros'
      Caption = '&Departamento'
      OnExecute = actDepartamentoExecute
    end
    object actEmpregado: TAction
      Category = 'Cadastros'
      Caption = '&Empregado'
    end
    object actSair: TAction
      Caption = '&Sair'
      OnExecute = actSairExecute
    end
    object actFuncao: TAction
      Category = 'Cadastros'
      Caption = '&Fun'#231#227'o'
      OnExecute = actFuncaoExecute
    end
  end
  object mmMenu: TMainMenu
    Left = 192
    Top = 128
    object Cadastro: TMenuItem
      Caption = '&Cadastros'
      object mniCliente: TMenuItem
        Action = actDepartamento
      end
      object Funo1: TMenuItem
        Action = actFuncao
      end
      object mniFornecedor: TMenuItem
        Action = actEmpregado
      end
    end
    object mniSair: TMenuItem
      Action = actSair
    end
  end
end
