# Projeto de Avaliação de Conhecimento em Delphi

## Introdução

Este projeto tem como objetivo avaliar o conhecimento em Delphi através da implementação de um sistema de cadastro de empregados e departamentos. O sistema deve permitir a criação, leitura, atualização e exclusão (CRUD) de empregados e departamentos, bem como a visualização das relações entre eles.

## Autor

Adimilton Antonio da Silva <br/>
adimilton@gmail.com <br/>
(81) 98837-4804 <br/>
https://github.com/AdimiltonSilva <br/>
https://www.linkedin.com/in/adimilton-antonio-89553522/

## Requisitos do Sistema

### Funcionalidades

1. **Cadastro de Departamentos**:
    - Adicionar um novo departamento.
    - Editar um departamento existente.
    - Excluir um departamento.
    - Listar todos os departamentos.

2. **Cadastro de Empregados**:
    - Adicionar um novo empregado.
    - Editar um empregado existente.
    - Excluir um empregado.
    - Listar todos os empregados.
    - Listar todos os empregados por departamento.
    - Associar um empregado a um departamento.

3. **Visualização**:
    - Visualizar a lista de empregados por departamento.

### Requisitos Técnicos

- O projeto deve ser desenvolvido em Delphi XE2 ou superior.
- Utilizar um banco de dados relacional (PostgreSQL).
- Interface gráfica deve ser desenvolvida utilizando os componentes padrão do Delphi.
- Implementar todas as operações CRUD para empregados e departamentos.

## Estrutura do Projeto

A estrutura sugerida para o projeto é a seguinte: <br/>
```
/
├── .gitignore
├── hospidata.dpr
├── hospidata.dproj
├── hospidata.res
├── /src
│   ├── /dao # Pasta para arquivos de acesso ao banco de dados 
│   |   ├── UntConexao.pas
│   |   ├── Dao.Interfaces.pas
│   |   ├── Dao.Departamento.pas
│   |   └── Dao.Empregado.pas
│   ├── /model # Pasta para arquivos de modelo 
│   |   ├── Model.Interfaces.pas
│   |   ├── Model.Departamento.pas
│   |   ├── Model.Pessoa.pas
│   |   └── Model.Empregado.pas
│   ├── /view # Pasta para arquivos de interface com o usuário 
│   |   ├── View.Principal.dfm 
│   |   ├── View.Principal.pas
│   |   ├── View.Modelo.dfm
│   |   ├── View.Modelo.pas
│   |   ├── View.Departamento.dfm
│   |   ├── View.Departamento.pas
│   |   ├── View.Empregado.dfm
│   |   ├── View.Empregado.pas
│   |   ├── View.Listagem.dfm
│   |   └── View.Listagem.pas
│   └── /controller # Pasta para arquivos do controlador 
│       ├── Controller.Interfaces.pas
│       ├── Controller.Departamento.pas
│       └── Controller.Empregado.pas
├── /docs # Documentação do projeto 
│   └── README.md # Este arquivo 
└── /sql # Scripts SQL para criação do banco de dados 
    └── create_database.sql 
```
## Licença

Este projeto é licenciado sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

**Nota**: Este projeto é uma avaliação de conhecimento e não deve ser utilizado em ambientes de produção.

## Contato

Para mais informações, entre em contato com adimilton@gmail.com (81)98837-4804
