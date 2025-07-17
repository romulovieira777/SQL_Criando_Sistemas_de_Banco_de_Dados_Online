/*
    Script de criação de bancos de dados, tabelas e exemplos de uso de constraints (PRIMARY KEY, UNIQUE, CHECK, DEFAULT, FOREIGN KEY) no SQL Server.
    Inclui exemplos de criação e teste de restrições, além de demonstrações de comandos ALTER TABLE para adicionar constraints.
    Autor: Romulo Vieira
    Data: 2025-07-17
*/

-- Criacao de banco de dados SALA_DE_AULA
CREATE DATABASE SALA_DE_AULA;
GO

-- Colocar banco SALA_DE_AULA em uso
USE SALA_DE_AULA
GO

--Criacao da tabela TB_ALUNO
CREATE TABLE TB_ALUNO (
    COD_ALUNO			INT
  , NOME				VARCHAR(30)
  , DATA_NASCIMENTO		DATETIME
  , IDADE				TINYINT
  , E_MAIL				VARCHAR(50)
  , FONE_RES			CHAR(9)
  , FONE_COM			CHAR(9)
  , FAX					CHAR(9)
  , CELULAR				CHAR(9)
  , PROFISSAO			VARCHAR(40)
  , EMPRESA				VARCHAR(50)
);
GO

-- Deletar a tabela TB_ALUNO caso ela ja exista
DROP TABLE TB_ALUNO;
GO

-- Criacao da tabela TB_ALUNO
CREATE TABLE TB_ALUNO (
    NUM_ALUNO           INT IDENTITY
  , NOME                VARCHAR(30)
  , DATA_NASCIMENTO     DATETIME
  , IDADE               TINYINT
  , E_MAIL              VARCHAR(50)
  , FONE_RES            CHAR(8)
  , FONE_COM            CHAR(8)
  , FAX                 CHAR(8)
  , CELULAR             CHAR(9)
  , PROFISSAO           VARCHAR(40)
  , EMPRESA             VARCHAR(50)
);
GO

-- Deletar a tabela TB_ALUNO caso ela ja exista
DROP TABLE TB_ALUNO;
GO

-- Criacao da tabela TB_ALUNO
CREATE TABLE TB_ALUNO
(   CODIGO          INT             NOT NULL
  , NOME            VARCHAR(30)     NOT NULL
  , E_MAIL          VARCHAR(100)    NULL
);
GO

/*
CONSTRAINTS -> Validacoes, Restricoes, Consistencia
               de dados. As constraints permitem
               validar os dados que sao gravados nas
               tabelas do banco de dados.

Existem 5 tipos de constraints:

   Chave Primaria (PRIMARY KEY):
      Indica o(s) campo(s) que identifica(m) uma linha 
      da tabela. Impede tambem a duplicacao do campo.
       
   Chave Unica (UNIQUE): 
      Impede a duplicacao de outro campo alem da
      chave primaria.

   Condicao de validade (CHECK):
      Testa uma condicao toda vez que formos gravar
      dados em uma tabela. Se a condicao for FALSA,
      os dados nao serao gravados.

   Valor padrao (DEFAULT):
      Indica o valor que deve ser gravado em um campo
      quando um INSERT nao fornecer valor para ele.

   Chave Estrangeira (FOREIGN KEY):
      Relaciona 2 tabelas de um banco de dados impedindo
      que seja gravado um registro na tabela detalhe
      sem que exista um registro correspondente na tabela 
      mestre.
*/

--1. Primeiramente, crie o banco de dados TESTE_CONSTRAINT:
CREATE DATABASE TESTE_CONSTRAINT;
GO

--1.1. Coloque o banco TESTE_CONSTRAINT em uso:
USE TESTE_CONSTRAINT;
GO

--2. Agora, crie a tabela TB_TIPO_PRODUTO com os tipos (categorias) de produto:

-- Criando tabela de tipos (categorias) de produto
CREATE TABLE TB_TIPO_PRODUTO (
    COD_TIPO			INT IDENTITY NOT NULL
  , TIPO				VARCHAR(30) NOT NULL
  -- Convencao de nome: PK_NomeTabela
  , CONSTRAINT PK_TB_TIPO_PRODUTO PRIMARY KEY (COD_TIPO)
  -- Convencao De nome: UQ_NomeTabela_NomeCampo
  , CONSTRAINT UQ_TB_TIPO_PRODUTO_TIPO UNIQUE( TIPO )
);
GO

