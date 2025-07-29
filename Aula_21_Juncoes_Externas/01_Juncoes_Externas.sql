/*
    Script para demonstrar o uso de junções externas (LEFT JOIN e RIGHT JOIN) entre tabelas,
    seleção de dados relacionados e exemplos de tratamento de valores nulos em consultas SQL.
    Autor: Romulo Vieira
    Data: 2025-07-29
*/

-- Selecionando um Banco de Dados Específico
USE SisDep;
GO

-- Exemplo de Junção Externa (LEFT JOIN) entre Funcionario e Dependente
SELECT
    F.NomeFuncionario
  , D.NomeDependente
  , D.NascimentoDependente
FROM
    Funcionario AS F
LEFT OUTER JOIN
    Dependente AS D
ON
    D.idMatricula = F.idMatricula
ORDER BY
    F.NomeFuncionario ASC;
GO

-- Exemplo de Junção Externa (RIGHT JOIN) entre Funcionario e Cargo
-- Aqui, todos os cargos serão listados, mesmo que não haja funcionários associados a eles.
SELECT
    F.NomeFuncionario
  , C.NomeCargo
  , F.Salario
FROM
    Funcionario AS F
RIGHT JOIN
    Cargo AS C
ON
    F.idCargo = C.idCargo;
GO

--
SELECT
    F.NomeFuncionario
  , C.NomeCargo
  , F.Salario
FROM
    Funcionario AS F
RIGHT JOIN
    Cargo AS C
ON
    F.idCargo = C.idCargo
WHERE
    F.NomeFuncionario IS NULL;
GO