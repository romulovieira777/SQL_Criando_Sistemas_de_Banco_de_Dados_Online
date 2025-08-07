/*
    Script to demonstrate the use of temporary tables, data manipulation (INSERT, UPDATE),
    conditional selection, and queries involving related tables.
    Author: Romulo Vieira
    Date: 2025-08-07
*/

-- Criando tabela temporária para armazenar os dados de clientes
CREATE TABLE #Clientes (
    codigo INT PRIMARY KEY
  , nomeCliente VARCHAR(50)
  , cadastro DATE
);
GO

-- Exibindo dados da tabela temporária #Clientes
SELECT
    *
FROM
    #Clientes;
GO

-- Inserindo dados na tabela temporária #Clientes
-- A tabela será utilizada para demonstrar operações de manipulação de dados
INSERT INTO #Clientes (codigo, nomeCliente, cadastro)
VALUES
    (1, 'Romulo', '2025-08-07'),
    (2, 'Maria', '2025-08-07'),
    (3, 'João', '2025-08-07');
GO

-- Exibindo os dados inseridos na tabela temporária #Clientes
SELECT
    *
FROM
    #Clientes;
GO

-- Selecionando banco de dados SysConVendas
USE SysConVendas;
GO

-- Exibindo os dados da tabela Dados
SELECT
    *
FROM
    Dados;
GO

-- Criando uma tabela temporária para armazenar os dados da tabela Dados
SELECT
    *
INTO
    #Pesquisa1
FROM
    Dados;
GO

-- Exibindo os dados da tabela temporária #Pesquisa1
SELECT
    *
FROM
    #Pesquisa1;
GO

-- Selecionando dados da tabela temporária #Pesquisa1 onde o mês é agosto
SELECT
    *
FROM
    #Pesquisa1
WHERE
    Mes = 'agosto';
GO

-- Atualizando o nome do vendedor na tabela temporária #Pesquisa1
-- para o pedido específico onde o código do pedido é 21794
UPDATE
    #Pesquisa1
SET
    Vendedor = 'Romulo'
WHERE
    Pedido = 21794;
GO

-- Exibindo os dados atualizados da tabela temporária ##Pesquisa2
SELECT
    *
INTO
    ##Pesquisa2
FROM
    Dados
WHERE
    Regiao = 'sudeste';
GO

-- Exibindo os dados atualizados da tabela temporária ##Pesquisa2
SELECT
    *
FROM
    ##Pesquisa2;
GO