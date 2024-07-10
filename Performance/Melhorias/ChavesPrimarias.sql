-- Tempo antes: 11s
-- Custo antes: 318,109

ALTER TABLE tb_nota ADD CONSTRAINT pk_tb_nota PRIMARY KEY (numero);
ALTER TABLE tb_cliente ADD CONSTRAINT pk_tb_cliente PRIMARY KEY (cpf);
ALTER TABLE tb_cidade ADD CONSTRAINT pk_tb_cidade PRIMARY KEY (cidade);
ALTER TABLE tb_loja ADD CONSTRAINT pk_tb_loja PRIMARY KEY (codigo_loja);
ALTER TABLE tb_estado ADD CONSTRAINT pk_tb_estado PRIMARY KEY (sigla_estado);
ALTER TABLE tb_produto ADD CONSTRAINT pk_tb_produto PRIMARY KEY (codigo_produto);
ALTER TABLE tb_item ADD CONSTRAINT pk_tb_item PRIMARY KEY (numero, codigo_produto);
ALTER TABLE tb_classificacao ADD CONSTRAINT pk_tb_classificacao PRIMARY KEY (codigo_classificacao);

-- Tempo antes: 10s
-- Custo antes: 77,118

-- Reduzindo o tamanho

ALTER DATABASE DB_VENDAS SET RECOVERY SIMPLE
DBCC SHRINKDATABASE ('DB_VENDAS', NOTRUNCATE)
DBCC SHRINKDATABASE ('DB_VENDAS', TRUNCATEONLY)
ALTER DATABASE DB_VENDAS SET RECOVERY FULL

-- Tempo antes: 1s
-- Custo antes: 77,118