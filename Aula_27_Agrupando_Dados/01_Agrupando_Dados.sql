/*
    Script para demonstrar o uso de funções de agregação (SUM, AVG, MAX, MIN, COUNT),
    manipulação de dados, seleção condicional e consultas envolvendo tabelas relacionadas.
    Inclui exemplos de GROUP BY, HAVING, TOP N, JOINs e ordenação.
    Autor: Romulo Vieira
    Data: 2025-08-08
*/

-- Seleciona o banco de dados SysConVendas
USE SysConVendas;
GO

-- Seleciona todos os dados da tabela Dados
SELECT
    *
FROM
    Dados;
GO

-- Total de vendas
SELECT
    SUM(Total) AS FaturamentoTotal
FROM
    Dados;
GO

-- Faturamento por cidade
SELECT
    Cidade
  , SUM(Total) AS FaturamentoTotal
FROM
    Dados
GROUP BY
    Cidade;
GO

-- Faturamento por cidade e produto
SELECT
    Cidade
  , Produto
  , SUM(Total) AS FaturamentoTotal
  , COUNT(*) AS NumerodeOcorrencias
FROM
    Dados
GROUP BY
    Cidade
  , Produto;
GO

-- Faturamento por cidade
SELECT
    Cidade
  , SUM(Total) AS FaturamentoTotal
FROM
    Dados
GROUP BY
    Cidade
HAVING
    SUM(Total) > 20000
ORDER BY
    2;
GO

-- Faturamento por cidade com resultados
SELECT
    Cidade
  , SUM(Total) AS FaturamentoTotal
FROM
    Dados
GROUP BY
    Cidade
WITH ROLLUP
GO

-- Faturamento por cidade e produto
SELECT
    Cidade
  , Produto
  , SUM(Total) AS FaturamentoTotal
FROM
    Dados
GROUP BY
    Cidade
  , Produto
WITH ROLLUP
GO

-- Faturamento por cidade e produto
SELECT
    Cidade
  , Produto
  , SUM(Total) AS FaturamentoTotal
FROM
    Dados
GROUP BY
    Cidade
  , Produto
WITH CUBE
GO

-- Seleciona o banco de dados SisDep
USE SisDep;
GO

-- Seleciona todos os dados da tabela Funcionario fazendo uma contagem de dependentes
SELECT
    NomeFuncionario
  , COUNT(*) AS NumeroDependentes
FROM
    Funcionario AS F
INNER JOIN
    Dependente AS D ON F.idMatricula = D.idMatricula
GROUP BY
    NomeFuncionario;
GO