CREATE TABLE T_clu (
	a int NOT NULL, 
	b int NOT NULL, 
	c int NOT NULL, 
	d int NOT NULL, 
	e int NOT NULL, 
	f int NOT NULL
); 

declare @contador int
declare @max int
SET @contador = 1
SET @max = 50
WHILE @contador <= @max
BEGIN
   insert into T_clu (a,b,c,d,e,f) values (@contador, [dbo].[NumeroAleatorio](1,100), [dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100), @contador)
   set @contador = @contador + 1
END;

-- Criando Indice Clusterizado
CREATE UNIQUE CLUSTERED INDEX T_clu_a ON T_clu (a);

SELECT * FROM T_clu where b = 68 and c= 55;


-- Criando indice Não Clusterizado
CREATE INDEX T_clu_b ON T_clu (b, c); 

-- Usa o não clusterizado
SELECT b, c FROM T_clu where b = 50 and c = 50;

-- Usa o clusterizado
SELECT e FROM T_clu where b = 50 and c = 50;