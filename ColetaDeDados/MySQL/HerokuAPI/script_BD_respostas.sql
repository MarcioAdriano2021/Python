#Questão 1
select * from tb_pessoa where idade >= 50;
select count(*) from tb_pessoa where idade >= 50;

#Questão 2
select * from tb_estado where sigla = 'MT';

select p.nome, p.idade, c.nome, e.sigla from tb_pessoa p
join tb_cidade c 
  on c.id_cidade  = p.id_cidade 
join tb_estado e
  on e.id_estado = c.id_estado
 where e.sigla = 'MT';
 
select e.sigla, avg(p.idade) from tb_pessoa p
join tb_cidade c 
  on c.id_cidade = p.id_cidade 
join tb_estado e
  on e.id_estado = c.id_estado
where e.sigla = 'MT' 
group by e.sigla;

#Questão 3
select * from tb_pessoa order by data_nasc;
select * from tb_pessoa where data_nasc between '1968-01-01' and '1978-12-31';
select count(*) from tb_pessoa where data_nasc between '1968-01-01' and '1978-12-31';


#Questão 4
select * from tb_tiposanguineo;
select * from tb_estado where sigla in ('PE','AP');
select * from tb_cidade where id_estado in (5,7);
select * from tb_pessoa where id_tiposanguineo = 3 
and id_cidade in (64,83,67,71,76);
select count(*) from tb_pessoa 
inner join tb_tiposanguineo on tb_pessoa.id_tiposanguineo = tb_tiposanguineo.id_tiposanguineo
inner join tb_cidade on tb_pessoa.id_cidade = tb_cidade.id_cidade
inner join tb_estado on tb_cidade.id_estado = tb_estado.id_estado 
where tb_tiposanguineo.tipo like "AB-" 
 and (tb_estado.sigla like "AP" or tb_estado.sigla like "PE");
 
#Questão 5
select p.nome, p.idade, p.data_nasc from tb_pessoa p 
where p.idade = (select max(x.idade) idade from tb_pessoa x);

select p.nome, p.idade, p.data_nasc from tb_pessoa p 
where p.data_nasc = (select min(x.data_nasc) data_nasc from tb_pessoa x);
 
select * from tb_pessoa order by data_nasc;

#Questão 6
select p.nome, p.idade, p.data_nasc from tb_pessoa p 
where p.idade = (select min(x.idade) idade from tb_pessoa x);

select p.nome, p.idade, p.data_nasc from tb_pessoa p 
where p.data_nasc = (select max(x.data_nasc) data_nasc from tb_pessoa x);
 
select * from tb_pessoa order by data_nasc desc;
