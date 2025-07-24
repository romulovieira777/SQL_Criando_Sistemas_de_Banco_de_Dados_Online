/*
    Script para demonstrar o uso de comandos UNION e UNION ALL para unir dados de diferentes tabelas,
    além de exemplos de atualização de dados com UPDATE e aplicação de filtros e ordenação em consultas SQL.
    Autor: Romulo Vieira
    Data: 2025-07-24
*/

-- Selecionando um Banco de Dados Específico
USE Clientes;
GO

-- Todas os comandos SELECT deverão ter o mesmo número de colunas
-- Todas as colunas unidas deverão ter o mesmo tipo de dado

-- Selecionando dados de duas tabelas diferentes e unindo os resultados
SELECT
    *
FROM
    Clientes20215

UNION

SELECT
    *
FROM
    Clientes20216;
GO

-- Selecionando dados de duas tabelas diferentes e unindo os resultados com ordenação
-- A ordenação será aplicada ao resultado combinado das duas tabelas
SELECT
    *
FROM
    Clientes20215

UNION

SELECT
    *
FROM
    Clientes20216
ORDER BY
    Cliente ASC;
GO

-- Selecionando dados de duas tabelas diferentes e unindo os resultados com ordenação
-- A ordenação será aplicada ao resultado combinado das duas tabelas
SELECT
    'Cliente 2015'
  , *
FROM
    Clientes20215

UNION

SELECT
    'Cliente 2016' 
  , *
FROM
    Clientes20216
ORDER BY
    Cliente ASC;
GO

-- Selecionando dados de duas tabelas diferentes e unindo os resultados com ordenação
-- A ordenação será aplicada ao resultado combinado das duas tabelas
SELECT
    'Cliente 2015' AS Ano
  , *
FROM
    Clientes20215

UNION

SELECT
    'Cliente 2016' 
  , *
FROM
    Clientes20216
ORDER BY
    Cliente ASC;
GO

-- Selecionando dados de duas tabelas diferentes e unindo os resultados com ordenação
-- A ordenação será aplicada ao resultado combinado das duas tabelas
SELECT
    *
FROM
    Clientes20215

UNION ALL

SELECT
    *
FROM
    Clientes20216
ORDER BY
    Cliente ASC;
GO

-- Atualizando dados da tabela Clientes20215
-- Atualizando a coluna Apolice para o valor 30000 onde o Codigo é 2790
-- Esta atualização afetará apenas a tabela Clientes20215
UPDATE
    Clientes20215
SET
    Apolice = 30000
WHERE
    Codigo = 2790;
GO

-- Atualizando dados da tabela Clientes20216
-- Atualizando a coluna Apolice para o valor 30000 onde o Codigo é 2790
-- Esta atualização afetará apenas a tabela Clientes20216
UPDATE
    Clientes20216
SET
    Apolice = 30000
WHERE
    Codigo = 2790;
GO

-- Selecionando dados de duas tabelas diferentes e unindo os resultados com filtro
-- A ordenação será aplicada ao resultado combinado das duas tabelas
SELECT
    *
FROM
    Clientes20215
WHERE
    Cidade = 'São Paulo'

UNION ALL

SELECT
    *
FROM
    Clientes20216
WHERE
    Cidade = 'Rio de Janeiro'
ORDER BY
    Cliente ASC;
GO