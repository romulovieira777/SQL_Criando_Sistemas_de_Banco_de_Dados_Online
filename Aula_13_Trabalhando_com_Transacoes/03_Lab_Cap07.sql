/*
    Script para demonstrar o uso de transações no SQL Server.
    Exemplos de atualização, exclusão e cópia de dados com transações (BEGIN TRAN, COMMIT, ROLLBACK)
    e uso da cláusula OUTPUT para conferência dos resultados.
    Autor: Romulo Vieira
    Data: 2025-07-22
*/

-- 1. Colocar o banco de dados PEDIDOS em uso
USE PEDIDOS;
GO

-- 2. Aumentar o preco de custo de todos os produtos do tipo 2 em 15%
--    Utilize transacao e a clausula OUTPUT para conferir o resultado
-- Resposta:

-- Abrir transacao
BEGIN TRAN

-- Executar o UPDATE
UPDATE TB_PRODUTO SET PRECO_CUSTO = PRECO_CUSTO * 1.15
OUTPUT INSERTED.COD_PRODUTO, INSERTED.DESCRICAO, INSERTED.COD_TIPO,
       DELETED.PRECO_CUSTO AS PRECO_ANTIGO, INSERTED.PRECO_CUSTO AS PRECO_NOVO,
	   INSERTED.PRECO_CUSTO / DELETED.PRECO_CUSTO AS FATOR
WHERE COD_TIPO = 2;
GO

-- Verificar se deu certo analisando o resultado do comando

-- Obs.: Como o campo PRECO_CUSTO tem 4 casas depois da virgula,
--       a coluna calculada FATOR n�o ser� exatamente 1.15, mas proximo disso
-- Ok. Alteracao correta
COMMIT
GO

-- 3. Fazer com que os precos de venda dos produtos do
-- tipo 2 fiquem 30% acima do preco de custo
-- Utilize transacao e a clausula OUTPUT para conferir o resultado
-- Resposta:
BEGIN TRAN

UPDATE TB_PRODUTO SET PRECO_VENDA = PRECO_CUSTO * 1.3
OUTPUT INSERTED.COD_PRODUTO, INSERTED.DESCRICAO, INSERTED.COD_TIPO,
       INSERTED.PRECO_VENDA / INSERTED.PRECO_CUSTO AS FATOR
WHERE COD_TIPO = 2;

COMMIT
GO

-- 4. Alterar o campo IPI de todos os produtos com
--    COD_TIPO = 3 para 5%
-- Utilize transacao e a clausula OUTPUT para conferir o resultado
-- Resposta:
BEGIN TRAN

UPDATE TB_PRODUTO SET IPI = 5
OUTPUT INSERTED.COD_PRODUTO, inserted.COD_TIPO,
       DELETED.IPI AS IPI_ANTIGO, INSERTED.IPI AS IPI_NOVO
WHERE COD_TIPO = 3;

COMMIT
GO

-- 5. Reduzir em 10% (multiplicar QTD_MINIMA por 0.9) o campo
-- QTD_MINIMA de todos os produtos
-- Utilize transacao e a clausula OUTPUT para conferir o resultado
-- Resposta:
BEGIN TRAN

UPDATE TB_PRODUTO SET QTD_MINIMA *= 0.9
OUTPUT INSERTED.COD_PRODUTO, DELETED.QTD_MINIMA AS QTD_ANTIGA,
       INSERTED.QTD_MINIMA AS QTD_NOVA;

COMMIT
GO

-- 6. Alterar os seguintes campos do cliente de codigo 11
-- Utilize transacao e a clausula OUTPUT para conferir o resultado
/*
	ENDERECO: AV. CELSO GARCIA, 1234
	BAIRRO:   TATUAPE
	CIDADE:   SAO PAULO
	ESTADO:   SP
	CEP   :   03407080
*/
-- Resposta:
BEGIN TRAN

UPDATE TB_CLIENTE
SET	ENDERECO = 'AV. CELSO GARCIA, 1234',
	BAIRRO =   'TATUAPE',
	CIDADE =   'SAO PAULO',
	ESTADO =   'SP' ,
	CEP    =   '03407080'
OUTPUT INSERTED.*
WHERE CODCLI = 11;

COMMIT
GO

-- 7. Copiar ENDERECO, BAIRRO, CIDADE, ESTADO e CEP do
-- cliente codigo 13 para os campos
--  END_COB, BAI_COB, CID_COB, EST_COB e CEP_COB (do mesmo cliente)
-- Utilize transacao e a clausula OUTPUT para conferir o resultado
-- Resposta:
BEGIN TRAN

UPDATE TB_CLIENTE
SET	END_COB = ENDERECO,
	BAI_COB = BAIRRO  ,
	CID_COB = CIDADE  ,
	EST_COB = ESTADO  ,
	CEP_COB = CEP
OUTPUT INSERTED.*
WHERE CODCLI = 13;

COMMIT
GO

