# ALTER command
# The ALTER keyword in MySQL is used to modify the structure of an existing table. 
# You can use it to add, delete, or modify columns; add or drop constraints; and rename columns or the table itself. 
# The ALTER keyword is useful for making structural changes to a table without dropping and recreating it.

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

# Common Uses of ALTER in MySQL
# 1. Add a New Column:
# You can use ALTER to add new columns to an existing table.
# Syntax:
-- ALTER TABLE table_name
-- ADD column_name column_definition;

# Example: Add a new column called age to the student table.
ALTER TABLE student
ADD age int;
desc student;


# 2. Delete a Column:
# You can remove a column from a table using the DROP COLUMN clause.
# Syntax:
-- ALTER TABLE table_name
-- DROP COLUMN column_name;

# Example: Remove the age column from the student table.
ALTER TABLE student
DROP COLUMN age;
desc student;


# 3. Modify a Column:
# You can change a column's data type, default value, or other properties.
# Syntax:
-- ALTER TABLE table_name
-- MODIFY COLUMN column_name new_definition;

# Examplec 1: Change the name column’s varchar(50) to varchar(100).
ALTER TABLE student
MODIFY COLUMN name varchar(100);
desc student;

# Example 2: Change the name column’s data type to DECIMAL(10,2).
ALTER TABLE student
MODIFY COLUMN Marks DECIMAL(10,2);
desc student;


# 4. Rename a Column :
# You can rename a column in the table.
# Syntax:
-- ALTER TABLE table_name
-- CHANGE old_column_name new_column_name column_definition;

# Example: Rename the City column to Address.
ALTER TABLE student
CHANGE City Address varchar(20);
desc student;


# 5. Rename the Table :
# You can rename an entire table.
# Syntax:
-- ALTER TABLE old_table_name
-- RENAME TO new_table_name;

# Example: Rename the student table to student_info.
ALTER TABLE student
RENAME TO student_info;
desc student_info;


# 6. Add Constraints:
# You can use ALTER to add constraints like UNIQUE, PRIMARY KEY, or FOREIGN KEY to existing tables.
# Syntax:
-- ALTER TABLE table_name
-- ADD CONSTRAINT constraint_name constraint_definition;

# Example: Add a unique constraint to the Name column.
ALTER TABLE student_info
ADD CONSTRAINT Name_unique
unique(Name);
desc student_info;


# 7. Drop Constraints:
# To remove constraints, use the DROP clause in the ALTER command.
# Syntax:
-- ALTER TABLE table_name
-- DROP CONSTRAINT constraint_name;

# Example: Drop the unique constraint from the Name column.
ALTER TABLE student_info
DROP index Name_not_null;
desc student_info;
