/*
    Script de criação de índices no SQL Server.
    Inclui exemplos de criação, visualização e exclusão de índices na tabela tblEstoque.
    Autor: Romulo Vieira
    Data: 2025-07-17
*/

-- Seleção do banco de dados
USE Concessionaria;
GO

-- Visualizando indices existentes
EXEC sp_help 'tblEstoque';
GO

-- Criando um índice
CREATE NONCLUSTERED INDEX IX_tblEstoque
ON tblEstoque (dataEntrada DESC);
GO

-- Verificando os índices criados
EXEC sp_helpindex 'tblEstoque';
GO

-- Excluindo um índice
DROP INDEX IX_tblEstoque
ON tblEstoque;
GO

-- Verificando os índices após exclusão
EXEC sp_helpindex 'tblEstoque';
GO
