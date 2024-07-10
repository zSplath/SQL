CREATE DATABASE [dbDavi]
 ON  PRIMARY ( 
	 NAME = N'dbDavi', 
	 FILENAME = N'F:\SQL\DATA\ARQUIVO_DADOS\dbDavi.MDF', 
	 SIZE = 10MB, 
	 MAXSIZE = 100MB, 
	 FILEGROWTH = 10MB 
 )
 LOG ON ( 
	 NAME = N'dbVendasLOG', 
	 FILENAME = N'F:\SQL\DATA\LOG_TRANSACOES\dbDaviLOG.LDF', 
	 SIZE = 10MB, 
	 MAXSIZE = 100MB, 
	 FILEGROWTH = 10MB 
 );

-- DROP DATABASE dbDavi

CREATE TABLE Cliente (
	CPF char(11),
	Nome varchar(100),
	Rua varchar(100),
	Complemento varchar(100),
	Bairro varchar(100),
	Estado char(2),
	CEP char(8),
	DataNasc date,
	Idade smallint check (Idade >= 0),
	Sexo char(1) check (Sexo IN ('M', 'F')),
	LimiteDeCredito money,
	VolumeMinimo float,
	PrimeiraCompra bit
)

ALTER TABLE Cliente ALTER COLUMN CPF char(11) not null;

ALTER TABLE Cliente ADD CONSTRAINT PK_Cliente_CPF PRIMARY KEY (CPF);


CREATE TABLE Produtos (
	Codigo varchar(20) PRIMARY KEY,
	Nome varchar(50),
	Embalagem varchar(50),
	Tamanho varchar(50),
	Sabor varchar(50),
	Preco smallmoney,
)