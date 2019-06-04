/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  Wandes
 * Created: 07/04/2019
 */

Create table users(
cd_user serial not null,
nm_name varchar(100),
nm_email varchar(80),
nm_password varchar(40),
cd_telephone  varchar(50),
sg_gender varchar(40),
primary key (cd_user));


Create table animal(
cd_animal serial not null,
cd_status_animal integer,
nm_animal varchar(80),
nm_species_animal varchar(80),
nm_race varchar(40),
sg_gender_animal varchar(40),
nm_color varchar(40),
qt_age_animal int,
ds_comments varchar(400),
primary key (cd_animal));



Create table Address(
cd_address serial not null,
nm_street varchar(100),
cd_postal_code int,
nm_district varchar(20),
nm_city varchar(20),
sg_state varchar(30),
nm_country varchar(30),
cd_animal serial not null,
primary key (cd_address),
foreign key (cd_animal) references animal(cd_animal)ON DELETE CASCADE); 

Create table users_animal(
cd_users_animal serial not null,
cd_user int,
cd_animal serial not null,
primary key (cd_users_animal),
foreign key (cd_user) references users (cd_user) ON DELETE CASCADE,
foreign key (cd_animal) references animal (cd_animal) ON DELETE CASCADE);

create table publication(
cd_publication serial not null ,
cd_status_animal int,
cd_user int,
cd_animal serial not null,
primary key (cd_publication),
foreign key (cd_user) references users (cd_user) ON DELETE CASCADE,
foreign key (cd_animal) references animal (cd_animal) ON DELETE CASCADE);









