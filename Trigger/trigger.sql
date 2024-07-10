create database dbDavi

use dbDavi

create table venda (
	DataVenda date,
	Valor float
)

create table faturamento (
 DataVenda date,
 Total float
)

create trigger TG_faturamento
on venda after insert, update, delete
as begin
delete from faturamento;
insert faturamento select DataVenda, sum(Valor) from venda group by DataVenda;
end

insert venda values ('2024-05-19', 100)
insert venda values ('2024-05-19', 200)
insert venda values ('2024-05-20', 100)
insert venda values ('2024-05-20', 300)

select * from faturamento

delete from venda where DataVenda = '2024-05-20'

select * from faturamento