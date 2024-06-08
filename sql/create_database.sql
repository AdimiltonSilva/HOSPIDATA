-- Database: hospidata

-- DROP DATABASE IF EXISTS hospidata;

CREATE DATABASE hospidata
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

-- Criar a tabela de Departamentos
CREATE TABLE departamentos (
	id_departamento SERIAL CONSTRAINT pk_id_departamento PRIMARY KEY,
	nm_departamento VARCHAR(100) NOT NULL,
	local VARCHAR(100)
);

-- Inserir alguns dados de exemplo na tabela de Departamentos
INSERT INTO departamentos (nm_departamento, local) VALUES
('RECURSOS HUMANOS', 'EDIFÍCIO A, 2º ANDAR'),
('TECNOLOGIA DA INFORMAÇÃO', 'EDIFÍCIO B, 3º ANDAR'),
('MARKETING', 'EDIFÍCIO C, 1º ANDAR'),
('VENDAS', 'EDIFÍCIO D, 4º ANDAR');

-- Criar a tabela de Funcoes
CREATE TABLE emp_funcoes (
    id_emp_funcao SERIAL NOT NULL PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL
);

-- Inserir alguns dados de exemplo na tabela Funcoes'
INSERT INTO emp_funcoes (nm_funcao) VALUES
('GERENTE DE PROJETOS'),
('DESENVOLVEDOR'),
('ANALISTA DE MARKETING'),
('SUPORTE TÉCNICO');

-- Criar a tabela de Empregados
CREATE TABLE empregados (
    id_empregado SERIAL NOT NULL PRIMARY KEY,
    cod_departamento INTEGER NOT NULL,
    cod_emp_funcao INTEGER NOT NULL,
    nm_empregado VARCHAR(100) NOT NULL,
    nm_funcao VARCHAR(100),
    data_admissao DATE,
    salario NUMERIC(9,2),
    comissao NUMERIC(9,2),
    CONSTRAINT fk_cod_departamento FOREIGN KEY (cod_departamento)
        REFERENCES departamentos (id_departamento)
        ON DELETE CASCADE,
    CONSTRAINT fk_cod_emp_funcao FOREIGN KEY (cod_emp_funcao)
        REFERENCES emp_funcoes (id_emp_funcao)
        ON DELETE CASCADE
);

-- Inserir alguns dados de exemplo na tabela de Empregados
INSERT INTO empregados (cod_departamento, cod_emp_funcao, nm_empregado, nm_funcao, data_admissao, salario, comissao) VALUES
(1, 1, 'JOÃO SILVA', 'GERENTE DE PROJETOS', '2020-01-15', 7500.00, 500.00),
(2, 2, 'MARIA SOUZA', 'DESENVOLVEDOR', '2019-03-22', 5500.00, 300.00),
(3, 3, 'CARLOS PEREIRA', 'ANALISTA DE MARKETING', '2021-07-10', 4000.00, 200.00),
(4, 4, 'ANA OLIVEIRA', 'SUPORTE TÉCNICO', '2018-11-30', 3500.00, 100.00);

