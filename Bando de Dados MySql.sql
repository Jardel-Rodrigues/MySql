Curso de Banco de Dados (MySQL)


--Criando um Banco de Dados
create database Cadastro;

--Criando uma tabela
Criando um tabela -> create table Pessoas ( 
Nome varchar(30),
Idade tinyint(3),
Sexo char(1),
Peso float,
Altura float,
Nascionalidade varchar(20)
);


--Tipo Primitivos MySQL
Inteiro TinyInt, SmallInt, Int, MediumInt, BigInt
Numérico Real Decimal, Float, Double, Real
Lógico Bit, Boolean
Data Date, DateTime, TimeStamp, Time, Year
Caractere Char, VarChar
Literal Texto TinyText, Text, MediumText, LongText
Binário TinyBlob, Blob, MediumBlob, LongBlob 
Coleção Enum, Set


--Melhorando a Estrutura da tabela
create table pessoas (
id int not null auto_increment,
nome varchar(30) not null,
nascimento date,
sexo enum('M','F'),
peso decimal(5,2),
altura decimal(3,2),
nacionalidade varchar(20) default 'Brasil',
primary key (id)
)default charset = utf8;


--Deletando um tabela
Drop table -> Nome da Tabela


--Alterando a Estrutura da Tabela
Alter table pessoas
Add colunm profissão varchar (10) after ou first nome;


--Alterado o nome de uma tabela
Alter table pessoas

--Deletando um coluna de uma tabela
Drop colunm profissão;


--Modificando o tamanho de campo
Alter table pessoas Modify colonm profissão varchar (20); 


--Deletando o Bando de Dados
drop datebase cadastro;


-- Deletando um tabela
drop table pessoas;


--Atualizado Dados no Banco
Update pessoas Set nome = ‘Maria’ Where id = ‘1’;
Update pessoasSet nome = ‘Joana’, ano = ‘2000’ Where id = ‘2’Limit 1;


--Deletando um Dado do Banco
Delete from pessoas 
Where nacionalidade = ‘EUA’;


--Deletando todos os Dados de uma Tabela
Truncate table pessoas;


--Querys de Consultas 
select * from cursos where nome = 'java' order by nome;

select * from cursos where carga = '40';

select nome, carga, ano from cursos order by ano, nome;

select nome, descricao from cursos where ano <= '2015' order by nome;

select nome, ano from cursos where ano between '2014' and '2016';

select nome, descricao, ano from cursos where ano in ('2014','2016','2020') order by ano;

select nome, carga, totaulas from cursos where carga > '35' and totaulas < '30';

select * from cursos where nome like 'P%';

select * from tb_funcionarios where nome like '%_silva%';

select distinct nacionalidade from tb_funcionarios order by nacionalidade;

select count(*) from cursos;

select count(*) from cursos where carga > ‘40’;

select max(totaulas) from cursos where ano = '2016';

select min(totaulas) from cursos where ano = '2016';

select nome, min(totaulas) from cursos where ano = '2016';

select sum(totaulas) from cursos where ano = '2016';

select avg(totaulas) from cursos where ano = '2016';

select totaulas, count(*) from cursos
group by totaulas
order by totaulas;


select ano, count(*) from cursos
group by ano
having ano > 2016
order by count(*);


select carga, count(*) from cursos where ano > 2015
group by carga
having carga > (select avg(carga) from cursos);


--Adicionando um chave estrangeira
alter table tb_funcionarios add foreign key (cursopreferido) 
references cursos(idcurso);


--Atualizando Dados
update tb_funcionarios set cursopreferido = '6' where id = '1';
update `cadastro`.`tb_funcionarios` set `cursopreferido` = '5' where (`id` = '62');


--Obtendo Dados da Tabela
select tb_funcionarios.nome, tb_funcionarios.cursopreferido, cursos.nome, cursos.ano
from tb_funcionarios inner join cursos
on cursos.idcurso = tb_funcionarios.cursopreferido;
select tb_funcionarios.nome, tb_funcionarios.cursopreferido,cursos.nome, cursos.ano
from tb_funcionarios left outer join cursos
on cursos.idcurso = tb_funcionarios.cursopreferido;
select tb_funcionarios.nome, tb_funcionarios.cursopreferido,cursos.nome, cursos.ano
from tb_funcionarios right outer join cursos
on cursos.idcurso = tb_funcionarios.cursopreferido;


--Criando chave estrangeira de muitos pra muitos
create table treinamento_funcionario(
id int not null auto_increment,
data date,
idtb_funcionarios int,
idcurso int,
primary key(id),
foreign key(idtb_funcionarios) references
tb_funcionarios(id),
foreign key(idcurso) references cursos(idcurso)
) default charset = utf8;


--Inserindo registros a tabela treinamento_funcionario
insert into treinamento_funcionario values
(default, '2014-03-01', '1', '2');
Junções
select * from tb_funcionarios
join treinamento_funcionario
on tb_funcionarios.id = 
treinamento_funcionario.idtb_funcionarios
join cursos
on cursos.idcurso = treinamento_funcionario.idcurso
order by tb_funcionarios.nome;



--Operadores Relacionais
=   Igual á
<   Menor que
>   Maior que
<=  Menor ou Igual á
>=  Maior ou Igual á
!=, Diferente de


--DDL -> Comandos de Definição de Dados 
create datebase
create table
alter table
drop table

--DML -> Comandos de Manipulação de Dados
Insert into 
Update
Delete
Truncate
Select