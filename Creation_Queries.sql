-- create database Yalla search engine
DROP SCHEMA IF EXISTS `arena2`;
CREATE SCHEMA `arena2`;

-- select the database
USE `arena2`;
-- CREATE DATABASE Arena

  -- create club owner table 
CREATE TABLE IF NOT EXISTS `arena2`.`club_owner` (
id INT(11) NOT NULL AUTO_INCREMENT,
userName nvarchar(25) NOT NULL,
password nvarchar(45) not null,
firstName nvarchar(25),
lastName nvarchar(25),
email nvarchar(50) unique not null,
phone decimal(10) check(phone>999999999 AND phone<2000000000),	
primary key(id)
);

CREATE TABLE IF NOT EXISTS `arena2`.`club`(
id INT(11) NOT NULL AUTO_INCREMENT,
name nvarchar(25),
street nvarchar(50),
city nvarchar(50),
club_owner int(11),
primary key(id),
foreign key (club_owner) references club_owner(id)
on delete set null on update cascade
);


CREATE TABLE IF NOT EXISTS `arena2`.`pitch`(
clubId int ,
pitch_num int ,
capacity int check(capacity in(5,7,11)),
price float check(price>0),
type int check(type in(0,1,2)),
primary key (clubId, pitch_num),
foreign key(clubId) references club(id)
on update cascade on delete cascade
);


CREATE TABLE IF NOT EXISTS `arena2`.`player`(
id INT(11) NOT NULL AUTO_INCREMENT,
userName nvarchar(25),
password nvarchar(45) not null,
firstName nvarchar(25),
lastName nvarchar(25),
email nvarchar(50) unique not null,
yyyy int(4),
mm int(2),
dd int(2),
visa decimal(16),
phone decimal(10) check(phone>999999999 AND phone<2000000000),
primary key (id)
);



CREATE TABLE IF NOT EXISTS `arena2`.`event`(
eventId INT(11) NOT NULL AUTO_INCREMENT,
clubId int ,
name nvarchar(150),
Syyyy int(4),
Smm int(2),
Sdd int(2),
Shh int(2),
Eyyyy int(4),
Emm int(2),
Edd int(2),
Ehh int(2),
noOfTeams int check (noOfTeams>0),
noOfTeamMembers int check(noOfTeamMembers>0),
availablePlaces int check(availablePlaces>=0),
prize int check(prize>=0),
pricePerTeam int check(pricePerTeam>0),
primary key (eventId,clubId),
foreign key (clubId) references club(id)
on delete cascade on update cascade
);


CREATE TABLE IF NOT EXISTS `arena2`.`schedule`(
yyyy int(4),
mm int(2),
dd int(2),
hh int(2),
paid float check(paid>0),
unpaid float check(unpaid>=0),
clubId int,
pitch_num int,
playerUserName nvarchar(25),
primary key (yyyy,mm,dd,hh,clubId,pitch_num),
foreign key (clubId,pitch_num) references pitch(clubId,pitch_num)
on delete cascade on update cascade
);


CREATE TABLE IF NOT EXISTS `arena2`.`profit`(
clubId int,
yyyy int(4),
mm int(2),
dd int(2),
outcome float check(outcome>=0),
income float check(income>=0), 
primary key (clubId,yyyy,mm,dd),
foreign key (clubId) references club(id)
on delete cascade on update cascade
);


CREATE TABLE IF NOT EXISTS `arena2`.`participate`(
id INT(11) NOT NULL AUTO_INCREMENT,
playerUserName nvarchar(25),
eventId int,
clubId int,
primary key (id,eventId,clubId),
foreign key (eventId,clubId) references Event (eventId,clubId)
on delete cascade on update cascade,
foreign key (id) references player(id)
on delete cascade on update no action
);
