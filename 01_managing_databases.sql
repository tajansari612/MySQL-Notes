#Creating a database
create database apnaCollege;

#Creating a database with if not exists keywords
create database apnaCollege; #error database already exist
create database if not exists apnaCollege;  #no error only warning 

#Droping database
drop database apnacollege;  #MySQL is not a case sensitive (sql == SQl)

#Droping database with if exists keywords
drop database apnacollege;  #error database not exist
drop database if exists apnacollege;  #no error only warning

#Below query used to output all databases
show databases;

#Below query used to select database
use apnacollege;

#Below query used to output the all the tables present in selected database
show tables;



