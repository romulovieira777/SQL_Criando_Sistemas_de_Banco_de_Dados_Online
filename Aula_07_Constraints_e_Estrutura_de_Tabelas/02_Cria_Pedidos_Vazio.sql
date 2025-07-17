/*
    Script para criação do Banco de Dados Pedidos_Vazio e suas tabelas principais.
    Autor: Romulo Vieira
    Data: 2025-07-17

    Este script cria o banco de dados Pedidos_Vazio e define a estrutura das tabelas relacionadas a pedidos,
    clientes, fornecedores, produtos, empregados, dependentes, vendedores, departamentos, cargos, cores, unidades e tipos de produto.
    Cada tabela possui sua respectiva chave primária e campos necessários para o funcionamento do sistema.
*/

-- Criando o Banco de Dados Pedidos Vazio
CREATE DATABASE Pedidos_Vazio;
GO

-- Selecionando o Banco de Dados Pedidos Vazio
USE Pedidos_Vazio;
GO


CREATE TABLE [dbo].[TB_COR](
	[CODCOR] [smallint] NOT NULL
  , [COR] [varchar](15) NULL
  , CONSTRAINT PK_TB_COR PRIMARY KEY (CODCOR)
); 
GO

CREATE TABLE [dbo].[TB_DEPARTAMENTO](
	[COD_DEPTO] [int] IDENTITY(1,1) NOT NULL
, [DEPTO] [varchar](25) NOT NULL
, CONSTRAINT [PK_TB_DEPARTAMENTO] PRIMARY KEY (COD_DEPTO) 

);
GO

CREATE TABLE [dbo].[TB_CARGO](
	[COD_CARGO] [int] IDENTITY(1,1) NOT NULL
, [CARGO] [varchar](30) NOT NULL
, [SALARIO_INIC] [float] NULL
, CONSTRAINT [PK_TB_CARGO] PRIMARY KEY (COD_CARGO) 
);
GO

CREATE TABLE [dbo].[TB_PROD_FORN](
	[ID_PRODUTO] [int] NOT NULL
, [COD_FORNECEDOR] [int] NOT NULL
, CONSTRAINT [PK_PROD_FORN] 
 PRIMARY KEY ([ID_PRODUTO] ASC, [COD_FORNECEDOR] ASC)
);
GO

CREATE TABLE [dbo].[TB_CLIENTE](
	[CODCLI] [int] IDENTITY(1,1) NOT NULL
, [NOME] [varchar](50) NULL
, [FANTASIA] [varchar](20) NULL
, [ENDERECO] [varchar](60) NULL
, [BAIRRO] [varchar](20) NULL
, [CIDADE] [varchar](20) NULL
, [ESTADO] [varchar](2) NULL
, [CEP] [varchar](8) NULL
, [END_COB] [varchar](60) NULL
, [BAI_COB] [varchar](20) NULL
, [CID_COB] [varchar](20) NULL
, [EST_COB] [varchar](2) NULL
, [CEP_COB] [varchar](8) NULL
, [CGC] [varchar](18) NULL
, [INSCRICAO] [varchar](19) NULL
, [FONE1] [varchar](15) NULL
, [FAX] [varchar](15) NULL
, [E_MAIL] [varchar](35) NULL
, [DATA_CAD] [datetime] NULL
, [ICM] [float] NULL
, [SELECAO] [varchar](1) NULL
, [REVENDA_CONSUMIDOR] [char](1) NULL
, CONSTRAINT [PK_TB_CLIENTE] PRIMARY KEY ([CODCLI] ASC)
);
GO

CREATE TABLE [dbo].[TB_FORNECEDOR](
	[COD_FORNECEDOR] [int] IDENTITY(1,1) NOT NULL
, [NOME] [varchar](50) NULL
, [NOME_FANTASIA] [varchar](20) NULL
, [FISICA_JURIDICA] [char](1) NULL
, [COD_PAIS] [int] NULL
, [CPF] [varchar](20) NULL
, [CNPJ] [varchar](20) NULL
, [INSC_ESTADUAL] [varchar](15) NULL
, [ENDERECO] [varchar](50) NULL
, [CEP] [char](9) NULL
, [BAIRRO] [varchar](30) NULL
, [CIDADE] [varchar](30) NULL
, [ESTADO] [char](2) NULL
, [FONE1] [varchar](15) NULL
, [FONE2] [varchar](15) NULL
, [FAX] [varchar](15) NULL
, [E_MAIL] [varchar](100) NULL
, [WEB_SITE] [varchar](100) NULL
, [COD_COND_PAGTO] [int] NULL
, [COD_RAMO_ATIVIDADE] [int] NULL
, [LIMITE_CREDITO] [numeric](15, 2) NULL
, [PRAXO_MAX] [int] NULL
, [SN_ATIVO] [char](1) NULL
, CONSTRAINT [PK_TB_FORNECEDOR] PRIMARY KEY ([COD_FORNECEDOR] ASC)
);
GO

CREATE TABLE [dbo].[TB_UNIDADE](
	[COD_UNIDADE] [smallint] IDENTITY(1,1) NOT NULL
, [UNIDADE] [varchar](20) NULL
, CONSTRAINT [PK_TB_UNIDADE] PRIMARY KEY ([COD_UNIDADE] ASC)
);
GO

