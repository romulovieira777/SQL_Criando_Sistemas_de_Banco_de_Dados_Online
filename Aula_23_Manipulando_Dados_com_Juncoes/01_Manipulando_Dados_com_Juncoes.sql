/*
    Script para demonstrar o uso de junções (INNER, LEFT, FULL JOIN), cruzamento cartesiano (CROSS JOIN),
    seleção de dados relacionados, atualização e remoção condicional de registros,
    além de exemplos de tratamento de valores nulos em consultas SQL.
    Autor: Romulo Vieira
    Data: 2025-07-29
*/

-- Selecionando um Banco de Dados Específico
USE SisDep;
GO

-- Junção Total (FULL JOIN) entre Funcionario e Dependente
BEGIN TRANSACTION
    UPDATE Funcionario
    SET Salario = Salario + 100
    FROM Funcionario AS f
    INNER JOIN Dependente AS d
    ON F.idMatricula = d.idMatricula

COMMIT;
GO

-- Selecionando Funcionarios sem Dependentes
SELECT
    F.NomeFuncionario
  , D.NomeDependente
FROM
    Funcionario AS F
LEFT JOIN
    Dependente AS D
ON
    F.idMatricula = D.idMatricula
AND
    D.NomeDependente IS NULL;
GO

-- Selecionando Funcionarios sem Dependentes e Atualizando Salario
-- Aumentando o salário dos funcionários que não possuem dependentes em 10%
BEGIN TRANSACTION
    UPDATE Funcionario
    SET Salario = Salario * 1.1
    FROM Funcionario AS f
    LEFT JOIN Dependente AS d
    ON F.idMatricula = d.idMatricula
    WHERE d.NomeDependente IS NULL;
COMMIT;
GO

-- Removendo Funcionarios do Departamento SAC
BEGIN TRANSACTION
    DELETE Funcionario
    FROM Funcionario AS f
    INNER JOIN Depto AS d
    ON F.idDepartamento = d.idDepartamento
    WHERE d.NomeDepartamento = 'SAC' AND F. Salario > 1500;
COMMIT;
GO

-- Removendo Funcionarios sem Dependentes com Salario Acima de 4000
-- Excluindo funcionários que não possuem dependentes e têm salário superior a 4000
BEGIN TRANSACTION
    DELETE Funcionario
    FROM Funcionario AS f
    LEFT JOIN Dependente AS d
    ON F.idMatricula = d.idMatricula
    WHERE d.NomeDependente IS NULL
    AND F.Salario > 4000;
COMMIT;
GO