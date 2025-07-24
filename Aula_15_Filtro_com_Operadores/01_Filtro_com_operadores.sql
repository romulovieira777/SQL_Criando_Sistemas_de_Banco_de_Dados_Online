/*
    Script para demonstrar o uso de operadores relacionais, lógicos, aritméticos e compostos em consultas SQL.
    Exemplos de seleção de dados, filtros com WHERE, uso de operadores AND, OR, NOT, operadores aritméticos em SELECT,
    atualização de dados com UPDATE e ordenação de resultados.
    Autor: Romulo Vieira
    Data: 2025-07-22
*/

-- Selecionando um Banco de Dados Específico
USE SeguroVeiculo;
GO

-- Selecionando todas as Colunas da Tabela Apolices
SELECT
    *
FROM
    Apolices;
GO

-- Operadores Relacionais
SELECT
    *
FROM
    Apolices
WHERE
    valorApolice >= 5000;
GO

-- Operadores Lógicos
SELECT
    *
FROM
    Apolices
WHERE
    idSeguradora = 1 OR idSeguradora = 3;
GO

-- Operadores Lógicos
SELECT
    *
FROM
    Apolices
WHERE
    idSeguradora = 1 AND valorApolice >= 5000;
GO

-- Operadores Lógicos
SELECT
    *
FROM
    Apolices
WHERE
    NOT idCidade = 5;
GO

-- Operadores Lógicos Combinados
SELECT
    *
FROM
    Apolices
WHERE
    valorApolice >= 30000
ORDER BY
    valorApolice DESC;
GO

-- Operadores Aritméticos
SELECT
    nContrato
  , valorApolice
  , valorApolice * 1.1 AS valorApoliceComDesconto
FROM
    Apolices
GO

-- Operadores de Compostos
BEGIN TRAN
    UPDATE Apolices
    SET valorApolice = valorApolice * 1.1
COMMIT TRAN;
GO