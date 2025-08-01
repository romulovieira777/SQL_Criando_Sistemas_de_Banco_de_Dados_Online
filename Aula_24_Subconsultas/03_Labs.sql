/*
    Script demonstrando o uso de subconsultas (IN, NOT IN), JOINs, seleção condicional,
    comparação com valores agregados (MAX, MIN), e manipulação de dados relacionados entre tabelas.
    Exemplos incluem consultas para identificar registros sem correspondência em outras tabelas,
    filtragem por condições específicas e seleção de registros com valores extremos.
    Autor: Romulo Vieira
    Data: 2025-08-01
*/

-- 1. Colocar em uso o banco de dados CURSOS_INFORMATICA, abrir e executar 
-- os comandos de insercao dos arquivos.
USE CURSOS_INFORMATICA;
GO

-- 2. Apresentar todas as salas de aula para as quais nao ha nenhum 
--    curso marcado
-- Com JOIN
SELECT
    S.* 
FROM
    CAD_SALAS AS S
LEFT JOIN
    MOV_CURSOS AS C
ON
    S.ID_SALA = C.ID_SALA
WHERE
    C.ID_SALA IS NULL;
GO

-- Com Sub-Query
SELECT
    *
FROM
    CAD_SALAS
WHERE
    ID_SALA NOT IN (SELECT ID_SALA FROM MOV_CURSOS);
GO

-- 3. Apresentar todos os treinamentos para os quais nao temos instrutor
-- Com JOIN
SELECT
    T.*
FROM
    CAD_TREINAMENTOS AS T
LEFT JOIN
    CAD_INSTRUTORES_TREINAMENTOS AS IT
ON
    T.ID_TREINAMENTO = IT.ID_TREINAMENTO
WHERE
    IT.ID_TREINAMENTO IS NULL;
GO

-- Com Sub-Query
SELECT
    *
FROM
    CAD_TREINAMENTOS
WHERE
    ID_TREINAMENTO NOT IN (SELECT ID_TREINAMENTO FROM CAD_INSTRUTORES_TREINAMENTOS);
GO

-- 4. Apresentar os alunos (CAD_PESSOAS) que nao tem e nem tiveram 
--    nenhum curso agendado 
-- Com JOIN
SELECT
    P.*
FROM
    CAD_PESSOAS AS P
LEFT JOIN
    MOV_CURSOS_ALUNOS AS CA
ON
    P.ID_PESSOA = CA.ID_PESSOA_ALUNO
WHERE
    CA.ID_PESSOA_ALUNO IS NULL AND P.SN_ALUNO = 'S';
GO

-- Com Sub-Query
SELECT
    *
FROM
    CAD_PESSOAS
WHERE
    ID_PESSOA NOT IN (SELECT ID_PESSOA_ALUNO FROM MOV_CURSOS_ALUNOS) AND SN_ALUNO = 'S';
GO

-- 5. Apresentar os departamentos onde nao existem funcion�rios cadastrados
-- Com JOIN
SELECT
    D.*
FROM
    CAD_DEPTOS D
LEFT JOIN
    CAD_FUNCIONARIOS AS F
ON
    D.ID_DEPTO = F.ID_DEPTO
WHERE
    F.ID_DEPTO IS NULL;
GO

-- Com Sub-Query
SELECT
    *
FROM
    CAD_DEPTOS
WHERE
    ID_DEPTO NOT IN (SELECT ID_DEPTO FROM CAD_FUNCIONARIOS);
GO

-- 6. Apresentar os cargos para os quais nao existem funcionarios cadastrados
-- Com JOIN
SELECT C.* 
FROM
    CAD_CARGOS AS C
LEFT JOIN
    CAD_FUNCIONARIOS AS F
ON
    C.ID_CARGO = F.ID_CARGO
WHERE
    F.ID_CARGO IS NULL;
GO

-- Com Sub-Query
SELECT
    *
FROM
    CAD_CARGOS
WHERE
    ID_CARGO NOT IN (SELECT ID_CARGO FROM CAD_FUNCIONARIOS);
GO

-- 7. Apresentar as pessoas que sejam de estados cujo ICMS seja menor que 7
-- Com JOIN
SELECT
    P.*
  , E.ESTADO
  , E.ICMS
FROM
    CAD_PESSOAS AS P
INNER JOIN
    CAD_MUNICIPIOS AS M
ON
    P.ID_MUNICIPIO = M.ID_MUNICIPIO
INNER JOIN
    CAD_ESTADOS AS E
ON
    M.ID_ESTADO = E.ID_ESTADO
WHERE
    E.ICMS < 7;
GO

-- Com Sub-Query
SELECT
    *
FROM
    CAD_PESSOAS
WHERE
    ID_MUNICIPIO IN (
        SELECT ID_MUNICIPIO FROM CAD_MUNICIPIOS WHERE ID_ESTADO IN (SELECT ID_ESTADO FROM CAD_ESTADOS WHERE ICMS < 7)
    );
GO

-- 8. Apresentar os dados do instrutor que possui o maior valor hora
-- Solucao 1
SELECT
    *
FROM
    CAD_PESSOAS
WHERE
    ID_PESSOA IN (
        SELECT ID_PESSOA_INSTR FROM CAD_INSTRUTORES_TREINAMENTOS
        WHERE VLR_HORA = (SELECT MAX(VLR_HORA) FROM CAD_INSTRUTORES_TREINAMENTOS)
);
GO

-- Solucao 2
SELECT TOP 1
    ID_PESSOA
  , NOME, (SELECT TOP 1 VLR_HORA FROM CAD_INSTRUTORES_TREINAMENTOS WHERE ID_PESSOA_INSTR = CAD_PESSOAS.ID_PESSOA
                 ORDER BY VLR_HORA DESC) AS VLR_HORA
FROM
    CAD_PESSOAS
WHERE
    SN_INSTRUTOR = 'S'
ORDER BY
    3 DESC;
GO

-- Solucao 3
SELECT TOP 1 WITH TIES P.*, I.VLR_HORA
FROM
    CAD_PESSOAS AS P
INNER JOIN
    CAD_INSTRUTORES_TREINAMENTOS AS I
ON
    P.ID_PESSOA = I.ID_PESSOA_INSTR
ORDER BY
    I.VLR_HORA DESC;
GO

-- 9. Apresentar os dados do instrutor que possui o MENOR valor hora
-- Solucao 1
SELECT
    *
FROM
    CAD_PESSOAS
WHERE
    ID_PESSOA IN (
        SELECT ID_PESSOA_INSTR FROM CAD_INSTRUTORES_TREINAMENTOS
        WHERE VLR_HORA = (SELECT MIN(VLR_HORA) FROM CAD_INSTRUTORES_TREINAMENTOS)
);
GO

-- Solucao 2
SELECT TOP 1
    ID_PESSOA
  , NOME
  , (SELECT TOP 1 VLR_HORA FROM CAD_INSTRUTORES_TREINAMENTOS WHERE ID_PESSOA_INSTR = CAD_PESSOAS.ID_PESSOA
                 ORDER BY VLR_HORA) AS VLR_HORA
FROM
    CAD_PESSOAS
WHERE
    SN_INSTRUTOR = 'S'
ORDER BY
    3;
GO

-- Solucao 3
SELECT
    TOP 1 WITH TIES P.*, I.VLR_HORA
FROM
    CAD_PESSOAS AS P
INNER JOIN
    CAD_INSTRUTORES_TREINAMENTOS AS I
ON
    P.ID_PESSOA = I.ID_PESSOA_INSTR
ORDER BY
    I.VLR_HORA;
GO