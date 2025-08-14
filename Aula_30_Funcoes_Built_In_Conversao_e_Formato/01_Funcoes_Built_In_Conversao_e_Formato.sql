/*
    Script para demonstrar o uso de funções built-in de conversão e formatação no SQL Server.
    Exemplos de CAST, CONVERT, FORMAT e manipulação de datas, números e moedas.
    Inclui consultas sobre a tabela Funcionario e exibição de diferentes formatos.
    Autor: Romulo Vieira
    Data: 2025-08-14
*/

-- Selecione a base de dados
USE SisDep;
GO

-- Consulta para obter informações dos funcionários
SELECT
    NomeFuncionario
  , Admissao
FROM
    Funcionario
GO

-- Exibe informações sobre a tabela Funcionario
EXEC sp_help Funcionario;
GO

-- Consulta para obter informações dos funcionários com data de admissão formatada
SELECT
    NomeFuncionario
    , CAST(Admissao AS DATE) AS DataAdmissao
FROM
    Funcionario;
GO

-- Consulta para obter a média de admissão dos funcionários
SELECT
    'Média de Admissão: ' + CAST(6.5 AS VARCHAR)
FROM
    Funcionario;
GO

-- Consulta para obter a data atual no formato desejado
SELECT
    NomeFuncionario
  , CONVERT(VARCHAR, Admissao, 1) AS [CÓDIGO 1]
  , CONVERT(VARCHAR, Admissao, 2) AS [CÓDIGO 2]
  , CONVERT(VARCHAR, Admissao, 3) AS [CÓDIGO 3]
  , CONVERT(VARCHAR, Admissao, 101) AS [CÓDIGO 101]
  , CONVERT(VARCHAR, Admissao, 102) AS [CÓDIGO 102]
  , CONVERT(VARCHAR, Admissao, 103) AS [CÓDIGO 103]
FROM
    Funcionario;
GO

-- Consulta para obter a data atual com diferentes formatos
SELECT
    NomeFuncionario
  , FORMAT(Salario, 'C', 'pt-BR') AS [SALÁRIO FORMATADO (PT)]
  , FORMAT(Salario, 'C', 'en-US') AS [SALÁRIO FORMATADO (EN)]
  , FORMAT(Admissao, 'd', 'pt-BR') AS [DATA FORMATADA (PT)]
  , FORMAT(Admissao, 'D', 'en-US') AS [DATA FORMATADA (EN)]
FROM
    Funcionario;
GO