/*
    Script para demonstrar consultas de dados no SQL Server.
    Exemplos de seleção de colunas, ordenação, uso de TOP, TOP PERCENT, TOP WITH TIES,
    e ordenação por múltiplas colunas.
    Autor: Romulo Vieira
    Data: 2025-07-22
*/

-- Selecionando banco de dados
USE SisDep;
GO

-- Selecionando tabela Funcionario
SELECT
    *
FROM
	Funcionario;
GO

-- Selecionando tabela Funcionario, mas apenas algumas colunas
SELECT
    idDepartamento
  , idMatricula
  , NomeFuncionario
  , Admissao
  , Salario
FROM
    Funcionario;
GO


-- Selecionando tabela Funcionario, mas apenas algumas colunas usando order by
SELECT
    idDepartamento
  , idMatricula
  , NomeFuncionario
  , Admissao
  , Salario
FROM
    Funcionario
ORDER BY
    NomeFuncionario ASC;
GO

-- Selecionando tabela Funcionario, mas apenas algumas colunas usando order by
SELECT
    idDepartamento
  , idMatricula
  , NomeFuncionario
  , Admissao
  , Salario
FROM
    Funcionario
ORDER BY
    Salario DESC;
GO

-- Selecionando tabela Funcionario, mas apenas algumas colunas e usando order by por mais de uma coluna
SELECT
    idDepartamento
  , idMatricula
  , NomeFuncionario
  , Admissao
  , Salario
FROM
    Funcionario
ORDER BY
    idDepartamento ASC
  , Salario DESC;
GO

-- Selecionando tabela Funcionario, mas apenas algumas colunas e usando order by por mais de uma coluna epor posicao
SELECT
    idDepartamento
  , idMatricula
  , NomeFuncionario
  , Admissao
  , Salario
FROM
    Funcionario
ORDER BY
    1 ASC
  , 5 DESC;
GO

-- Usando o Rank Top
SELECT
    TOP 20
    idDepartamento
  , idMatricula
  , NomeFuncionario
  , Admissao
  , Salario
FROM
    Funcionario;
GO

-- Usando o Rank Top com 10% de registros
SELECT
    TOP 10 PERCENT
    idDepartamento
  , idMatricula
  , NomeFuncionario
  , Admissao
  , Salario
FROM
    Funcionario;
GO

-- Usando o Rank Top com 10 maiores salários
SELECT
    TOP 10
    idDepartamento
  , idMatricula
  , NomeFuncionario
  , Admissao
  , Salario
FROM
    Funcionario
ORDER BY
    Salario DESC;
GO

-- Trazendo registros com empates
SELECT
    TOP 10 WITH TIES
    idDepartamento
  , idMatricula
  , NomeFuncionario
  , Admissao
  , Salario
FROM
    Funcionario
ORDER BY
    Salario DESC;
GO

-- retornando os 5 funcionarios mais antigos
SELECT
    TOP 5 WITH TIES
    idDepartamento
  , idMatricula
  , NomeFuncionario
  , Admissao
  , Salario
FROM
    Funcionario
ORDER BY
    Admissao ASC;
GO