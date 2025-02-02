
-- CRIA BANCO DADOS

CREATE DATABASE [dbVendas]
 ON  PRIMARY ( 
	 NAME = N'dbVendas', 
	 FILENAME = N'F:\SQL\DATA\ARQUIVO_DADOS\dbVendas.MDF', 
	 SIZE = 100MB, 
	 MAXSIZE = 200MB, 
	 FILEGROWTH = 50MB 
 )
 LOG ON ( 
	 NAME = N'dbVendasLOG', 
	 FILENAME = N'F:\SQL\DATA\LOG_TRANSACOES\dbVendasLOG.LDF', 
	 SIZE = 100MB, 
	 MAXSIZE = 200MB, 
	 FILEGROWTH = 50MB 
 );

-- LIBERA MEMORIAS VAZIAS

DBCC SHRINKDATABASE ('dbVendas',TRUNCATEONLY);

-- BACKUP 

BACKUP DATABASE dbVendas TO DISK = 'F:\SQL\DATA\BACKUP\DBVENDAS.BAK';

BACKUP DATABASE dbVendas TO DISK = 'F:\SQL\DATA\BACKUP\DBVENDAS_2.BAK';

RESTORE HEADERONLY FROM DISK = 'F:\SQL\DATA\BACKUP\DBVENDAS_2.BAK';

USE MASTER
DROP DATABASE dbVendas
RESTORE DATABASE dbVendas FROM DISK = 'F:\SQL\DATA\BACKUP\DBVENDAS_2.BAK' WITH RECOVERY;