-- Trace importado do monitoramento do SQL Server Profiler

SELECT * FROM Trace

SELECT * FROM Trace WHERE 
	Duration >= 7000 and 
	DatabaseName = 'DB_VENDAS' and
	LoginName = 'Davi\Davi Cavalcanti'