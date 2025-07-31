/*
    Script para demonstrar o uso de subconsultas (EXISTS, IN, NOT IN), seleção condicional,
    comparação com valores agregados, e manipulação de dados relacionados entre tabelas.
    Autor: Romulo Vieira
    Data: 2025-07-31
*/

-- Selecionando banco de dados
USE Clientes;
GO

-- Selecionando todos os registros da tabela Clientes2015
SELECT
    *
FROM
    Clientes2015;
GO

-- Selecionando todos os registros da tabela Clientes2016
SELECT
    *
FROM
    Clientes2016;
GO

-- Selecionando registros da tabela Clientes2015 onde o código do cliente existe na tabela Clientes2016
SELECT
    *
FROM
    Clientes2015
WHERE
    EXISTS (
        SELECT
            Codigo
        FROM
            Clientes2016
    );
GO

-- Selecionando registros da tabela Clientes2015 onde o código do cliente existe na tabela Clientes2016
-- Utilizando a cláusula EXISTS para verificar a existência de registros relacionados
SELECT
    *
FROM
    Clientes2015 AS C15
WHERE
    EXISTS (
        SELECT
            Codigo
        FROM
            Clientes2016 AS C16
        WHERE
            C15.Codigo = C16.Codigo
    );
GO

-- Selecionando banco de dados
USE SisDep;
GO

-- Selecionando registros da tabela Funcionarios onde o ID de matrícula existe na tabela Dependente
SELECT
    F.NomeFuncionario
FROM
    Funcionario AS F
WHERE
    F.idMatricula IN (
        SELECT
            D.idMatricula
        FROM
           Dependente AS D
    );
GO

-- Selecionando registros da tabela Funcionarios onde o ID de matrícula não existe na tabela Dependente
SELECT
    F.NomeFuncionario
FROM
    Funcionario AS F
WHERE
    F.idMatricula NOT IN (
        SELECT
            D.idMatricula
        FROM
           Dependente AS D
    );
GO

-- Selecionando média salarial
SELECT
    AVG(Salario) AS MediaSalario
FROM
    Funcionario;
GO

-- Selecionando funcionários com salário acima da média salarial
-- Utilizando subconsulta para comparar o salário de cada funcionário com a média salarial
SELECT
    NomeFuncionario
  , Admissao
  , Salario
FROM
    Funcionario
WHERE
    Salario > (
        SELECT
            AVG(Salario)
        FROM
            Funcionario
    );
GO