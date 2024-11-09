# The LIMIT and ORDER BY clauses in MySQL are used to control the number of rows returned in a result set and 
# the order in which they appear, respectively. They are often used together in SELECT statements for efficient data retrieval.

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


# 1. ORDER BY Clause :
# The ORDER BY clause sorts the result set based on one or more columns in either ascending (ASC) or descending (DESC) order.
# Syntax:
-- SELECT column1, column2, ...
-- FROM table_name
-- ORDER BY column_name [ASC|DESC];
# ASC: Sorts in ascending order (default).
# DESC: Sorts in descending order.

# Example:
select * from student order by name;  #Display the students info in ascending order by their name
select * from student order by name desc;  #Display the students info in descending order by their name
select * from student order by marks desc, name; #Display the students info in descending order by their marks and by name


# 2. LIMIT Clause :
# The LIMIT clause restricts the number of rows returned by a query. 
# It’s especially useful when you only want a subset of rows from the result set.
# Syntax:
-- SELECT column1, column2, ...
-- FROM table_name
-- LIMIT number_of_rows;
# LIMIT n: Limits the result to the first n rows.
# LIMIT offset, n: Skips the first offset rows and then returns the next n rows.

# Examples:
# Retrieve the first 5 records:
SELECT * FROM student LIMIT 5;

# Skip the first 2 records and retrieve the next 4 records:
SELECT * FROM student LIMIT 2, 4;

#Practice Question 2: Find top 3 records from student by their marks 
select * from student order by marks desc limit 3;

#Practice Question 2: Find second last record from student by their marks
select * from student order by marks desc;  #records in descending order
select * from student order by marks desc limit 1,1;  # limit set to 1(offset),1(limit) means 1 record is skipped and 1 record will be shown 
