USE SUCOS_VENDAS

DECLARE @MATRICULA1 VARCHAR(5)
DECLARE @NOME1 VARCHAR(100)
DECLARE @PERCENTUAL1 FLOAT
DECLARE @DATA1 DATE
DECLARE @FERIAS1 BIT
DECLARE @BAIRRO1 VARCHAR(50)

DECLARE @MATRICULA VARCHAR(5), @NOME VARCHAR(100), @PERCENTUAL FLOAT, @DATA DATE, @FERIAS BIT, @BAIRRO VARCHAR(50)

SET @MATRICULA = '12345'
SET @NOME = 'Davi'
SET @PERCENTUAL = 0.01
SET @DATA = '2002-12-11'
SET @FERIAS = 1 
SET @BAIRRO = 'ZO'

PRINT 'Matrícula: ' + @MATRICULA
PRINT 'Nome: ' + @NOME
PRINT CONCAT('Percentual: ', @PERCENTUAL)
PRINT CONCAT('Data: ', @DATA)
PRINT CONCAT('Férias: ', @FERIAS)
PRINT 'Bairro: ' + @BAIRRO
PRINT ''

SET @PERCENTUAL += @PERCENTUAL
PRINT CONCAT('Dobro Percentual: ', @PERCENTUAL)

SET @PERCENTUAL *= 2
PRINT CONCAT('Quádruplo Percentual: ', @PERCENTUAL)

PRINT ''
PRINT 
CONCAT('Idade: ', 
        DATEDIFF(YEAR, @DATA, GETDATE()) - 
        CASE 
            WHEN MONTH(@DATA) > MONTH(GETDATE()) OR 
                 (MONTH(@DATA) = MONTH(GETDATE()) AND DAY(@DATA) > DAY(GETDATE())) 
            THEN 1 
            ELSE 0 
        END
)

SELECT @NOME NOME, CONVERT(VARCHAR(10), @DATA, 103) [DATA DE NASCIMENTO]

INSERT [TABELA DE VENDEDORES] VALUES (@MATRICULA, @NOME, @PERCENTUAL, @DATA, @FERIAS, @BAIRRO)

SELECT * FROM [TABELA DE VENDEDORES]