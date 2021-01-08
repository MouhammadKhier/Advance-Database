-- create database Yalla search engine
DROP SCHEMA IF EXISTS `arena100k_optimized`;
CREATE SCHEMA `arena100k_optimized`;

-- select the database
USE `arena100k_optimized`;
-- CREATE DATABASE Arena

  -- create club owner table 
CREATE TABLE IF NOT EXISTS `arena100k_optimized`.`club_owner` (
id INT(11) NOT NULL AUTO_INCREMENT,
userName nvarchar(25) NOT NULL,
password nvarchar(45) not null,
firstName nvarchar(25),
lastName nvarchar(25),
clubName nvarchar(25), #name -> clubName
clubStreet nvarchar(50), #street -> clubStreet
clubCity nvarchar(50), #city -> clubCity
email nvarchar(50) unique not null,
phone decimal(10) check(phone>999999999 AND phone<2000000000),	
primary key(id)

);

CREATE TABLE IF NOT EXISTS `arena100k_optimized`.`pitch`(
clubId int ,
pitch_num int ,
capacity int check(capacity in(5,7,11)),
price float check(price>0),
type int check(type in(0,1,2)),
primary key (clubId, pitch_num),
foreign key(clubId) references club_owner(id)
on update cascade on delete cascade
);


CREATE TABLE IF NOT EXISTS `arena100k_optimized`.`player`(
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



CREATE TABLE IF NOT EXISTS `arena100k_optimized`.`event`(
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
foreign key (clubId) references club_owner(id)
on delete cascade on update cascade
);


CREATE TABLE IF NOT EXISTS `arena100k_optimized`.`schedule`(
yyyy int(4),
mm int(2),
dd int(2),
hh int(2),
paid float check(paid>0),
unpaid float check(unpaid>=0),
clubId int,
pitch_num int,
playerId INT(11),
primary key (yyyy,mm,dd,hh,clubId,pitch_num),
foreign key (playerId) references player(id),
foreign key (clubId,pitch_num) references pitch(clubId,pitch_num)
on delete cascade on update cascade
);


CREATE TABLE IF NOT EXISTS `arena100k_optimized`.`profit`(
clubId int,
yyyy int(4),
mm int(2),
dd int(2),
outcome float check(outcome>=0),
income float check(income>=0), 
primary key (clubId,yyyy,mm,dd),
foreign key (clubId) references club_owner(id)
on delete cascade on update cascade
);


CREATE TABLE IF NOT EXISTS `arena100k_optimized`.`participate`(
playerId INT(11),
eventId int,
clubId int,
primary key (playerId,eventId,clubId),
foreign key (eventId,clubId) references Event (eventId,clubId)
on delete cascade on update cascade,
foreign key (playerId) references player(id)
on delete cascade on update no action
);
