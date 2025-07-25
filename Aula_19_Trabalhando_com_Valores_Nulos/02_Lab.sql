/*
    Script para demonstrar o uso de valores nulos em tabelas, atualização de campos para NULL,
    e funções ISNULL e COALESCE para tratamento de valores nulos em consultas SQL,
    além de exemplos de cálculos envolvendo possíveis valores nulos.
    Autor: Romulo Vieira
    Data: 2025-07-25
*/

-- 1.Usar o banco de dados PEDIDOS
USE PEDIDOS;
GO

-- Mostrar as tabelas do banco
EXEC SP_TABLES;
GO

-- Mostrar a estrutura de uma tabela
EXEC SP_HELP TB_PRODUTO;
GO

/*
2.Listar TB_PRODUTO mostrando COD_PRODUTO, DESCRICAO,
     PRECO_CUSTO, PRECO_VENDA e calculando
     o lucro unitario
*/
SELECT
   COD_PRODUTO
 , DESCRICAO
 , PRECO_CUSTO
 , PRECO_VENDA
 , PRECO_VENDA - PRECO_CUSTO AS LUCRO_UNITARIO
FROM
    TB_PRODUTO;
GO

/*
3.Listar COD_PRODUTO, DESCRICAO e valor total investido
     no estoque daquele produto (QTD_REAL * PRECO_CUSTO)
     da tabela TB_PRODUTO
*/
SELECT
  COD_PRODUTO
, DESCRICAO
, QTD_REAL * PRECO_CUSTO AS VLR_INVESTIDO
FROM
    TB_PRODUTO;
GO

/*
4.Listar TB_ITENSPEDIDO, campos NUM_PEDIDO, NUM_ITEM, COD_PRODUTO,
     PR_UNITARIO, QUANTIDADE, DESCONTO e valor
     PR_UNITARIO * QUANTIDADE * (1-DESCONTO/100)
*/
SELECT
   NUM_PEDIDO
 , NUM_ITEM
 , COD_PRODUTO
 , PR_UNITARIO
 , QUANTIDADE
 , DESCONTO
 , PR_UNITARIO * QUANTIDADE * (1-DESCONTO/100) AS VALOR
FROM
    TB_ITENSPEDIDO;
GO

/*
5.Listar tabela TB_PRODUTO, campos COD_PRODUTO, DESCRICAO,
     PRECO_CUSTO, PRECO_VENDA e lucro estimado em reais
     QTD_REAL * (PRECO_VENDA - PRECO_CUSTO)
*/
SELECT
   COD_PRODUTO
 , DESCRICAO
 , PRECO_CUSTO
 , PRECO_VENDA
 , QTD_REAL * (PRECO_VENDA - PRECO_CUSTO) AS LUCRO_EST
FROM
    TB_PRODUTO;
GO

/*
6.Listar COD_PRODUTO, DESCRICAO, PRECO_CUSTO,
     PRECO_VENDA e lucro unitario em reais
     (PRECO_VENDA - PRECO_CUSTO) e percentual de lucro
    (100 * (PRECO_VENDA - PRECO_CUSTO) / PRECO_CUSTO)
*/
SELECT
    COD_PRODUTO
  , DESCRICAO
  , PRECO_CUSTO
  , PRECO_VENDA
  , PRECO_VENDA - PRECO_CUSTO AS [Lucro R$]
  , 100 * (PRECO_VENDA - PRECO_CUSTO) / PRECO_CUSTO AS [Lucro %]
FROM
    TB_PRODUTO
WHERE
    PRECO_CUSTO > 0;
GO