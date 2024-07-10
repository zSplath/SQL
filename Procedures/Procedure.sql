USE SUCOS_VENDAS;

-- Procedure para atualizar idades dos clientes

CREATE PROCEDURE AtualizaIdade
AS
BEGIN
	UPDATE [TABELA DE CLIENTES] SET IDADE = (
		DATEDIFF(YEAR, [DATA DE NASCIMENTO], GETDATE()) - (
			CASE 
				WHEN MONTH([DATA DE NASCIMENTO]) > MONTH(GETDATE()) OR 
					(MONTH([DATA DE NASCIMENTO]) = MONTH(GETDATE()) AND DAY([DATA DE NASCIMENTO]) > DAY(GETDATE())) 
				THEN 1 
				ELSE 0 
			END
		)
	);
END

AtualizaIdade

SELECT * FROM [TABELA DE CLIENTES]

-- Formas de executar uma procedure

AtualizaIdade

dbo.AtualizaIdade

[dbo].[AtualizaIdade]

EXEC AtualizaIdade

EXEC dbo.AtualizaIdade

EXEC [dbo].[AtualizaIdade]

EXECUTE AtualizaIdade

EXECUTE dbo.AtualizaIdade

EXECUTE [dbo].[AtualizaIdade]

-- Procedure para buscar notas de um cliente entre datas (com valores default)

CREATE PROCEDURE NotasCliente @CPF VARCHAR(12) = '19290992743', @DATA_INICIAL DATETIME = '2015-01-01', @DATA_FINAL DATETIME = '2024-01-01'
AS
BEGIN
   SELECT * FROM [NOTAS FISCAIS] 
   WHERE CPF = @CPF AND 
   [DATA] >= @DATA_INICIAL AND 
   [DATA] <= @DATA_FINAL
END

NotasCliente

-- Formas de executar os parâmetros da procedure

NotasCliente
NotasCliente '1471156710'
NotasCliente '1471156710', '2016-01-01'
NotasCliente '1471156710', '2016-01-01', '2016-02-01'

NotasCliente @CPF='1471156710', @DATA_INICIAL='2016-01-01', @DATA_FINAL='2016-02-01'
NotasCliente @DATA_INICIAL='2016-01-01', @DATA_FINAL='2016-02-01', @CPF='1471156710'
NotasCliente @CPF='1471156710', @DATA_INICIAL=DEFAULT, @DATA_FINAL='2015-02-01'
NotasCliente '1471156710', DEFAULT, '2015-02-01'

-- Procedure que retorna quantidade de notas e o faturamento em um ano 
-- (Usando OUTPUT)

CREATE PROCEDURE NumeroFaturamento
@CPF VARCHAR(12), @ANO INT, @NUM INT OUTPUT, @FATURAMENTO FLOAT OUTPUT
AS
BEGIN
	SELECT @NUM = COUNT(*) FROM [NOTAS FISCAIS]
	WHERE CPF = @CPF AND YEAR([DATA]) = @ANO

	SELECT @FATURAMENTO = SUM(INF.QUANTIDADE * INF.[PREÇO])
	FROM [ITENS NOTAS FISCAIS] INF JOIN [NOTAS FISCAIS] NF
	ON INF.NUMERO = NF.NUMERO
	WHERE NF.CPF = @CPF AND YEAR(NF.[DATA]) = @ANO
END

DECLARE @NUM INT, @FATURAMENTO FLOAT;

EXEC NumeroFaturamento '19290992743', 2017, @NUM OUTPUT, @FATURAMENTO OUTPUT

SELECT @NUM, @FATURAMENTO

-- Procedure para mostrar faturamento por sabor entre duas datas classificando entre cítrica e não cítrica

CREATE PROCEDURE FaturamentoSabor @DATAINICIO DATE, @DATAFIM DATE
AS
BEGIN
	SELECT TP.[SABOR], SUM(INF.QUANTIDADE * INF.[PREÇO]) FATURAMENTO, (
		CASE 
			WHEN SABOR IN ('Açai','Cereja','Cereja/Maça','Maça','Manga','Maracujá','Melância')
			THEN 1
			ELSE 0
		END
	) CITRICA
	FROM [TABELA DE PRODUTOS] TP JOIN [ITENS NOTAS FISCAIS] INF
	ON TP.[CODIGO DO PRODUTO] = INF.[CODIGO DO PRODUTO] JOIN [NOTAS FISCAIS] NF
	ON NF.NUMERO = INF.NUMERO
	WHERE NF.DATA BETWEEN @DATAINICIO AND @DATAFIM
	GROUP BY TP.[SABOR]
END

FaturamentoSabor '2015-01-01', '2015-12-31'

-- Alterando Procedure

CREATE PROCEDURE DiaAmanha AS SELECT DAY(GETDATE())

DiaAmanha

ALTER PROCEDURE DiaAmanha AS SELECT DAY(DATEADD(DAY, 1, GETDATE()))

DiaAmanha

-- Excluindo Procedure

DROP PROCEDURE DiaAmanha

DROP PROCEDURE IF EXISTS DiaAmanha
