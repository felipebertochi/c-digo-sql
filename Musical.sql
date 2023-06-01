create schema musical;
create table pessoa(
	ident smallint,
    nome_pessoa varchar(50) not null,
    nacionalidade varchar(50),
    cidade varchar(30),
    endereco varchar(50),
    data_nasc date,
    primary key (ident)
);

create table compositor(
	ident smallint,
    estilo varchar(20),
    data_ini date,
    primary key (ident),
    foreign key (ident) references pessoa (ident)
);

create table musico(
 ident smallint,
 primary key (ident),
 foreign key (ident) references pessoa (ident)
);

create table tem(
 ident smallint,
 cod_esp smallint,
 primary key (ident, cod_esp),
 foreign key (ident) references pessoa (ident),
 foreign key (cod_esp) references especialidade (cod_esp)
);

create table especialidade(
 cod_esp smallint,
 especialidade varchar(30),
 primary key (cod_esp)
);

create table obra(
 cod_obra smallint,
 nome_obra varchar(30),
 tipo varchar(20),
 local_criacao varchar(30),
 data_criacao date unique,
 primary key (cod_obra)
);

create table orquestra(
	cod_orq smallint,
    nome_orq varchar(50),
    cidade varchar(50),
    pais varchar(30),
    data_criacao date unique,
    primary key (cod_orq)
);

create table constitui(
	data_entrada date,
    data_saida date,
    ident smallint,
    cod_orq smallint,
    primary key (data_entrada, data_saida, ident),
    foreign key (cod_orq) references orquestra (cod_orq)
);

create table executa(
	cod_orq smallint,
    cod_obra smallint,
    primary key (cod_orq, cod_obra),
    foreign key (cod_orq) references orquestra (cod_orq),
    foreign key (cod_obra) references obra (cod_obra)
);

create table toca(
	ident smallint,
    cod_obra smallint,
    data_apres date,
    funcao varchar(25),
    primary key (ident, cod_obra, data_apres),
    foreign key (ident) references musico (ident),
    foreign key (cod_obra) references obra (cod_obra)
);

create table compoe(
	ident smallint,
    cod_obra smallint,
    primary key (ident, cod_obra),
    foreign key (ident) references compositor (ident),
    foreign key (cod_obra) references obra (cod_obra)
);

insert into pessoa (ident, nome_pessoa, nacionalidade, cidade, endereco, data_nasc)
values ('1', 'Ana', 'Rua A, nº10, bairro Centro', 'brasileira', 'Rio de Janeiro', '1987-4-24'),
	   ('2', 'João', 'Rua das orquídeas, nº50, bairro Vila Verde', 'brasileira', 'Resende', '1990-10-12'),
       ('3', 'Beatriz', 'Rua Feliciano Sodré, nº1059, bairro Vila Julieta', 'brasileira', 'Resende', '1994-8-25'),
       ('4', 'Fábio', 'Rua Félix Crame, nº130, bairro Pechincha', 'brasileira', 'Rio de Janeiro', '1985-7-17'),
       ('5', 'Marcelo', 'Av. Lúcio Costa, nº1500, bairro Barra da Tijuca', 'brasileira', 'Rio de Janeiro', '1974-10-4'),
       ('6', 'Maria', 'Av. Atlãntica, nº1750, bairro Copacabana', 'brasileira', 'Rio de Janeiro', '1978-12-09');
       
insert into compositor (ident, estilo, data_ini)
values ('5', 'pop', '2022-08-12'),
       ('6', 'clássico', '2023-04-01');
       
insert into musico (ident)
values (1), (2), (3), (4), (5);

insert into especialidade (cod_esp, especialidade)
values ('1', 'baterista'),
       ('2', 'pianista'),
       ('3', 'violinista'),
       ('4', 'flautista'),
       ('5', 'saxofonista');

insert into tem (ident, cod_esp)
values ('1', '1'),
	   ('2', '2'),
       ('2', '3'),
       ('2', '4'),
       ('3', '2'),
       ('3', '5'),
       ('4', '1'),
       ('5', '2'),
	   ('5', '4');

insert into musical.obra
(cod_obra, nome_obra,tipo,local_criacao,data_criacao) values
(1, 'Wave', 'instrumental', 'New York', '1975-04-1'),
(2, 'O Barbeiro de Sevilha', 'instrumental','Atlanta','1875-02-24'),
(3, 'Noturno Opus 9 Nº 2', 'clássica','Londres', '1832-09-30'),
(4, 'Guilherme Tell', 'clássica', 'Veneza', '1829-08-15'),
(5, 'A Bela Adormecida', 'clássica', 'Paris', '1890-12-5');

insert into orquestra (cod_orq, nome_orq, cidade, pais, data_criacao)
values (1, 'Orquestra Sinfônica Brasileira', 'Rio de Janeiro', 'Brasil', '1940-01-24'),
	   (2, 'Filarmónica de Nova Iorque', 'Nova Iorque', 'Estados Unidos', '1842-03-5'),
	   (3, 'Orquestra Sinfônica de Londres', 'Londres', 'Inglaterra', '1904-09-05'),
	   (4, 'Orquestra da Unirio', 'Rio de Janeiro', 'Brasil', '2004-09-15');

insert into constitui (data_entrada, data_saida, ident, cod_orq)
values ('2022-11-23', '2023-01-20', 1 , 1),
	   ('2023-02-12', '2023-05-01', 1, 2),
	   ('2020-08-05', '2022-06-07', 2, 1),
	   ('2022-07-30', '2022-12-19', 3, 4),
	   ('2019-10-24', '2023-03-19', 5,  3),
	   ('2023-04-01', '2023-05-12', 5, 4);
       
insert into executa
values (1,1), (1,2),(1,3),(1,4),(1,5),(2,3),(3,5),(3,2),(4,1),(4,5);

insert into toca (ident, cod_obra, data_apres, funcao)
values (1,2, '2022-06-17', 'baterista'),
	   (1,5, '2023-05-01', 'baterista'),
       (2,4, '2022-10-09', 'pianista'),
	   (3,1, '2021-06-19', 'saxofonista'),
	   (3,2, '2020-04-14', 'saxofonista'),
	   (3,3, '2021-03-22', 'saxofonista'),
	   (3,4, '2022-08-09', 'saxofonista'),
	   (3,5, '2023-2-05', 'saxofonista'),
	   (4,4, '2022-06-02', 'baterista'),
	   (5,1, '2020-10-03', 'pianista'),
	   (5,4, '2022-04-07', 'flautista');

insert into compoe (ident, cod_obra)
values (5, 1), (5,2), (5,3),(5,5),(6,1),(6,4),(6,5);

select * from pessoa;
select * from compositor;
select * from musico;
select * from tem;
select * from especialidade;
select * from obra;
select * from orquestra;
select * from constitui;
select * from executa;
select * from toca;
select * from compoe;

select especialidade
from especialidade;

select nome_pessoa
from pessoa, musico
where pessoa.ident = musico.ident;

alter table pessoa
modify nacionalidade varchar(50);








    


