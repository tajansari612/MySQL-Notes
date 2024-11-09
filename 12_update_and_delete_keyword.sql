# The UPDATE and DELETE keywords in MySQL are used to modify and delete existing records in a table.

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


# 1. UPDATE Keyword :
# The UPDATE keyword is used to modify existing records in a table based on specified conditions. 
# It can change values in one or more columns of the specified rows.
# Syntax:
-- UPDATE table_name
-- SET column1 = value1, column2 = value2, ...
-- WHERE condition;
# SET: Specifies the column(s) to update and their new values.
# WHERE: Filters which rows to update. Omitting WHERE will update all rows in the table.

# Example 1: Update the mark of a student named "Emanuel" to 80.
UPDATE student
SET marks = 80, grade = "B"
WHERE name = 'Emanuel';

# Example 2: Increase the marks of all students by 2;
UPDATE student
SET marks = marks + 2;

# Example 3: Update the grade of all students from "A" to "B".
UPDATE student
SET grade = "O"
WHERE grade = "A";
# Note: Use caution with UPDATE without a WHERE clause, as it will apply the changes to all rows in the table.


# 2. DELETE Keyword :
# The DELETE keyword removes records from a table based on specified conditions.
# Syntax:
-- DELETE FROM table_name
-- WHERE condition;
# WHERE: Specifies which rows to delete. 
# Omitting WHERE will delete all rows in the table, but it will leave the table structure intact.

# Example 1: Delete a student record where the student's name is "Anil".
DELETE FROM student
WHERE name = 'Anil';

# Example 2: Delete all student's from "Delhi" city.
DELETE FROM student
WHERE city = 'Delhi';

# Example 3: Delete all records from student table.
DELETE FROM student;
# Note: Be careful with DELETE without a WHERE clause, as it will remove all records from the table.

# TRUNCATE vs DELETE
# DELETE: Deletes rows based on a condition and logs each row deleted (slower for large tables). 
# It can be rolled back if used within a transaction.

# TRUNCATE: Deletes all rows from a table instantly without logging individual row deletions (faster for large tables). 
# It cannot be rolled back in most database engines.
# Example: Delete all records from the student table.
TRUNCATE TABLE student;