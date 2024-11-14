# In MySQL, joins are used to combine rows from two or more tables based on a related column between them. 
# Joins are essential for querying data across multiple tables in a relational database. 

# Consider following database
create database if not exists college;
use college; 

create table department(
department_id char(5) primary key,
department_name varchar(30)
);
insert into department values
("D-001", "Computer Department"),
("D-002", "Electronics Department"),
("D-003", "Mechanical Department"),
("D-004", "Civil Department"),
("D-005", "Chemical Department"),
("D-006", "Auto Department");
select * from department;

create table course(
course_id char(5) primary key, 
course_name varchar(30)
);
insert into course values
("C-001", "DBMS"),
("C-002", "OOPs"),
("C-003", "BXE"),
("C-004", "EM"),
("C-005", "M3"),
("C-006", "M2"),
("C-007", "BEE"),
("C-008", "AIML");
select * from course;

create table teacher (
teacher_id char(5) primary key, 
name varchar(50), 
department_id char(5), 
course_id char(5), 
constraint teacher_fk_1 foreign key(department_id) references department(department_id) on delete cascade on update cascade,
constraint teacher_fk_2 foreign key(course_id) references course(course_id) on delete cascade on update cascade
);
insert into teacher values
("T-001", "Kishor Sadaphale", "D-001","C-001"),
("T-002", "Sneha Farkade","D-001", "C-002"),
("T-003", "Rani Sandbhor", "D-002", "C-003"),
("T-004", "Vikash Fhutane", "D-003", "C-004"),
("T-005", "Supriya Thorat", "D-004", "C-005"),
("T-006", "Raj Varma", NULL, NULL),
("T-007", "Rohit Jane", NULL, NULL);
select * from teacher;

# Here are the main types of joins in MySQL:
# 1. INNER JOIN:
# An INNER JOIN returns only the rows where there is a match in both tables. 
# If there’s no match, the row is excluded from the result.
# Syntax:
-- SELECT columns
-- FROM table1
-- INNER JOIN table2 ON table1.common_column = table2.common_column;

# Example 1: Returns all data that matches department_id from teacher and department table
SELECT teacher.name, department.department_name
FROM teacher
INNER JOIN department ON teacher.department_id = department.department_id;

# Example 2: Returns all data that matches department_id from teacher and department table and course_id from teacher and course table
SELECT teacher.name, department.department_name, course_name
FROM teacher
INNER JOIN department ON teacher.department_id = department.department_id
INNER JOIN course ON teacher.course_id = course.course_id;


# 2. LEFT JOIN (or LEFT OUTER JOIN):
# A LEFT JOIN returns all rows from the left table and the matching rows from the right table. 
# If there is no match, NULL values are returned for columns from the right table.
# Syntax:
-- SELECT columns
-- FROM table1
-- LEFT JOIN table2 ON table1.common_column = table2.common_column;

# Example 1: This will return all departments, including those who don’t have any teacher. 
			# For such deapartment, teacher_name will show as NULL.
SELECT department.department_name, teacher.name
FROM department
LEFT JOIN teacher ON department.department_id = teacher.department_id;

# Example 2: This will return all courses, including those who don’t have any teacher. 
			# For such courses, teacher_name will show as NULL.
SELECT course.course_id, teacher.name
FROM course
LEFT JOIN teacher ON course.course_id = teacher.course_id;



# 3. RIGHT JOIN (or RIGHT OUTER JOIN):
# A RIGHT JOIN returns all rows from the right table and the matching rows from the left table. 
# If there is no match, NULL values are returned for columns from the left table.
# Syntax:
-- SELECT columns
-- FROM table1
-- RIGHT JOIN table2 ON table1.common_column = table2.common_column;

# Example 1: This will return all teachers, including those who don’t have any department. 
			# For such teachers, department_name will show as NULL.
SELECT department.department_name, teacher.name
FROM department
Right JOIN teacher ON department.department_id = teacher.department_id;

# Example 2: This will return all teachers, including those who don’t have any teacher. 
			# For such courses, teacher_name will show as NULL.
SELECT course.course_id, teacher.name
FROM course
RIGHT JOIN teacher ON course.course_id = teacher.course_id;


# 4. FULL JOIN (or FULL OUTER JOIN):
# MySQL does not support FULL OUTER JOIN directly, but you can simulate it using a combination of LEFT JOIN and RIGHT JOIN with a UNION. 
# A FULL JOIN returns all rows when there is a match in either table, with NULLs for missing matches.
# Syntax (using UNION):
-- SELECT columns
-- FROM table1
-- LEFT JOIN table2 ON table1.common_column = table2.common_column
-- UNION
-- SELECT columns
-- FROM table1
-- RIGHT JOIN table2 ON table1.common_column = table2.common_column;

# Example: This query will return all teachers and departments, including teachers without departments and departments without teachers.
SELECT teacher.name, department.department_name
FROM teacher
LEFT JOIN department ON teacher.department_id = department.department_id
UNION
SELECT teacher.name, department.department_name
FROM teacher
RIGHT JOIN department ON teacher.department_id = department.department_id;


# 5. CROSS JOIN:
# A CROSS JOIN returns the Cartesian product of the two tables, meaning it combines every row from the first table with every row from 
# the second table. This is typically used with a WHERE clause to filter meaningful results.
# Syntax:
-- SELECT columns
-- FROM table1
-- CROSS JOIN table2;

# Example: If teacher has 10 rows and department has 5 rows, this query will return 10 * 5 = 50 rows.
SELECT teacher.name, department.department_name
FROM teacher
CROSS JOIN department;


# 6. SELF JOIN:
# A SELF JOIN is a join in which a table is joined with itself. 
# This can be useful for comparing rows within the same table.
# Syntax:
-- SELECT t1.column_name, t2.column_name
-- FROM table_name_1 as t1
-- JOIN table_name_2 as t2 ON t1.common_column = t2.common_column;