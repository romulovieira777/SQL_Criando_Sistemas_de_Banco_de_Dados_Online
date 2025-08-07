/*
    Script to demonstrate the use of aggregate functions (SUM, AVG, MAX, MIN, COUNT),
    data manipulation, conditional selection, and queries involving related tables.
    Author: Romulo Vieira
    Date: 2025-08-07
*/

-- Selecionando a base de dados
USE SisDep;
GO

-- Exibindo a soma dos salários dos funcionários
SELECT
    SUM(salario) AS TotalSalario
FROM
    Funcionario;
GO

-- Exibindo a média dos salários dos funcionários
-- A função AVG calcula a média dos valores de uma coluna
SELECT
    AVG(salario) AS MediaSalario
FROM
    Funcionario;
GO

-- Exibindo o maior e menor salário, além do total de funcionários
-- As funções MAX, MIN e COUNT são usadas para obter o maior salário, o menor salário
SELECT
    MAX(salario)   AS MaxSalario
  , MIN(salario)   AS MinSalario
  , COUNT(salario) AS TotalFuncionarios
FROM
    Funcionario;
GO

-- Selecionando a base de dados
USE SysConVendas;
GO

-- Exibindo a dados da tabela Dados
SELECT
    *
FROM
    Dados;
GO

-- Exibindo o total de vendedores
SELECT
    COUNT(Vendedor) AS TotalVendedores
FROM
    Dados;
GO

-- Exibindo o total de pedidos
-- A função COUNT conta o número de linhas que atendem a condição especificada
SELECT
    COUNT(pedido) AS TotalPedidos
FROM
    Dados;
GO

-- Exibindo o total
SELECT
    COUNT(*) AS Total
FROM
    Dados;
GO