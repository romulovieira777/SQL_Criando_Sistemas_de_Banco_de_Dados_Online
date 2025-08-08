/*
    Script para demonstrar o uso de funções built-in de manipulação de strings no SQL Server.
    Exemplos de LEN, LEFT, RIGHT, REPLACE, CHARINDEX, SUBSTRING, RTRIM, LTRIM, UPPER, LOWER, REPLICATE, REVERSE, CONCAT.
    Inclui consultas sobre a tabela Funcionario e manipulação direta de literais.
    Autor: Romulo Vieira
    Data: 2025-08-08
*/

-- Seleciona o banco de dados SisDep
USE SisDep;
GO

-- Seleciona todos os dados da tabela Funcionario
SELECT
    NomeFuncionario
  , LEN(NomeFuncionario)  AS TamanhoNome
  , idMatricula
  , LEFT(idMatricula, 2)  AS Esquerda
  , RIGHT(idMatricula, 1) AS Direita
FROM
    Funcionario;
GO

-- Seleciona todos os dados da tabela Funcionario
SELECT
    NomeFuncionario
  , LEN(NomeFuncionario)             AS TamanhoNome
  , idMatricula
  , LEFT(idMatricula, 2)             AS Esquerda
  , RIGHT(idMatricula, 1)            AS Direita
  , REPLACE(idMatricula, '10', '20') AS NomeFuncionarioFormatado
FROM
    Funcionario;
GO

-- Seleciona todos os dados da tabela Funcionario
SELECT
    NomeFuncionario
  , LEN(NomeFuncionario)                   AS TamanhoNome
  , idMatricula
  , LEFT(idMatricula, 2)                   AS Esquerda
  , RIGHT(idMatricula, 1)                  AS Direita
  , REPLACE(idMatricula, '10', '20')       AS idMatricula
  , CHARINDEX('silva', NomeFuncionario, 1) AS Posicao
FROM
    Funcionario;
GO

-- Seleciona todos os dados da tabela Funcionario
SELECT
    NomeFuncionario
  , LEN(NomeFuncionario)                   AS TamanhoNome
  , idMatricula
  , LEFT(idMatricula, 2)                   AS Esquerda
  , RIGHT(idMatricula, 1)                  AS Direita
  , REPLACE(idMatricula, '10', '20')       AS idMatricula
  , CHARINDEX('silva', NomeFuncionario, 1) AS Posicao
  , SUBSTRING(NomeFuncionario, 1, 10)      AS Substring
FROM
    Funcionario;
GO

-- Seleciona todos os dados da tabela Funcionario
SELECT
    NomeFuncionario
  , LEN(NomeFuncionario)                                                 AS TamanhoNome
  , idMatricula
  , LEFT(idMatricula, 2)                                                 AS Esquerda
  , RIGHT(idMatricula, 1)                                                AS Direita
  , REPLACE(idMatricula, '10', '20')                                     AS idMatricula
  , CHARINDEX('silva', NomeFuncionario, 1)                               AS Posicao
  , SUBSTRING(NomeFuncionario, 1, CHARINDEX(' ', NomeFuncionario, 1) -1) AS PrimeiroNome
FROM
    Funcionario;
GO

-- Remove espaços em branco à direita
SELECT
    RTRIM('Spider-Men     ');
GO

-- Remove espaços em branco à esquerda
SELECT
    LTRIM('     Spider-Men');
GO

-- Remove espaços em branco à direita
SELECT
    RTRIM('Spider-Men     ');
SELECT
    RTRIM(LTRIM('     Spider-Men       '));
GO

-- Converte o nome do funcionário para maiúsculas e minúsculas
SELECT
    UPPER(NomeFuncionario) AS NomeFuncionarioMaiusculo
  , LOWER(NomeFuncionario) AS NomeFuncionarioMinusculo
FROM
    Funcionario;
GO

-- Gera uma string de asteriscos
SELECT
    REPLICATE('*', 10) AS Asteriscos;
GO

-- Inverte a string
SELECT
    REVERSE('Funções Built-in Strings.sql');
GO

-- Extrai uma substring da string invertida
SELECT
    SUBSTRING(REVERSE('Funções Built-in Strings.sql'), 5, 255);
GO

-- Inverte a substring extraída
SELECT
    REVERSE(SUBSTRING(REVERSE('Funções Built-in Strings.sql'), 5, 255));
GO

-- Seleciona dados da tabela Funcionario
SELECT
    idMatricula
  , NomeFuncionario
  , CONCAT(idMatricula, idDepartamento, idCargo) AS IdentificacaoCompleta
  , idDepartamento
  , idCargo
FROM
    Funcionario;
GO

-- Seleciona dados da tabela Funcionario
SELECT
    idMatricula
  , NomeFuncionario
  , CONCAT(idMatricula, idDepartamento, idCargo) AS IdentificacaoCompleta
  , idDepartamento
  , idCargo
  , idMatricula + idDepartamento + idCargo AS IdentificacaoCompleta
FROM
    Funcionario;
GO