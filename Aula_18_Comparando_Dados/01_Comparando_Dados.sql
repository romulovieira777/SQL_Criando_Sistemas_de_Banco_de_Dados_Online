/*
    Script para demonstrar o uso dos comandos INTERSECT e EXCEPT para comparar dados entre tabelas,
    identificando clientes comuns, clientes que recindiram contratos e novos clientes.
    Autor: Romulo Vieira
    Data: 2025-07-24
*/

-- Selecionando um Banco de Dados Específico
USE Clientes;
GO

-- Selecionando dados de Clientes2015
SELECT
    *
FROM
    Clientes2015;
GO

-- Selecionando dados de Clientes2016
SELECT
    *
FROM
    Clientes2016;
GO

-- Usando o INTERSECT para encontrar clientes comuns entre 2015 e 2016
-- Este comando retorna apenas os clientes que estão presentes em ambas as tabelas
SELECT
    Cliente
FROM
    Clientes2015

INTERSECT

SELECT
    Cliente
FROM
    Clientes2016;
GO

-- Selecionando Clientes que Recindiram Contratos em 2015, utilizando o comando EXCEPT
-- Este comando retorna os clientes que estão em Clientes2015 mas não em Clientes2016
SELECT
    *
FROM
    Clientes2015

EXCEPT

SELECT
    *
FROM
    Clientes2016;
GO

-- Selecionando os Novos Clientes
SELECT
    Cliente
FROM
    Clientes2016

EXCEPT

SELECT
    Cliente
FROM
    Clientes2015;
GO