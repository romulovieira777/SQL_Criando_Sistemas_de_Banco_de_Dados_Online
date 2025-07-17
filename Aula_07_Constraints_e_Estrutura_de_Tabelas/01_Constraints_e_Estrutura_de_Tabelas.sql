/*
    Criando um Banco de Dados
    Autor: Romulo Vieira
    Data: 2025-07-17
*/

-- Escolhendo o banco de dados
USE Concessionaria;
GO

-- Criando uma tabela de Estoque
CREATE TABLE tblEstoque (
    idEstoque INT IDENTITY
  , CONSTRAINT PK_tblEstoque_idEstoque PRIMARY KEY (idEstoque)
  , idModelo INT NOT NULL
  , CONSTRAINT FK_tblEstoque_tblModelos FOREIGN KEY (idModelo) REFERENCES tblModelos(idModelo)
  , dataEntrada DATE DEFAULT GETDATE()
  , precoEstoque MONEY NOT NULL
  , CONSTRAINT CK_tblEstoque_precoEstoque CHECK (precoEstoque >= 10000 AND precoEstoque <= 200000)
);
GO

-- Adiconando uma nova coluna na tabela de Estoque
ALTER TABLE tblEstoque
ADD
    placa NCHAR(8) NOT NULL;
GO

-- Alterando o tamanho de uma coluna existente
ALTER TABLE tblEstoque
ALTER COLUMN placa NCHAR(7) NULL;
GO

-- Verificando as colunas modificadas da tabela de Estoque
EXEC sp_help 'tblEstoque';
GO

-- Excluindo a coluna placa da tabela de Estoque
ALTER TABLE tblEstoque
DROP COLUMN placa;
GO