CREATE TABLE [dbo].[TB_TIPOPRODUTO](
	[COD_TIPO] [smallint] IDENTITY(1,1) NOT NULL
, [TIPO] [varchar](30) NULL
, CONSTRAINT [PK_TB_TIPOPRODUTO] PRIMARY KEY ([COD_TIPO] ASC)
);
GO

CREATE TABLE [dbo].[TB_VENDEDOR](
	[CODVEN] [smallint] IDENTITY(1,1) NOT NULL
, [NOME] [varchar](50) NULL
, [FANTASIA] [varchar](20) NULL
, [ENDERECO] [varchar](60) NULL
, [BAIRRO] [varchar](20) NULL
, [CIDADE] [varchar](20) NULL
, [ESTADO] [varchar](2) NULL
, [CEP] [varchar](8) NULL
, [CIC] [varchar](18) NULL
, [RG] [varchar](15) NULL
, [FONE] [varchar](15) NULL
, [FAX] [varchar](15) NULL
, [E_MAIL] [varchar](35) NULL
, [DATA_CAD] [datetime] NULL
, [DATA_NASC] [datetime] NULL
, [PORC_COMISSAO] [decimal](5, 2) NULL
, [SELECAO] [varchar](1) NULL
, CONSTRAINT [PK_TB_VENDEDOR] PRIMARY KEY ([CODVEN] ASC)
);
GO

CREATE TABLE [dbo].[TB_ITENSPEDIDO](
    [NUM_PEDIDO] [int] NOT NULL
  , [NUM_ITEM] [smallint] NOT NULL
  , [ID_PRODUTO] [int] NULL
  , [COD_PRODUTO] [varchar](13) NULL
  , [CODCOR] [smallint] NULL
  , [QUANTIDADE] [int] NULL
  , [PR_UNITARIO] [numeric](18, 4) NULL
  , [DATA_ENTREGA] [datetime] NULL
  , [SITUACAO] [varchar](1) NULL
  , [DESCONTO] [float] NULL
  , CONSTRAINT [PK_TB_ITENSPEDIDO] PRIMARY KEY (
    [NUM_PEDIDO] ASC
  , [NUM_ITEM] ASC
 )
);
GO

CREATE TABLE [dbo].[TB_Empregado](
    [CODFUN] [int] IDENTITY(1,1) NOT NULL
  , [NOME] [varchar](35) NOT NULL
  , [NUM_DEPEND] [smallint] NULL
  , [DATA_NASCIMENTO] [datetime] NULL
  , [COD_DEPTO] [int] NULL
  , [COD_CARGO] [int] NULL
  , [DATA_ADMISSAO] [datetime] NULL
  , [SALARIO] [numeric](18, 2) NULL
  , [SINDICALIZADO] [varchar](1) NULL
  , [OBS] [text] NULL
  , [FOTO] [image] NULL
  , CONSTRAINT [PK_TB_Empregado] PRIMARY KEY ([CODFUN] ASC)
);
GO

CREATE TABLE [dbo].[TB_Dependente](
    [CODFUN] [int] NOT NULL
  , [CODDEP] [smallint] NOT NULL
  , [NOME] [varchar](30) NOT NULL
  , [DATA_NASCIMENTO] [datetime] NULL
  , CONSTRAINT [PK_TB_Dependente] PRIMARY KEY 
    (
      [CODFUN] ASC
    , [CODDEP] ASC
    )
); 
GO

CREATE TABLE [dbo].[TB_PEDIDO](
    [NUM_PEDIDO] [int] IDENTITY(1,1) NOT NULL
  , [CODCLI] [int] NULL
  , [CODVEN] [smallint] NULL
  , [DATA_EMISSAO] [datetime] NULL
  , [VLR_TOTAL] [numeric](18, 2) NULL
  , [SITUACAO] [varchar](1) NULL
  , [OBSERVACOES] [text] NULL
  , [tipo_pedido] [char](1) NULL
  , CONSTRAINT [PK_tb_PEDIDO] PRIMARY KEY ([NUM_PEDIDO] ASC)
);
GO

CREATE TABLE [dbo].[tb_PRODUTO](
    [ID_PRODUTO] [int] IDENTITY(1,1) NOT NULL
  , [COD_PRODUTO] [varchar](13) NOT NULL
  , [DESCRICAO] [varchar](40) NULL
  , [COD_UNIDADE] [smallint] NULL
  , [COD_TIPO] [smallint] NULL
  , [PRECO_CUSTO] [numeric](18, 4) NULL
  , [PRECO_VENDA] [numeric](18, 4) NULL
  , [QTD_ESTIMADA] [int] NULL
  , [QTD_REAL] [int] NULL
  , [QTD_MINIMA] [int] NULL
  , [CLAS_FISC] [varchar](10) NULL
  , [IPI] [int] NULL
  , [PESO_LIQ] [numeric](18, 2) NULL
  , CONSTRAINT [PK_TB_PRODUTO] PRIMARY KEY ([ID_PRODUTO] ASC)
);
GO
