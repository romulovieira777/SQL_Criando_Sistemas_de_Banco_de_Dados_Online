/*
    Script para instalar e compactar o banco de dados Clientes.
    Autor: Romulo Vieira
    Data: 2025-07-24
*/
*/

-- Script para instalar o banco de dados Clientes e compactar os arquivos MDF e LDF
USE MASTER;
DROP DATABASE BDClientes;

		EXEC SP_ATTACH_DB
			@DBNAME ='Clientes',
			@FILENAME1 = 'C:\BANCOS\clientes.mdf',
			@FILENAME2 = 'C:\BANCOS\clientes_log.ldf';

SELECT 'BANCOS INSTALADOS e Compactados!!!' AS Confirmacão