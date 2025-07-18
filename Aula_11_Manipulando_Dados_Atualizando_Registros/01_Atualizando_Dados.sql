/*
    Script para atualizar e manipular dados em tabelas no SQL Server.
    Inclui exemplos de atualização, seleção e restrições de integridade.
    Autor: Romulo Vieira
    Data: 2025-07-18
*/

-- Escolha do banco de dados
USE SisDep;
GO

-- Bônus de R$ 100,00 para todos os funcionarios
UPDATE Funcionario
SET salario = salario + 100;
GO

-- Operador Composto
-- Reajuste de 10% para todos os funcionarios
UPDATE Funcionario
SET salario = salario * 0.1 + salario;
GO

UPDATE Funcionario
SET salario *= 1.1;
GO

-- Atualização de mais de uma coluna simultaneamente
-- Com aplicação de restrição de integridade
UPDATE Funcionario
SET Salario = Salario * 1.05,
    idCargo = 2
WHERE idMatricula = 1000;
GO
