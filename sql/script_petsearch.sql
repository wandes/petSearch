/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  Wandes
 * Created: 07/04/2019
 */


create table Address(
cd_address serial not null,
nm_street varchar(100),
cd_postal_code integer,
nm_district varchar(20),
nm_city varchar(20),
sg_state varchar(30),
nm_country varchar(30),
cd_animal integer,
cd_user integer,
primary key (cd_address),
foreign key (cd_animal) references animal(cd_animal),
foreign key (cd_user) references users (cd_user));
