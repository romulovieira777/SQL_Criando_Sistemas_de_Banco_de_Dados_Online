/*
    Script para demonstrar consultas SQL com filtros, cálculos e uso de valores nulos,
    incluindo exemplos de ISNULL e COALESCE para tratamento de nulos.
    Autor: Romulo Vieira
    Data: 2025-07-25
*/

-- 1. Usar o banco de dados PEDIDOS.
USE PEDIDOS;
GO

-- 2. Listar clientes do estado de Sao Paulo (SP).
-- Campo ESTADO da tabela TB_CLIENTE CHAR(2) e contem a sigla do estado
SELECT
    *
FROM
    TB_CLIENTE
WHERE
    ESTADO = 'SP';
GO

-- 3. Listar clientes do estado de  Minas Gerais e Rio de Janeiro (MG, RJ).
SELECT
    *
FROM
    TB_CLIENTE
WHERE
    ESTADO IN ('MG','RJ');
GO

-- 4. Listar clientes do estado de  S�o Paulo, Minas Gerais e Rio de Janeiro (SP,MG,RJ).
SELECT
    *
FROM
    TB_CLIENTE
WHERE
    ESTADO IN ('SP','MG','RJ');
GO

-- 5. Listar os vendedores com o nome LEIA.
SELECT
    *
FROM
    TB_VENDEDOR
WHERE
    NOME LIKE 'LEIA%';
GO

-- 6. Listar todos os clientes que tenham NOME comecando com BRINDES.
SELECT
    *
FROM
    TB_CLIENTE
WHERE
    NOME LIKE 'BRINDES%';
GO

-- 7. Listar todos os clientes que tenham NOME terminando com BRINDES.
SELECT
    *
FROM
    TB_CLIENTE
WHERE
    NOME LIKE '%BRINDES';
GO

-- 8. Listar todos os clientes que tenham NOME contendo BRINDES.
SELECT
    *
FROM
    TB_CLIENTE
WHERE
    NOME LIKE '%BRINDES%';
GO

-- 9. Listar todos os produtos com DESCRICAO comecando por CANETA.
SELECT
    *
FROM
    TB_PRODUTO
WHERE
    DESCRICAO LIKE 'CANETA%';
GO

-- 10. Listar todos os produtos com DESCRICAO contendo SPECIAL.
SELECT
    *
FROM
    TB_PRODUTO
WHERE
    DESCRICAO LIKE '%SPECIAL%';
GO

-- 11. Listar todos os produtos com DESCRICAO terminando por GOLD.
SELECT
    *
FROM
    TB_PRODUTO
WHERE
    DESCRICAO LIKE '%GOLD';
GO

-- 12. Listar todos os clientes que tenham a letra A como segundo caractere do nome.
SELECT
    *
FROM
    TB_CLIENTE
WHERE
    NOME LIKE '_A%';
GO

--  13. Listar todos os produtos que tenham comecado (ZERO) como segundo caractere do campo COD_PRODUTO.
SELECT
    *
FROM
    TB_PRODUTO
WHERE
    COD_PRODUTO LIKE '_0%';
GO

-- 14. Listar todos os produtos que tenham Acesso como terceiro caractere do campo COD_PRODUTO.
SELECT
    *
FROM
    TB_PRODUTO
WHERE
    COD_PRODUTO LIKE '__A%';
GO