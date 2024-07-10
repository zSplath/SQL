-- Tempo antes: 26s
-- Custo antes: 552,357

CREATE NONCLUSTERED INDEX idx_tb_item_codigo_produto ON tb_item (codigo_produto)
INCLUDE (numero, quantidade, preco);

-- Tempo depois: 21s
-- Custo depois: 552,357

-- Reduzindo o tamanho

ALTER DATABASE DB_VENDAS SET RECOVERY SIMPLE
DBCC SHRINKDATABASE ('DB_VENDAS', NOTRUNCATE)
DBCC SHRINKDATABASE ('DB_VENDAS', TRUNCATEONLY)
ALTER DATABASE DB_VENDAS SET RECOVERY FULL

-- Tempo depois: 17s
-- Custo depois: 552,357

CREATE NONCLUSTERED INDEX idx_tb_item_numero ON tb_item (numero)
INCLUDE (quantidade, preco);

-- Tempo depois: 11s
-- Custo depois: 318,109