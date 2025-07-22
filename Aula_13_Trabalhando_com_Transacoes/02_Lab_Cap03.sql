/*
    Script para demonstrar o uso de transações no SQL Server.
    Inclui exemplos de criação de banco de dados, tabelas, inserção de dados,
    manipulação e seleção de dados, além de comandos de transação (BEGIN TRANSACTION, COMMIT, ROLLBACK).
    Autor: Romulo Vieira
    Data: 2025-07-22
*/

-- 1.	Criar um banco de dados chamado PEDIDOS_VENDA:
CREATE DATABASE PEDIDOS_VENDA;
GO

-- Colocar em uso o banco de dados PEDIDOS_VENDA:
USE PEDIDOS_VENDA;
GO

-- 2.	Criar tabela chamada TB_PRODUTO com os campos:
/*
	Codigo do produto		    inteiro, autonumeracao e chave primaria
	Nome do produto			    alfanumurico
	Codigo da unid. de medida	inteiro
	Codigo da categoria	 	    inteiro
	Quantidade em estoque		numerico
	Quantidade minima		    numerico
	Preco de custo			    numerico
	Preco de venda			    numerico
	Caracteristicas tecnicas	texto longo
	Fotografia			        binirio longo
*/

CREATE TABLE TB_PRODUTO (
	COD_PRODUTO		INT	IDENTITY	PRIMARY KEY
  , DESCRICAO		VARCHAR(50)
  , COD_UNIDADE		INT
  , COD_CATEGORIA	INT
  , QTD_ESTOQUE		NUMERIC(12,2)
  , QTD_MINIMA		NUMERIC(12,2)
  , PRECO_CUSTO		NUMERIC(12,2)
  , PRECO_VENDA		NUMERIC(12,2)
  , CARACTERISTICAS	VARCHAR(MAX)
  , FOTO			VARBINARY(MAX)
);
GO

-- 3.	Criar a tabela TB_UNIDADE para armazenar as unidades de medida:
/*
	Codigo da unidade		inteiro, autonumeracao e chave primaria
	Nome da unidade			alfanumerico
*/

CREATE TABLE TB_UNIDADE (
	COD_UNIDADE		INT	IDENTITY	PRIMARY KEY
  , UNIDADE			VARCHAR(30)
);
GO

-- 4. Inserir na tabela as seguintes unidades:
/*
PECAS, METROS, QUILOGRAMAS, DUZIAS, PACOTE, CAIXA
*/

INSERT INTO TB_UNIDADE (UNIDADE)
VALUES ('PECAS'), ('METROS'), ('QUILOGRAMAS'), ('DUZIAS'), ('PACOTE'), ('CAIXA');
GO

-- 5.	Criar a tabela TB_CATEGORIA para armazenar as categorias de produto:
/*
	Codigo da categoria		inteiro, autonumeracao e chave primaria
	Nome da categoria		alfanumerico
*/

CREATE TABLE TB_CATEGORIA (
    COD_CATEGORIA	INT	IDENTITY	PRIMARY KEY
  , CATEGORIA		VARCHAR(30)
);
GO

-- 6. Inserir na tabela as seguintes categorias:
/*
MOUSE, PEN-DRIVE, MONITOR DE VIDEO, TECLADO, CPU, CABO DE REDE
*/

INSERT INTO TB_CATEGORIA
VALUES ('MOUSE'), ('PEN-DRIVE'), ('MONITOR DE VIDEO'), ('TECLADO'), ('CPU'), ('CABO DE REDE');
GO

-- 7.Inserir os produtos a seguir utilizando a clausula OUTPUT:

INSERT INTO TB_PRODUTO
(DESCRICAO, COD_UNIDADE, COD_CATEGORIA, QTD_ESTOQUE, QTD_MINIMA, PRECO_CUSTO, PRECO_VENDA)
OUTPUT INSERTED.*
VALUES
    ('Caneta Azul'		, 	1 ,	1 ,	150	,40 	, 0.50	, 0.75)
  , ('Caneta Verde'		,	1 ,	1 ,	50	,40	, 0.50	, 0.75)
  , ('Caneta Vermelha'	,	1 ,	1 ,	80	,35	, 0.50	, 0.75)
  , ('Lapis'		,	1 ,	1 ,	400	,80	, 0.50	, 0.80)
  , ('Regua'		,	1 ,	1 ,	40	,10	, 1.00	, 1.50)GO