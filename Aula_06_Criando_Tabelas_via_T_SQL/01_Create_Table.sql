/*
    Criando um Banco de Dados
    Autor: Romulo Vieira
    Data: 2025-07-08
*/

-- Escolhendo o banco de dados
USE [Concessionaria];
GO

-- Criando a tabela de Marcas
CREATE TABLE [dbo].[tblMarcas] (
    [idMarca] INT IDENTITY(1,1) PRIMARY KEY NOT NULL
  , [nomeMarca] NCHAR(10) NOT NULL UNIQUE
);
GO

-- Visualizando a estrutura tabela de Marcas
EXEC sp_help 'tblMarcas';
GO

-- Criando a tabela de Modelos
CREATE TABLE [dbo].[tblModelos] (
    [idModelo] INT IDENTITY(1,1) NOT NULL
  , CONSTRAINT PK_tblModelos_idModelo PRIMARY KEY ([idModelo])
  , [idMarca] INT NOT NULL
  , CONSTRAINT FK_tblModelos_tblMarcas_idMarca FOREIGN KEY ([idMarca]) REFERENCES [dbo].[tblMarcas]([idMarca])
  , [nomeModelo] NCHAR(30) NOT NULL UNIQUE
  , CONSTRAINT UQ_tblModelos_nomeModelo UNIQUE ([nomeModelo])
);
GO

-- Visualizando a estrutura tabela de Modelos
EXEC sp_help 'tblModelos';