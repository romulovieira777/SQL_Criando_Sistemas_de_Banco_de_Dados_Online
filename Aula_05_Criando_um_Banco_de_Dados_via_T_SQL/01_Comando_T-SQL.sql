/*
    Criando um Banco de Dados
    Autor: Romulo Vieira
    Data: 2025-07-03
*/

-- Criando um Banco de Dados via T-SQL
CREATE DATABASE DepartamentoPessoal
GO

-- Colocando o Banco de Dados em uso
USE DepartamentoPessoal
GO

-- Excluir um Banco de Dados
-- O mesmo não poderá estar em uso
USE master
GO

-- Excluindo o Banco de Dados DepartamentoPessoal
DROP DATABASE DepartamentoPessoal
GO