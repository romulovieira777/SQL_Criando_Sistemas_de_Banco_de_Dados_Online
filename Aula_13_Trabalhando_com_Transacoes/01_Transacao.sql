/*
    Script para demonstrar o uso de transações no SQL Server.
    Inclui exemplos de BEGIN TRANSACTION, COMMIT, ROLLBACK, manipulação e seleção de dados.
    Autor: Romulo Vieira
    Data: 2025-07-22
*/

-- Seleção do banco de dados
USE SeguroVeiculo;
GO

-- Seleção de todas as apólices
SELECT
    *
FROM
    Apolices;
GO

-- Inicando uma transacao
BEGIN TRANSACTION;

-- Verificar se ha alguma transacao ativa
SELECT
    @@TRANCOUNT AS TransacaoAtiva;
GO

UPDATE Apolices
SET ValorApolice = ValorApolice + 1500;
GO

-- Cancelando a transacao
ROLLBACK TRANSACTION;

-- Inicando uma transacao
BEGIN TRAN
    UPDATE Apolices
    SET ValorApolice = ValorApolice + 1500
    WHERE nContrato = 1000;
GO

-- Seleção de todas as apólices
SELECT
    *
FROM
    Apolices;
GO

-- Confirmando a transacao
COMMIT TRANSACTION;
GO

-- Seleção do banco de dados
USE SisDep;
GO

-- Iniciando uma transacao
BEGIN TRANSACTION
    UPDATE Funcionario
    SET Salario = Salario * 1.1
    OUTPUT
        deleted.idMatricula
      , deleted.NomeFuncionario
      , deleted.Salario  AS SalarioAntigo
      , inserted.Salario AS SalarioNovo
    WHERE idMatricula <= 3000;
GO

-- Confirmando a transacao
COMMIT TRANSACTION;
GO
