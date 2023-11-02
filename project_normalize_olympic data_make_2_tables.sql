-- Normalisation
--  1NF - Columns should have atomic values - each cell should have 1 value
--  2NF - No partial dependencies
--  3NF - Remove Transitive Dependency - Non prime attribute should not give non prime attribute
-- To make Olympic_data - normalize  , we create two tables - player_info and medal 

create database `olympix`;
use `olympix`;

-- Add ID into olympix and set primary key
ALTER TABLE olympix.olympix_data ADD id INT NOT NULL AUTO_INCREMENT PRIMARY KEY;

-- To change column name
ALTER TABLE olympix_data
CHANGE brone_medal bronze_medal int(11);



-- Create table player_info
create table player_info(
id int(11) NOT NULL primary key AUTO_INCREMENT,
name varchar(50),
age varchar(25),
country varchar(50),
year int(11),
Date_Given varchar(30),
sports varchar(50))
ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 ;  -- Created table and set id as primary key

-- Create table medal
create table medal(
id int(11) not null primary key auto_increment,
gold_medal int(11),
silver_medal int(11),
bronze_medal int(11),
total_medal int(11),
constraint medal_fk
foreign key (id) references player_info (id))
engine = InnoDB DEFAULT CHARSET = utf8mb4;  -- Created table and set id as primary key and foreign key

-- Insert values into table player_info from master table olympix
insert into player_info
select id, name, age, country, year, Date_Given, sports from olympix_data; -- Here we selected specific columns to add values into player_info table

-- Insert values into table medal from master table olympix
insert into medal 
select id, gold_medal, silver_medal, bronze_medal, total_medal from olympix_data;  -- Here we selected specific columns to add values into medal table
 
