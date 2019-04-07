/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  Wandes
 * Created: 07/04/2019
 */
create table users(
cd_usuario serial not null,
nm_nome varchar(40),
nm_email varchar(20),
cd_celular int,
sg_sexo varchar(1),
primary key (cd_usuario));

create table animal(
cd_animal serial not null,
cd_status_animal integer,
nm_animal varchar(30),
nm_especie_animal varchar(40),
nm_raca varchar(30),
nm_cor varchar(20),
qt_idade_animal integer,
ds_observacoes varchar(80),
cd_usuario int,
primary key (cd_animal),
foreign key (cd_usuario) references users (cd_usuario));

create table Address(
cd_endereco serial not null,
nm_rua varchar(50),
cd_cep int,
nm_bairro varchar(20),
nm_cidade varchar(20),
sg_estado varchar(2),
nm_pais varchar(30),
primary key (cd_endereco));