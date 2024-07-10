SELECT * FROM Cliente
SELECT * FROM Produtos

SELECT Nome, DataNasc as [Data de Nascimento], Idade FROM Cliente order by DataNasc desc

SELECT DISTINCT Sabor FROM Produtos

SELECT Nome FROM Cliente WHERE PrimeiraCompra = 1

SELECT Nome, Preco FROM Produtos WHERE Preco <= 8 

SELECT Nome FROM Cliente WHERE Nome <= 'Davi' 

SELECT Nome, DataNasc as [Data de Nascimento], Idade FROM Cliente where year(DataNasc) > '1987' order by DataNasc asc

SELECT Nome, Estado FROM Cliente WHERE Estado = 'SP' OR Estado = 'RJ' order by Estado desc
SELECT Nome, Estado, PrimeiraCompra FROM Cliente WHERE Estado = 'SP' AND PrimeiraCompra = 1