# Aggregate functions in MySQL perform calculations on a set of values and return a single value. 
# They are typically used with the GROUP BY and HAVING clause and can summarize or analyze data.

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


# Common Aggregate Functions in MySQL :

# 1.MAX() :
# Returns the maximum value in a column.
# Useful for finding the highest value, like the highest salary or maximum price.
# Example:
SELECT MAX(marks) FROM student; # Returns the maximum mark from students table

# 2.MIN() :
# Returns the minimum value in a column.
# Useful for finding the lowest value, like the lowest salary or minimum price.
# Example:
SELECT MIN(marks) FROM student;  # Returns the minimum mark from students table

# 3.SUM() :
# Calculates the sum of values in a numeric column.
# Often used to find totals, like total sales or total salaries.
# Example:
SELECT SUM(marks) FROM student;  # Returns addition of all students marks

# 4.AVG() :
# Calculates the average (mean) of values in a numeric column.
# Used to find average salaries, prices, etc.
# Example:
SELECT AVG(marks) FROM student;  # Returns avarage mark of all students

# 5.COUNT() :
# Counts the number of rows that match a specific condition.
# Useful for finding the number of records in a table or a specific column.
# Example:
SELECT COUNT(*) FROM student;  # Returns the total numbers of records i.e. 6
SELECT COUNT(marks) FROM student;  # To count non-null values in a column i.e. 6  due to no null values
SELECT COUNT(distinct city) FROM student;  # Returns the total number of distinct cities i.e. 3







