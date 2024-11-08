#Creating database
create database college;

#Selecting created database
use college;

#Creating a student table with 3 collumns Roll_No, Name, Age
create table student(
Roll_No int primary key,
Name varchar(50),
Age int not null
);

#Checking if table is created or not
show tables;

#Describing student table (Outputs all info about a table)
desc student;

#Inserting values in the student table with selected columns here Roll_No, Name and Age are selected columns
insert into student(Roll_No, Name, Age) values(1, "Taj", 24); #Inserting single row

insert into student(Roll_No, Name, Age)  #Inserting multiple rows
 values                  
 (2, "Ayaj", 22),
 (3, "Raj", 23),
 (4, "Pravin", 23),
 (5, "Kishor", 21);
 
 #Inserting values without selecting columns
 #It will need all the columns values to be inserted
 insert into student values (6, "Harman", 21); #Inserting single row
 
 #Same with multiple rows
 insert into student
 values                  
 (7, "Preet", 22),
 (8, "RajU", 24),
 (9, "David", 23);
 
 
 #select statement is used to output the records from a table
 select * from student;   # * represents all columns
 select Name, Age from student  #Name and Age columns are selected it will show Name and Age columns only
 