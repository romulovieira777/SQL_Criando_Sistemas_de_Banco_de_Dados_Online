/*
    Script para demonstrar o uso de junções internas (INNER JOIN) entre tabelas,
    seleção de dados relacionados e exemplos de tratamento de valores nulos em consultas SQL.
    Autor: Romulo Vieira
    Data: 2025-07-29
*/

-- Selecionando um Banco de Dados Específico
USE SisDep;
GO

-- Selecionando Dados de Funcionários e Localidades com Junção Interna
-- A junção é feita entre a tabela Funcionario e Localidade usando o campo IdLocal
SELECT
    NomeFuncionario
  , Admissao
  , Salario
  , Uf
  , Cidade
FROM
    Funcionario
INNER JOIN
    Localidade
ON
    Funcionario.IdLocalidade = Localidade.IdLocalidade;
GO

-- Selecionando Todos os Funcionários
SELECT
    *
FROM
    Funcionario;
GO

-- Selecionando Todas as Localidades
SELECT
    *
FROM
    Localidade;
GO

-- Selecionando Dados de Funcionários, Localidades e Departamentos com Junção Interna
-- A junção é feita entre Funcionario, Localidade e Depto usando os campos IdLocalidade e IdDepartamento
-- Isso permite obter informações completas sobre os funcionários, suas localidades e departamentos
SELECT
    NomeFuncionario
  , Admissao
  , Salario
  , Uf
  , Cidade
FROM
    Funcionario
INNER JOIN
    Localidade
ON
    Funcionario.IdLocalidade = Localidade.IdLocalidade
INNER JOIN
    Depto
ON
    Depto.IdDepartamento = Funcionario.IdDepartamento;
GO

-- Selecionando Funcionários com Dependentes
-- A junção é feita entre Funcionario e Dependente usando o campo idMatricula
SELECT
    Funcionario.NomeFuncionario
  , Dependente.NascimentoDependente
FROM
    Funcionario
INNER JOIN
    Dependente
ON
    Dependente.idMatricula = Funcionario.idMatricula
ORDER BY
    Funcionario.NomeFuncionario;
GO

-- Selecionando Funcionários e Dependentes com Alias
-- A junção é feita entre Funcionario e Dependente usando o campo idMatricula
SELECT
    F.NomeFuncionario
  , D.NascimentoDependente
FROM
    Funcionario AS F
INNER JOIN
    Dependente AS D
ON
    D.idMatricula = F.idMatricula
ORDER BY
    F.NomeFuncionario;
GO