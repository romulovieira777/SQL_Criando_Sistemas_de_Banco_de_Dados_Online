/*
    Script para demonstrar o uso de junção total (FULL JOIN) e cruzamento cartesiano (CROSS JOIN) entre tabelas,
    seleção de dados relacionados e exemplos de tratamento de valores nulos em consultas SQL.
    Autor: Romulo Vieira
    Data: 2025-07-29
*/

-- Selecionando um Banco de Dados Específico
USE SisDep;
GO

-- Selecionando dados de Funcionarios utilizando FULL JOIN com Dependentes
-- Este comando retorna todos os funcionários e seus dependentes, incluindo aqueles sem dependentes
SELECT
    F.NomeFuncionario
  , F.Admissao
  , D.NomeDependente
  , D.NascimentoDependente
FROM
    Funcionario AS F
FULL JOIN
    Dependente AS D
ON
    F.idMatricula = D.idMatricula
ORDER BY
    F.NomeFuncionario;
GO

-- Selecionando dados de Departamentos
SELECT
    *
FROM
    Depto;
GO

-- Selecionando dados de Projetos
SELECT
    *
FROM
    Projeto;
GO

-- Usando CROSS JOIN para combinar todos os departamentos com todos os projetos
-- Este comando retorna todas as combinações possíveis entre departamentos e projetos
SELECT
    D.NomeDepartamento
  , P.NomeProjeto
  , P.DataInicio
  , P.DataTermino
FROM
    Depto AS D
CROSS JOIN
    Projeto AS P;
GO