# The GROUP BY and HAVING clauses in MySQL are used to group rows that have the same values in specified columns and 
# filter groups based on conditions, respectively.


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


# 1. GROUP BY Clause :
# The GROUP BY clause groups rows with the same values in specified columns into summary rows. 
# It’s often used with aggregate functions like COUNT(), SUM(), AVG(), MAX(), and MIN() to perform calculations on each group.
# Syntax:
-- SELECT column1, aggregate_function(column2)
-- FROM table_name
-- GROUP BY column1;

# Example 1: Calculate the total count of students for each city in a students table.
SELECT city, COUNT(*) AS total_students
FROM student
GROUP BY city;

# Example 2: Calculate the avarage marks for each city in a students table.
SELECT city, AVG(marks) AS avg_marks
FROM student
GROUP BY city;


# 2. HAVING Clause :
# The HAVING clause is used to filter groups created by GROUP BY. 
# It works similarly to the WHERE clause, but WHERE is used to filter rows before grouping, 
# while HAVING filters groups after aggregation.
# Syntax:
-- SELECT column1, aggregate_function(column2)
-- FROM table_name
-- GROUP BY column1
-- HAVING condition;

# Example 1: Find cities with a total marks greater than 150.
SELECT city, SUM(marks) as total_marks
FROM student
GROUP BY city
HAVING total_marks>150;

# Example 2: Find cities with a avarage marks greater than 80.
SELECT city, AVG(marks) as avg_marks
FROM student
GROUP BY city
HAVING avg_marks>80;