--3. Em seguida, teste a constraint UNIQUE criada:

-- Testando a constraint UNIQUE

-- Insere os tipos de produto
INSERT TB_TIPO_PRODUTO VALUES ('MOUSE');
INSERT TB_TIPO_PRODUTO VALUES ('PEN-DRIVE');
INSERT TB_TIPO_PRODUTO VALUES ('HARD DISK');

-- Ao tentar inserir o SQL gera um erro de violacao de
-- CONSTRAINT UNIQUE

INSERT TB_TIPO_PRODUTO VALUES ('HARD DISK');
GO
--4. O proximo passo eh criar a tabela de produtos (TB_PRODUTO):

GO
-- Criando a tabela de TB_PRODUTO
CREATE TABLE TB_PRODUTO (
    ID_PRODUTO			INT IDENTITY NOT NULL
  , DESCRICAO			VARCHAR(50)
  , COD_TIPO			INT
  , PRECO_CUSTO			NUMERIC(10,2)
  , PRECO_VENDA			NUMERIC(10,2)
  , QTD_REAL			NUMERIC(10,2)
  , QTD_MINIMA			NUMERIC(10,2)
  , DATA_CADASTRO		DATETIME DEFAULT GETDATE()
  , SN_ATIVO			CHAR(1) DEFAULT 'S'
  , CONSTRAINT PK_TB_PRODUTO PRIMARY KEY( ID_PRODUTO )
  , CONSTRAINT UQ_TB_PRODUTO_DESCRICAO UNIQUE( DESCRICAO )
  , CONSTRAINT CK_TB_PRODUTO_PRECOS CHECK( PRECO_VENDA >= PRECO_CUSTO )
  , CONSTRAINT CK_TB_PRODUTO_DATA_CAD CHECK( DATA_CADASTRO <= GETDATE() )
  , CONSTRAINT CK_TB_PRODUTO_SN_ATIVO CHECK( SN_ATIVO IN ('N','S') )
  -- Convencao de nome: FK_TabelaDetalhe_TabelaMestre
  , CONSTRAINT FK_TB_PRODUTO_TIPO_PRODUTO FOREIGN KEY (COD_TIPO) REFERENCES TB_TIPO_PRODUTO (COD_TIPO)
);
GO

--6. Feito isso, teste a constraint DEFAULT criada anteriormente. A sequencia de código adiante gera os valores para os campos DATA_CADASTRO e SN_ATIVO que não foram mencionados no INSERT:

-- Inserindo um produto sem informar os campos DATA_CADASTRO e SN_ATIVO
INSERT TB_PRODUTO 
(DESCRICAO, COD_TIPO, PRECO_CUSTO, PRECO_VENDA,
 QTD_REAL, QTD_MINIMA)
VALUES ('TESTANDO INCLUSAO', 1, 10, 12, 10, 5 );
GO

-- Verificando os dados inseridos
SELECT
    *
FROM
    TB_PRODUTO;

--7. No codigo seguinte, teste a constraint UNIQUE:

-- Gera erro pois viola a CONSTRAINT UNIQUE
INSERT TB_PRODUTO 
(DESCRICAO, COD_TIPO, PRECO_CUSTO, PRECO_VENDA,
 QTD_REAL, QTD_MINIMA)
VALUES ('TESTANDO INCLUSAO', 10, 10, 12, 10, 5 );
GO

--8. No proximo codigo, teste a constraint FOREIGN KEY:

-- Gera um erro pois viola a CONSTRAINT FOREIGN KEY
INSERT TB_PRODUTO 
(DESCRICAO, COD_TIPO, PRECO_CUSTO, PRECO_VENDA,
 QTD_REAL, QTD_MINIMA)
VALUES ('TESTANDO INCLUSAO 2', 10, 10, 12, 10, 5 );
GO

---9. Por fim, o codigo adiante testa a constraint CHECK:

-- Gera um erro pois viola a constraint CHECK 
-- (CK_PRODUTO_PRECOS)
INSERT TB_PRODUTO 
(DESCRICAO, COD_TIPO, PRECO_CUSTO, PRECO_VENDA,
 QTD_REAL, QTD_MINIMA)
VALUES ('TESTANDO INCLUSAO 2', 1, 14, 12, 10, 5 );
GO

