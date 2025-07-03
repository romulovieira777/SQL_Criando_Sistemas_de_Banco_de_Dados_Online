IF OBJECT_ID('dbo.tblFuncionarios', 'U') IS NOT NULL
    DROP TABLE dbo.tblFuncionarios;
GO

CREATE TABLE tblFuncionarios (
    Matricula INT NOT NULL PRIMARY KEY,
    NomeFuncionario VARCHAR(50) NOT NULL,
    Admissao DATE,
    Salario MONEY
);
GO
