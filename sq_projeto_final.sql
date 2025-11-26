create database pesquisabd;
use pesquisabd;

drop table pesquisa;

create table pesquisa(
id INT auto_increment PRIMARY KEY,
nome varchar(50) NOT NULL,
email varchar(50) NOT NULL,
p1 tinyint NOT NULL,
p2 tinyint NOT NULL,
p3 tinyint NOT NULL,
p4 tinyint NOT NULL,
data_envio timestamp default current_timestamp
);

select * from pesquisa;