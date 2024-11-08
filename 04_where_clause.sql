# The WHERE clause in MySQL is used to filter records in a table based on specified conditions. 
# It allows you to select only the rows that meet certain criteria.

# Basic Syntax
-- SELECT column1, column2, ...
-- FROM table_name
-- WHERE condition;

# The WHERE clause can be used with SELECT, UPDATE, and DELETE statements.

# Consider below database
drop database if exists college;
create database if not exists college;
use college;

create table student(
Roll_No int Primary key, 
Name varchar(50), 
Marks int not null,
Grade varchar(1),
City varchar(20),
constraint marks_check check (Marks>=0 and Marks<=100)
);

desc student;

insert into student (Roll_No, Name, Marks, Grade, City)
values
(101, "Anil", 78, "C", "Pune"),
(102, "Bhumika", 93, "A", "Mumbai"),
(103, "Chetan", 85, "B", "Mumbai"),
(104, "Dhruv", 96, "A", "Delhi"),
(105, "Emanuel", 12, "F", "Delhi"),
(106, "Farah", 82, "B", "Delhi");

select * from student;


# Examples of Using the WHERE Clause
# 1. Using a Simple Condition
# Select student with marks greater than 80:
select * from student where Marks > 80;
select * from student where City = "Mumbai";  # select students living in Mumbai
select * from student where Grade = "A";      # select students having grade A

# 2. Using NOT to Exclude Certain Records
# Select students who is not living in "Mumbai":
select * from student where not City = "Mumbai";  #OR
select * from student where City != "Mumbai";


# 3. Using Multiple Conditions
# Select employees whos Grade is A and living in Delhi:
select * from student where Grade = "A" and City = "Delhi";
select * from student where City = "Mumbai" and Marks > 80;  #select students living in Mumbai and having marks > 80

# 4. Using OR Condition
# Select students who is living in either "Pune" or "Mumbai" city:
select * from student where City = "Pune" or City = "Mumbai";
select * from student where Grade  = "A" or City = "Mumbai";  # Select students who is living in "Mumbai" city or having A grade


# 5. Using IN Condition
# Select students who is living in "Mumbai," "Pune," or "Chennai":
select * from student where City in ("Mumbai", "Pune", "Chennai");
select * from student where City not in ("Delhi", "Pune");   # Select students who is not living in "Delhi" or "Pune"


# 6. Using BETWEEN Condition
# Select students whose marks are between 80 and 90 inclusive:
select * from student where Marks between 80 and 90;


# 7. Using LIKE Condition for Pattern Matching
# Note: "%" - represents multiple characters and
#		"_" - represents single characters

# Select students whose names start with "A":
select * from student where Name like "A%";
select * from student where Name like "%A"; # select students whose name end's with "A"
select * from student where Name like "_A%"; # select students whose names 2nd character is "A" (Not case sensitive)








