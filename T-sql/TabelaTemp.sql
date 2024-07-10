USE SUCOS_VENDAS

-- Tabela temporária apenas nessa conexão

CREATE TABLE #TEMP (ID VARCHAR(10), NOME VARCHAR(50))

INSERT #TEMP VALUES (1 , 'Davi')

SELECT * FROM #TEMP

-- Tabela temporária global

CREATE TABLE ##TEMP (ID VARCHAR(10), NOME VARCHAR(50))

INSERT ##TEMP VALUES (1 , 'Davi')

SELECT * FROM ##TEMP

-- Tabela temporária de execução de script

DECLARE @TABELA_DE_NUMEROS TABLE ([NUMERO] INT, [STATUS] VARCHAR(20));

DECLARE @NUMERO_INICIAL_SEQUENCIA INT;

SET @NUMERO_INICIAL_SEQUENCIA = 1;
SET NOCOUNT ON

WHILE @NUMERO_INICIAL_SEQUENCIA <= 200
BEGIN
        IF ((SELECT COUNT(*) FROM [NOTAS FISCAIS] WHERE NUMERO = @NUMERO_INICIAL_SEQUENCIA) = 1)
             INSERT INTO @TABELA_DE_NUMEROS VALUES (@NUMERO_INICIAL_SEQUENCIA, 'NOTA FISCAL');
        ELSE
             INSERT INTO @TABELA_DE_NUMEROS VALUES (@NUMERO_INICIAL_SEQUENCIA, 'NÃO REGISTRADO');
        SET @NUMERO_INICIAL_SEQUENCIA += 1;
END;

SELECT * FROM @TABELA_DE_NUMEROS

-- Sequencia de Fibonacci

DECLARE @FIBONACCI TABLE (INDICE INT, VALOR INT)
DECLARE @NUM1 INT, @NUM2 INT, @ATUAL INT, @ULTIMO INT, @COUNTER INT;

SET @ULTIMO = 20;
SET @COUNTER = 3;

SET @NUM1 = 1;
SET @NUM2 = 1;

INSERT @FIBONACCI VALUES (0,0), (1,1), (2,1);
WHILE @COUNTER <= @ULTIMO
BEGIN
   SET @ATUAL = @NUM2 + @NUM1;
   INSERT @FIBONACCI VALUES (@COUNTER, @ATUAL)
   SET @NUM1 = @NUM2;
   SET @NUM2 = @ATUAL;
   SET @COUNTER += 1;
END;

SELECT * FROM @FIBONACCI