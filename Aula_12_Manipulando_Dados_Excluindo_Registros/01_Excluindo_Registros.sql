/*
    Script para excluir e manipular dados em tabelas no SQL Server.
    Inclui exemplos de exclusão, seleção e restrições de integridade.
    Autor: Romulo Vieira
    Data: 2025-07-18
*/

-- Seleção do banco de dados
USE Consorcio;
GO

-- Visualizando dados da tabela Carteiras
SELECT
    *
FROM
    Carteiras;
GO

-- Excluindo registros da tabela Carteiras
DELETE FROM Carteiras
WHERE Cpf = 74632202244;
GO

-- Verificando os dados após exclusão
SELECT
    *
FROM
    Carteiras;
GO

-- Excluindo registros da tabela Carteiras
DELETE FROM Carteiras
WHERE Uf = 'GO';
GO

-- Escolhendo banco de dados SisDep
USE SisDep;
GO

-- Excluindo registros da tabela Funcionario
DELETE FROM Funcionario
WHERE idMatricula = 1001;
GO

-- Excluindo registros da tabela Funcionario (Erro)
DELETE FROM Funcionario
WHERE idMatricula = 1000;
GO

-- Visualizando dados da tabela Funcionario
SELECT
    *
FROM
    Funcionario
WHERE
    idMatricula = 1000;
GO