-- 8. Alterar o campo ICMS para 12 da tabela TB_CLIENTE para os clientes dos
--    estados RJ, RO, AC, RR, MG, PR, SC, RS, MS, MT
-- Utilize transacao e a clausula OUTPUT para conferir o resultado
-- Resposta:
BEGIN TRAN

UPDATE TB_CLIENTE SET ICMS = 12
OUTPUT INSERTED.*
WHERE ESTADO IN ('RJ', 'RO', 'AC', 'RR', 'MG', 'PR', 'SC', 'RS', 'MS', 'MT');

COMMIT
GO

-- 9. Alterar o campos ICMS para 18 de todos os clientes de SP
-- Utilize transacao e a clausula OUTPUT para conferir o resultado
-- Resposta:
BEGIN TRAN

UPDATE TB_CLIENTE SET ICMS = 18
OUTPUT INSERTED.*
WHERE ESTADO = 'SP';

COMMIT
GO

-- 10. Alterar o campo ICMS para 7 da tabela TB_CLIENTE para clientes que
-- NAO SEJAM dos estados RJ, RO, AC, RR, MG, PR, SC, RS, MS, MT, SP
-- Utilize transacao e a clausula OUTPUT para conferir o resultado
-- Resposta:
BEGIN TRAN

UPDATE TB_CLIENTE SET ICMS = 7
OUTPUT INSERTED.*
WHERE ESTADO NOT IN ('RJ', 'RO', 'AC', 'RR', 'MG', 'PR', 'SC',
                     'RS', 'MS', 'MT', 'SP');

SELECT * FROM TB_CLIENTE

WHERE ESTADO NOT IN ('RJ', 'RO', 'AC', 'RR', 'MG', 'PR', 'SC',
                     'RS', 'MS', 'MT', 'SP');

COMMIT
GO

-- 11. Alterar para 7 o campo DESCONTO da tabela TB_ITENSPEDIDO,
-- mas somente dos itens do produto com ID_PRODUTO = 8 com
-- data de entrega em janeiro de 2014 e com
-- QUANTIDADE acima de 1000.
-- Utilize transacao e a clausula OUTPUT para conferir o resultado
-- Resposta:
BEGIN TRAN

UPDATE TB_ITENSPEDIDO SET DESCONTO = 7
OUTPUT INSERTED.*
WHERE ID_PRODUTO = 8 AND
      DATA_ENTREGA BETWEEN '2014.1.1' AND '2014.1.31' AND
      QUANTIDADE > 1000;

COMMIT
GO

-- 12. Zerar o campo DESCONTO de todos os itens de pedido
-- com quantidade abaixo de 1000, com data de entrega
-- posterior a 1-Junho-2014 e que tenham desconto acima de zero.
-- Utilize transacao e a clausula OUTPUT para conferir o resultado
-- Resposta:
BEGIN TRAN

UPDATE TB_ITENSPEDIDO SET DESCONTO = 0
OUTPUT INSERTED.*
WHERE DATA_ENTREGA > '2014.6.1' AND QUANTIDADE < 1000 AND
      DESCONTO > 0;

COMMIT
GO

-- 13. Usando SELECT INTO gere uma c�pia da tabela VENDEDORES
SELECT * INTO VENDEDORES_TMP FROM TB_VENDEDOR;
GO

-- 14. Exclua de VENDEDORES_TMP os registros com CODVEN acima de 5
-- Utilize transacao e a clausula OUTPUT para conferir o resultado
-- Resposta:
BEGIN TRAN

DELETE FROM VENDEDORES_TMP
OUTPUT DELETED.*
WHERE CODVEN > 5;

COMMIT
GO

-- 15. Utilizando o comando SELECT...INTO, fa�a uma copia da tabela TB_PEDIDO
--     chamada COPIA_PEDIDOS
-- Resposta:
SELECT * INTO COPIA_PEDIDOS FROM TB_PEDIDO;
GO

-- 16. Exclua os registros da tabela COPIA_PEDIDOS que sejam  do vendedor codigo 2
-- Utilize transacao e a clausula OUTPUT para conferir o resultado
-- Resposta:
BEGIN TRAN

DELETE FROM COPIA_PEDIDOS
OUTPUT DELETED.*
WHERE CODVEN = 2;

COMMIT
GO

-- 17. Exclua os registros da tabela COPIA_PEDIDOS que sejam
-- do primeiro semestre de 2014
-- Utilize transacao e a clausula OUTPUT para conferir o resultado
-- Resposta:
BEGIN TRAN

DELETE FROM COPIA_PEDIDOS
OUTPUT DELETED.*
WHERE DATA_EMISSAO BETWEEN '2014.1.1' AND '2014.6.30';

COMMIT
GO

-- 18. Exclua todos os registros restantes da tabela COPIA_PEDIDOS
-- Resposta:
DELETE FROM COPIA_PEDIDOS;
GO

-- 19. Exclua a tabela COPIA_PEDIDOS do banco de dados
-- Resposta:
DROP TABLE COPIA_PEDIDOS;
GO