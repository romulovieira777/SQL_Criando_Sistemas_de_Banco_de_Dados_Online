/*
    Script para inserir e manipular dados em tabelas no SQL Server.
    Inclui exemplos de inserção, seleção e restrições de integridade.
    Autor: Romulo Vieira
    Data: 2025-07-18
*/

-- Escolha do banco de dados
USE Concessionaria;
GO

-- Exibe informações sobre a tabela tblMarca
EXEC sp_help tblMarcas;
GO

--Inserindo dados na tabela tblMarcas posicional
INSERT INTO tblMarcas
VALUES ('FIAT');
GO

-- Inserção de varias linhas na tabela tblMarcas
INSERT INTO tblMarcas
VALUES ('FORD'), ('CHEVROLET'), ('VOLKSWAGEN'), ('HONDA');
GO

-- Visualizando os dados inseridos
SELECT
    *
FROM
    tblMarcas;
GO

-- Inserindo dados declarativos na tabela tblMarcas
INSERT INTO tblModelos (idMarca, nomeModelo)
VALUES (4, 'Onix'), (1, 'Uno'), (3, 'Eco Sport');
GO

-- Visualizando os dados inseridos
SELECT
    *
FROM
    tblModelos;
GO

-- Inserindo dados na tabela tblEstoque
INSERT INTO tblEstoque (idModelo, dataEntrada, precoEstoque)
VALUES (1, '2017-01-05', 45000);
GO

-- Vai dar erro devido o check criado na tabela tblEstoque
INSERT INTO tblEstoque (idModelo, dataEntrada, precoEstoque)
VALUES (1, '2017-01-05', 2000);
GO