SELECT * FROM estado WHERE NomeEstado like 'P%';

SELECT count(*) from caracteristicasgerais;
SELECT * from caracteristicasgerais;

select * from imovel;

SELECT count(*) #imovel.codRegistro, cidade.NomeCidade, estado.SiglaEstado 
FROM imovel 
join cidade 
  on cidade.CodigocompletoIBGE = imovel.CodigocompletoIBGE
join estado
  on estado.CodEstadoIBGE = cidade.CodEstadoIBGE
where estado.SiglaEstado = 'RS';

SELECT estado.SiglaEstado , count(*) #imovel.codRegistro, imovel.valorIPTU, imovel.valorCondominio, cidade.NomeCidade, estado.SiglaEstado 
FROM imovel 
join cidade 
  on cidade.CodigocompletoIBGE = imovel.CodigocompletoIBGE
join estado
  on estado.CodEstadoIBGE = cidade.CodEstadoIBGE
where imovel.valorCondominio = 0.00
group by estado.SiglaEstado;


select Count(*) from caracteristicageralimovel;

select Count(*) from caracteristicasgerais;
select Count(*) from cidade;
select Count(*) from estado;
select Count(*) from imovel;
select Count(*) from tipounidade;

SELECT imovel.codRegistro, imovel.valorCondominio
FROM imovel
order by imovel.valorCondominio desc;
