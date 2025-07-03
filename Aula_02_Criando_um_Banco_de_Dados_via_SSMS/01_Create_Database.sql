IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'Concessionaria')
BEGIN
    CREATE DATABASE Concessionaria;
END
GO
