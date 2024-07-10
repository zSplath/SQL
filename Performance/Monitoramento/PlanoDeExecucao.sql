CREATE TABLE dbo.Nums( n INT NOT NULL PRIMARY KEY);

DECLARE @max AS INT, @rc AS INT; 
SET @max = 30000000; 
SET @rc = 1; 

INSERT INTO Nums VALUES( 1); 

WHILE @rc * 2 < = @max 
BEGIN 
	INSERT INTO dbo.Nums SELECT n + @rc FROM dbo.Nums; 
	SET @rc = @rc * 2; 
END 

SELECT * INTO NumsLinha FROM Nums;

-- Plano sem index
SELECT * FROM NumsLinha WHERE n = '10001';

-- Plano com index
SELECT * FROM Nums WHERE n = '10001';