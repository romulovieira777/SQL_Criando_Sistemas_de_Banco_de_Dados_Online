/*
    Script para demonstrar o uso dos filtros BETWEEN, LIKE e IN em consultas SQL.
    Exemplos de seleção de dados com filtros de intervalo, padrões de texto e listas de valores.
    Autor: Romulo Vieira
    Data: 2025-07-24
*/

-- Selecionando um Banco de Dados Específico
USE SisDep;
GO

-- Selecionando dados da tabela Funcionario
SELECT
    idMatricula
  , NomeFuncionario
  , Admissao
  , Salario
FROM
    Funcionario
WHERE
    Salario BETWEEN 1500 AND 3000;
GO

-- Selecionando dados da tabela Funcionario
SELECT
    idMatricula
  , NomeFuncionario
  , Admissao
  , Salario
FROM
    Funcionario
WHERE
    Admissao BETWEEN '2005/1/1' AND '2005/12/31';
GO

-- Selecionando dados da tabela Funcionario
SELECT
    idMatricula
  , NomeFuncionario
  , Admissao
  , Salario
FROM
    Funcionario
WHERE
    Admissao NOT BETWEEN '2005/1/1' AND '2005/12/31';
GO

-- Selecionando dados da tabela Funcionario
SELECT
    idDepartamento
  , idMatricula
  , NomeFuncionario
  , Admissao
  , Salario
FROM
    Funcionario
WHERE
    idDepartamento IN (1, 3, 5, 6, 10);
GO

-- Selecionando dados da tabela Funcionario
SELECT
    idDepartamento
  , idMatricula
  , NomeFuncionario
  , Admissao
  , Salario
FROM
    Funcionario
WHERE
    idDepartamento NOT IN (1, 7);
GO

-- Selecionando dados da tabela Funcionario
SELECT
    idDepartamento
  , idMatricula
  , NomeFuncionario
  , Admissao
  , Salario
FROM
    Funcionario
WHERE
    idDepartamento NOT IN (1, 7)
ORDER BY
    idDepartamento ASC;
GO

-- LIKE

/*
    Caracteres Coringa:

    % = 1 ou mais caracteres desconhecidos
    _ = somente 1 caractere desconhecido
*/

-- Selecionando dados da tabela Funcionario com LIKE
SELECT
    idDepartamento
  , idMatricula
  , NomeFuncionario
  , Admissao
  , Salario
FROM
    Funcionario
WHERE
    NomeFuncionario LIKE 'A%'
ORDER BY
    NomeFuncionario ASC;
GO

-- Selecionando dados da tabela Funcionario com LIKE e _ (caractere coringa)
SELECT
    idDepartamento
  , idMatricula
  , NomeFuncionario
  , Admissao
  , Salario
FROM
    Funcionario
WHERE
    NomeFuncionario LIKE 'A_A%'
ORDER BY
    NomeFuncionario ASC;
GO

-- Selecionando dados da tabela Funcionario com LIKE e % (caractere coringa)
SELECT
    idDepartamento
  , idMatricula
  , NomeFuncionario
  , Admissao
  , Salario
FROM
    Funcionario
WHERE
    NomeFuncionario LIKE '%Oliveira'
ORDER BY
    NomeFuncionario ASC;
GO

-- Selecionando dados da tabela Funcionario com LIKE e % (caractere coringa)
SELECT
    idDepartamento
  , idMatricula
  , NomeFuncionario
  , Admissao
  , Salario
FROM
    Funcionario
WHERE
    NomeFuncionario LIKE '%Silva%'
ORDER BY
    NomeFuncionario ASC;
GO