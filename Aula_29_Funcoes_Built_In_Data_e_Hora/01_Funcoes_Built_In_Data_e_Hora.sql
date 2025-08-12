/*
    Script para demonstrar o uso de funções built-in de manipulação de datas e horas no SQL Server.
    Exemplos de GETDATE, DAY, MONTH, YEAR, EOMONTH, DATEFROMPARTS, DATEDIFF, DATEADD, DATENAME, SET LANGUAGE.
    Inclui consultas sobre a tabela Funcionario e manipulação direta de datas.
    Autor: Romulo Vieira
    Data: 2025-08-12
*/

-- Exemplo de uso de funções built-in de data e hora no SQL Server
SELECT GETDATE();
GO

-- Seleciona o banco de dados
USE SisDep;
GO

-- Consulta os dados da tabela Funcionario
SELECT
    NomeFuncionario
  , Admissao
  , DAY(Admissao) AS DiaAdmissao
  , MONTH(Admissao) AS MesAdmissao
  , YEAR(Admissao) AS AnoAdmissao
FROM
    Funcionario;
GO

-- Consulta os dados da tabela Funcionario
SELECT
    NomeFuncionario
  , Admissao
  , DAY(Admissao) AS DiaAdmissao
  , MONTH(Admissao) AS MesAdmissao
  , YEAR(Admissao) AS AnoAdmissao
FROM
    Funcionario
WHERE
    DAY(Admissao) <= 15 AND MONTH(Admissao) >= 7 AND YEAR(Admissao) IN (2000, 2003, 2005, 2008, 2010);
GO

-- Último dia do mês atual
SELECT EOMONTH(GETDATE(), 0);
GO

-- Último dia do próximo mês
SELECT EOMONTH(GETDATE(), 1);
GO

-- Data a partir de partes
SELECT DATEFROMPARTS(2017, 1, 10);
GO

-- Pegando a diferença em dias
SELECT
    DATEDIFF(DAY, '2023-01-01', GETDATE()) AS DiasDesde2023;
GO

-- Meses desde 2023
SELECT
    DATEDIFF(MONTH, '2023-01-01', GETDATE()) AS MesesDesde2023;
GO

-- Anos desde 2023
SELECT
    DATEDIFF(YEAR, '2023-01-01', GETDATE()) AS AnosDesde2023;
GO

-- Trimestres desde 2023
SELECT
    DATEDIFF(QUARTER, '2023-01-01', GETDATE()) AS TrimestresDesde2023;
GO

-- Semanas desde 2023
SELECT
    DATEDIFF(WEEK, '2023-01-01', GETDATE()) AS SemanasDesde2023;
GO

-- Adicionando dias à data atual
SELECT
    DATEADD(DAY, 65, GETDATE());
GO

-- Adicionando meses à data atual
SELECT
    DATEADD(MONTH, 65, GETDATE());
GO

-- Adicionando anos à data atual
SELECT
    DATEADD(YEAR, 65, GETDATE());
GO

-- Adicionando trimestres à data atual
SELECT
    DATEADD(QUARTER, 65, GETDATE());
GO

-- Adicionando semanas à data atual
SELECT
    DATEADD(WEEK, 65, GETDATE());
GO

-- Formatando a data atual
SELECT
    NomeFuncionario
  , Admissao
  , DATENAME(week, Admissao)  AS DiadaSemana
  , DATENAME(MONTH, Admissao) AS MesAdmissao
FROM
    Funcionario;
GO

-- Definindo o idioma para português brasileiro
SET LANGUAGE 'BRAZILIAN';
GO