---1.6.3.2.	Criando constraints com ALTER TABLE

-- Colocando o banco TESTE_CONSTRAINT em uso
USE TESTE_CONSTRAINT;
GO

-- Deletando as tabelas caso elas ja existam
DROP TABLE TB_PRODUTO
GO

-- Deletando a tabela TB_TIPO_PRODUTO caso ela ja exista
DROP TABLE TB_TIPO_PRODUTO
GO

-- Criacao da tabela TIPO_PRODUTO
CREATE TABLE TB_TIPO_PRODUTO (
    COD_TIPO			INT IDENTITY NOT NULL
  , TIPO				VARCHAR(30) NOT NULL
);
GO

-- Criando as constraints com ALTER TABLE
ALTER TABLE TB_TIPO_PRODUTO ADD
    CONSTRAINT PK_TIPO_PRODUTO PRIMARY KEY (COD_TIPO);

ALTER TABLE TB_TIPO_PRODUTO ADD
    CONSTRAINT UQ_TIPO_PRODUTO_TIPO UNIQUE( TIPO ); 
GO

-- Criando a tabela TB_PRODUTO
CREATE TABLE TB_PRODUTO (
    ID_PRODUTO      INT IDENTITY NOT NULL
  , DESCRICAO       VARCHAR(50)
  , COD_TIPO        INT
  , PRECO_CUSTO     NUMERIC(10,2)
  , PRECO_VENDA     NUMERIC(10,2)
  , QTD_REAL        NUMERIC(10,2)
  , QTD_MINIMA      NUMERIC(10,2)
  , DATA_CADASTRO   DATETIME
  , SN_ATIVO        CHAR(1)
);
GO

-- Criando as constraints com ALTER TABLE
ALTER TABLE TB_PRODUTO ADD
    CONSTRAINT PK_TB_PRODUTO PRIMARY KEY( ID_PRODUTO );

ALTER TABLE TB_PRODUTO ADD
    CONSTRAINT UQ_TB_PRODUTO_DESCRICAO UNIQUE( DESCRICAO );
GO

-- Criando varias constraints em um unico ALTER TABLE
ALTER TABLE TB_PRODUTO ADD    
    CONSTRAINT CK_TB_PRODUTO_PRECOS 
               CHECK( PRECO_VENDA >= PRECO_CUSTO )
  , CONSTRAINT CK_TB_PRODUTO_DATA_CAD
               CHECK( DATA_CADASTRO <= GETDATE() )
  , CONSTRAINT CK_TB_PRODUTO_SN_ATIVO
               CHECK( SN_ATIVO IN ('N','S') )
  , CONSTRAINT FK_TB_PRODUTO_TIPO_PRODUTO
               FOREIGN KEY (COD_TIPO)
               REFERENCES TB_TIPO_PRODUTO (COD_TIPO)
  , CONSTRAINT DF_TB_PRODUTO_SN_ATIVO DEFAULT ('S') FOR SN_ATIVO
  , CONSTRAINT DF_TB_PRODUTO_DATA_CADASTRO DEFAULT (GETDATE()) FOR DATA_CADASTRO;
GO

---1.6.3.3.	Criando constraints graficamente

-- Colocando o banco TESTE_CONSTRAINT em uso
USE TESTE_CONSTRAINT;
GO

-- Deletando as tabelas caso elas ja existam
DROP TABLE TB_PRODUTO 
GO

-- Deletando a tabela TB_TIPO_PRODUTO caso ela ja exista
DROP TABLE TB_TIPO_PRODUTO
GO

-- Criacao da tabela TIPO_PRODUTO
CREATE TABLE TB_TIPO_PRODUTO
(   COD_TIPO    INT IDENTITY NOT NULL
  , TIPO        VARCHAR(30) NOT NULL
);
GO

-- Criando a tabela PRODUTO
CREATE TABLE TB_PRODUTOS (
    ID_PRODUTO      INT IDENTITY NOT NULL
  , DESCRICAO       VARCHAR(50)
  , COD_TIPO        INT
  , PRECO_CUSTO     NUMERIC(10,2)
  , PRECO_VENDA     NUMERIC(10,2)
  , QTD_REAL        NUMERIC(10,2)
  , QTD_MINIMA      NUMERIC(10,2)
  , DATA_CADASTRO   DATETIME
  , SN_ATIVO        CHAR(1)
);
GO
