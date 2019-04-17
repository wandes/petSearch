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
cd_user SERIAL primary key,
nm_name varchar(100),
nm_email varchar(80),
nm_password varchar(40),
cd_telephone int,
sg_gender varchar(1));


create table animal(
cd_animal SERIAL primary key,
cd_status_animal integer,
nm_animal varchar(80),
nm_species_animal varchar(80),
nm_race varchar(40),
nm_color varchar(40),
qt_age_animal integer,
ds_comments varchar(200),
cd_user SERIAL,
foreign key (cd_user) references users (cd_user));
