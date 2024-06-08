AVALIAÇÃO DE CANDIDATO À VAGA DE PROGRAMADOR DELPHI

NOME: ADIMILTON ANTONIO DA SILVA
E-MAIL: adimilton@gmail.com
FONE: (81) 98837-4804

PERFIL DO CANDIDATO

1. Quais as linguagens de programação que você trabalha/Estuda? qual seu grau de intimidade com as mesmas?
    - Delphi: Avançado
    - PHP: Intermediário
    - React/Node: Intermediário
    - C#: Básico
    - HTML5/CSS/JavaScript: Básico

2. Quais bancos de dados você já utilizou/estudou?
    - Firebird
    - SQLServer
    - Oracle
    - MySQL

3. Tem experiência em criação de triggers e functions no banco de dados?
    - Básico

4. Você já trabalhou como desenvolvedor? Quais tarefas você desenpenhou?
    - Delphi/Oracle 10G: Sistema de bilhetagem (controle de passagens de ônibus coletivos intermunicipais)
    - PHP/MySQL: Desenvolvimento de uma ferramenta Web para captação de novos talentos e integração com o sistema de folha de pagamentos. Uso da ferramenta git/GitHub para controle de versão.
    - Delphi/Firebird: Manutenção de módulo de Estoque e desenvolvimento de novas funcionalidades.
    - Delphi/Firebird/SQLServer: Manutenção no módulo do Sistema de Folha de Pagamento e desenvolvimento de novas funcionalidades. Testes de Software usando o Framework DUnit. Uso da ferramenta Jira para acompanhamento do fluxo de trabalho e atividades. Uso da ferramenta TortoiseSVN para controle de versão.

5. Têm experiência com algum componente de terceiro no Delphi? Por exemplo, Zeos, DevExpress, ACBR, FastReport?
    - QuickReport, FortesReport

6. Quais geradores de relatórios já utlizou e qual o tempo de experiÊncia em cada um?
    - QuickReport: 6anos
    - FortesReport: 2anos

7. Possui conhecimento em desenvolvimento/consumo de webservices? Se sim, em quais linguagens?
    - Delphi, React e Node

8. Utilizou alguma ferramenta para versionamento de fontes? Quais elas?
    - TortoiseSVN e git/GitHub

9. Escreva uma consulta para exibir o nome do empregado, a função e a data de admissão. Ordene pelo maior salário.
```
    SELECT e.nm_empregado AS "NOME",
        e.nm_funcao AS "FUNCAO",
        e.data_admissao AS "ADMISSAO"
    FROM empregados e
    INNER JOIN emp_funcoes ef ON ef.id_emp_funcao = e.cod_emp_funcao
    ORDER BY e.salario DESC;
```

10. Escreva uma consulta para exibir o nome do empregado e a data de admissão para todos os empregados que estão no mesmo departamento do empregado "Marcelo", excluindo-o do resultado.
```
SELECT nm_empregado, data_admissao
  FROM empregados
 WHERE cod_departamento = (
    SELECT cod_departamento
    FROM empregados
    WHERE nm_empregado = 'MARCELO'
    )
    AND nm_empregado <> 'MARCELO';
```

11. Escreva uma consulta que mostre o número do empregado e o nome para todos os empregados que trabalham em um departamento com qualquer empregado cujo nome contenha uma letra "T".
```
SELECT e.id_empregado AS "ID", e.nm_empregado AS "NOME"
FROM empregados e
WHERE e.cod_departamento IN (
    SELECT DISTINCT cod_departamento
    FROM empregados
    WHERE nm_empregado LIKE '%T%'
);
```

12. Escreva uma consulta que mostre o nome do empregado, o departamento, a localização e a função de todos os empregados admitidos há mais de 5 anos, cujo salário ultrapasse o menor salário entre os empregados de função "GERENTE".
```
SELECT e.nm_empregado AS "NOME", 
	   d.nm_departamento AS "DEPARTAMENTO", 
	   d.local AS "LOCAL", 
	   e.nm_funcao AS "FUNCAO"
FROM empregados e
JOIN departamentos d ON e.cod_departamento = d.id_departamento
WHERE e.data_admissao < CURRENT_DATE - INTERVAL '5 YEAR'
    AND e.salario > (
        SELECT MIN(salario)
        FROM empregados
        WHERE nm_funcao = 'GERENTE'
    );
```

13. Escreva uma consulta que mostre a soma dos salários, o departamento e o cargo de todos os empregados admitidos há mais de 1 ano, localizados em "Porto Alegre".
```
SELECT d.nm_departamento AS "DEPARTAMENTO", 
       e.nm_funcao AS "FUNCAO", 
       SUM(e.salario) AS "TOTAL_SALARIO"
  FROM empregados e
  JOIN departamentos d ON e.cod_departamento = d.id_departamento
 WHERE e.data_admissao < CURRENT_DATE - INTERVAL '1 YEAR'
   AND d.local = 'Porto Alegre'
 GROUP BY d.nm_departamento, e.nm_funcao;
```

14. Qual o modo correto utilizado para relacionar a tabela de empregados com a tabela de departamentos?
    - Precisamos ter uma chave estrangeira na tabela empregados que faça referência à chave primária da tabela de departamentos. Essa chave estrangeira garante a integridade referencial entre as duas tabelas.
