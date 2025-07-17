/*
    Script para criação de constraints, chaves estrangeiras, chaves únicas, check constraints e valores default no Banco de Dados PEDIDOS_VAZIO.
    Autor: Romulo Vieira
    Data: 2025-07-17
*/

-- Escolhendo o banco de dados
USE PEDIDOS_VAZIO;
GO

--=========================================================
--3 - Criar chaves estrangeiras para TB_PEDIDO
--=========================================================
-- Com TB_CLIENTE
ALTER TABLE TB_PEDIDO ADD CONSTRAINT FK_TB_PEDIDO_TB_CLIENTE
FOREIGN KEY (CODCLI) REFERENCES TB_CLIENTE(CODCLI);

-- Com TB_VENDEDOR
ALTER TABLE TB_PEDIDO ADD CONSTRAINT FK_TB_PEDIDO_VENDEDORES
FOREIGN KEY (CODVEN) REFERENCES TB_VENDEDOR (CODVEN);

--=========================================================
-- 4 - Criar chaves estrangeiras para TB_PRODUTO
--=========================================================
-- Com TB_TIPOPRODUTO
ALTER TABLE TB_PRODUTO ADD CONSTRAINT FK_TB_PRODUTO_TIPOPRODUTO
FOREIGN KEY (COD_TIPO) REFERENCES TB_TIPOPRODUTO(COD_TIPO);

-- Com TB_UNIDADE
ALTER TABLE TB_PRODUTO ADD CONSTRAINT FK_TB_PRODUTO_TB_UNIDADE
FOREIGN KEY (COD_UNIDADE) REFERENCES TB_UNIDADE(COD_UNIDADE);

--=========================================================
-- 5 -Criar chaves estrangeiras para TB_ITENSPEDIDO
--=========================================================
-- Com TB_PEDIDO
ALTER TABLE TB_ITENSPEDIDO ADD CONSTRAINT FK_TB_ITENSPEDIDO_PEDIDOS
FOREIGN KEY (NUM_PEDIDO) REFERENCES TB_PEDIDO(NUM_PEDIDO);
-- Com TB_PRODUTO

ALTER TABLE TB_ITENSPEDIDO ADD CONSTRAINT FK_TB_ITENSPEDIDO_PRODUTOS
FOREIGN KEY (ID_PRODUTO) REFERENCES TB_PRODUTO(ID_PRODUTO);
-- Com TB_COR

ALTER TABLE TB_ITENSPEDIDO ADD CONSTRAINT FK_TB_ITENSPEDIDO_TB_COR
FOREIGN KEY (CODCOR) REFERENCES TB_COR(CODCOR);

--=========================================================
-- 6 - Criar chave única para TB_UNIDADE (campo UNIDADE)
--=========================================================
ALTER TABLE TB_UNIDADE ADD CONSTRAINT UNQ_TB_UNIDADE_UNIDADE
UNIQUE ( UNIDADE );

--=========================================================
-- 7 - Criar chave única para TB_TIPOPRODUTO (campo TIPO)
--=========================================================
ALTER TABLE TB_TIPOPRODUTO ADD CONSTRAINT UNQ_TB_TIPOPRODUTO_TIPO
UNIQUE ( TIPO );

--=========================================================
-- 8 - Criar check constraints para TB_PRODUTO
--=========================================================
-- Preço de venda (PRECO_VENDA) tem que ser maior que preço de
-- custo (PRECO_CUSTO)
ALTER TABLE TB_PRODUTO
ADD CONSTRAINT CHK_TB_PRODUTO_VENDA_MAIOR_QUE_CUSTO
CHECK( PRECO_VENDA > PRECO_CUSTO );
-- Preço mínimo precisa ser maior que zero

ALTER TABLE TB_PRODUTO
ADD CONSTRAINT CHK_TB_PRODUTO_PR_CUSTO_POSITIVO
CHECK( PRECO_CUSTO > 0 );
-- O campo QTD_REAL não pode ser menor que zero

ALTER TABLE TB_PRODUTO
ADD CONSTRAINT CHK_TB_PRODUTO_REAL_MAIOR_QUE_ZERO
CHECK( QTD_REAL > = 0 );

--=========================================================
-- 9 - Criar check constraints para TB_ITENSPEDIDO
--=========================================================
-- QUANTIDADE tem que ser >= 1
ALTER TABLE TB_ITENSPEDIDO ADD
CONSTRAINT CHK_TB_ITENSPEDIDO_QTD_MAIOR_QUE_ZERO
CHECK( QUANTIDADE >= 1 );

-- PR_UNITARIO tem que ser maior que zero
ALTER TABLE TB_ITENSPEDIDO ADD
CONSTRAINT CHK_TB_ITENSPEDIDO_PR_UNIT_MAIOR_QUE_ZERO
CHECK( PR_UNITARIO > 0 );

-- DESCONTO não pode ser maior que 10 e nem menor que zero
ALTER TABLE TB_ITENSPEDIDO ADD
CONSTRAINT CHK_TB_ITENSPEDIDO_DESCONTO_ENTRE_0_10
CHECK (DESCONTO BETWEEN 0 AND 10);

--=========================================================
-- 10 - Criar valores default para TB_PRODUTO
--=========================================================
-- PRECO_VENDA e PRECO_CUSTO valor ZERO
ALTER TABLE TB_PRODUTO ADD CONSTRAINT DEF_TB_PRODUTO_PR_VENDA
DEFAULT( 0 ) FOR PRECO_VENDA;

ALTER TABLE TB_PRODUTO
ADD CONSTRAINT DEF_TB_PRODUTO_PR_CUSTO
DEFAULT( 0 ) FOR PRECO_CUSTO;
-- QTD_REAL, QTD_ESTIMADA e QTD_MINIMA igual a zero
-- 1 comando ALTER TABLE para cada campo
-- COD_TIPO e COD_UNIDADE igual a zero

ALTER TABLE TB_PRODUTO ADD
   CONSTRAINT DEF_TB_PRODUTO_QTD_REAL
   DEFAULT(0) FOR QTD_REAL,
   CONSTRAINT DEF_TB_PRODUTO_QTD_ESTIMADA
   DEFAULT(0) FOR QTD_ESTIMADA,
   CONSTRAINT DEF_TB_PRODUTO_QTD_MINIMA
   DEFAULT(0) FOR QTD_MINIMA,
   CONSTRAINT DEF_TB_PRODUTO_COD_TIPO
   DEFAULT(0) FOR COD_TIPO,
   CONSTRAINT DEF_TB_PRODUTO_COD_UNIDADE
   DEFAULT(0) FOR COD_UNIDADE;
