/*
    Script para demonstrar o uso de valores nulos em tabelas, atualização de campos para NULL,
    e funções ISNULL e COALESCE para tratamento de valores nulos em consultas SQL.
    Autor: Romulo Vieira
    Data: 2025-07-25
*/

-- Selecionando um Banco de Dados Específico
USE SysConVendas;
GO

-- Selecionando dados da tabela Dados
SELECT
    *
FROM
    Dados;
GO

-- Atualizando valores nulos na coluna Vendedor
BEGIN TRAN
    UPDATE Dados
    SET Vendedor = NULL
    WHERE Pedido IN (21820, 21872, 21924, 21963, 22080);
GO

-- Selecionando dados da tabela Dados
SELECT
    *
FROM
    Dados;
GO

-- Atualizando valores nulos na coluna Vendedor
BEGIN TRAN
    UPDATE Dados
    SET Vendedor = NULL
    WHERE Pedido IN (21820, 21872, 21924, 21963, 22080);
COMMIT;
GO

-- Selecionando dados da tabela Dados novamente
SELECT
    Pedido
  , Vendedor
  , Produto
  , Total
FROM
    Dados;
GO

-- Utilizando ISNULL para substituir valores nulos na coluna Vendedor
SELECT
    Pedido
  , ISNULL(Vendedor, 'Sem Informação') AS Vendedor
  , Produto
  , Total
FROM
    Dados;
GO

-- Utilizando ISNULL para substituir valores nulos na coluna Vendedor
SELECT
    Pedido
  , ISNULL(Vendedor, '') AS Vendedor
  , Produto
  , Total
FROM
    Dados;
GO

-- Selecionando pedidos onde o vendedor é nulo
SELECT
    Pedido
  , Vendedor
  , Produto
  , Total
FROM
    Dados
WHERE
    Vendedor IS NULL;
GO

-- Selecionando pedidos onde o vendedor não é nulo
-- (ou seja, pedidos com vendedor atribuído)
SELECT
    Pedido
  , Vendedor
  , Produto
  , Total
FROM
    Dados
WHERE
    Vendedor IS NOT NULL;
GO

-- Criando um tabela Cotação
CREATE TABLE Cotacao (
    codigo INT IDENTITY(1,1) PRIMARY KEY
  , produto VARCHAR(50) NOT NULL
  , cotacao1 MONEY NULL
  , cotacao2 MONEY NULL
  , cotacao3 MONEY NULL
);
GO

-- Inserindo dados na tabela Cotacao
INSERT INTO
    Cotacao
VALUES
    ('Mouse', NULL, 25, NULL)
  , ('Impressora', 200, NULL, 350)
  , ('Monitor', NULL, NULL, 500)
  , ('HD Externo', NULL, NULL, NULL)
GO

-- Selecionando dados da tabela Cotacao
SELECT
    *
FROM
    Cotacao;
GO

-- Utilizando COALESCE para substituir valores nulos na coluna cotacao
SELECT
    produto
  , COALESCE(cotacao1, cotacao2, cotacao3, 0) AS cotacao
FROM
    Cotacao;
GO

-- Utilizando COALESCE para substituir valores nulos na coluna cotacao
SELECT
    *
FROM
    Cotacao
WHERE
    COALESCE(cotacao1, cotacao2, cotacao3, 0)= 0;
GO