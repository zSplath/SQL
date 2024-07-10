CREATE TABLE T_heap (
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
   insert into T_heap (a,b,c,d,e,f) values ([dbo].[NumeroAleatorio](1,100), [dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),[dbo].[NumeroAleatorio](1,100),@contador)
   set @contador = @contador + 1
END



CREATE NONCLUSTERED INDEX T_heap_a ON T_heap (a);

SELECT a FROM t_heap WHERE a = 1


CREATE INDEX T_heap_bc ON T_heap (b, c);

SELECT b FROM t_heap WHERE b = 1;
SELECT c FROM t_heap WHERE c = 1;

SELECT b, c FROM t_heap WHERE b = 1 and c = 1;
-- Sem usar index ('a' não incluído)
SELECT a FROM t_heap WHERE b = 1 and c = 1;


CREATE INDEX T_heap_d ON T_heap (d) INCLUDE (e);

SELECT d FROM t_heap WHERE d = 1;
SELECT d FROM t_heap WHERE e = 1;
SELECT e FROM t_heap WHERE d = 1;
SELECT e FROM t_heap WHERE e = 1;

CREATE INDEX T_heap_f ON T_heap (f);

-- Não usam index
SELECT a, f FROM t_heap WHERE a = 1 and f = 1;
SELECT a, f FROM t_heap WHERE a = 1;
SELECT f FROM t_heap WHERE a = 1;