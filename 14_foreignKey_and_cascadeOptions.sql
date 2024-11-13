# Consider below database
drop database college;
create database if not exists college;
use college;


# Foreign Key :
# Purpose: Establishes a relationship between two tables by linking the foreign key in one table to the primary key in another.
# Characteristics:
# Helps maintain referential integrity.
# Can have NULL values unless specified as NOT NULL.
# Restricts changes in related data based on ON DELETE and ON UPDATE actions.
# Example:
CREATE TABLE course (
    id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE teacher (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    course_id INT,
    FOREIGN KEY (course_id) REFERENCES course(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

insert into course values
(101, "Science"),
(102, "Math"),
(103, "English"),
(104, "Electronics");

insert into teacher values
(101, "Taj", 102),
(102, "Raj", 104),
(103, "Pravin", 101),
(104, "Kishor", 103),
(105, "Dada", 102),
(106, "Remo", 101),
(107, "Sanika", 102);

SELECT * FROM teacher;

# IMP point
# 1. we can not add teacher with course id which is not present in course table beacause it will break the foreign key cosntraint 
insert into teacher values (105, "Ram", 105);  # Error because course id 105 is not present in course table

# Here teacher is the child table because it contains foreign key from course table which becomes a parent table.

# Cascading for Foreign Key:
# 1. ON DELETE CASCADE: 
# If a row in the parent table(course table) is deleted, all related rows in the child table(teacher table) 
# will also be deleted automatically.

# 2. ON UPDATE CASCADE: 
# If the primary key in the parent table is updated, the corresponding foreign key values in the child table 
# will also be updated automatically.

# Syntax
# To create a foreign key with cascade options, specify ON DELETE CASCADE and/or ON UPDATE CASCADE when defining the foreign key.
-- CREATE TABLE child_table (
--     child_id INT PRIMARY KEY,
--     parent_id INT,
--     FOREIGN KEY (parent_id) REFERENCES parent_table(parent_id)
--     ON DELETE CASCADE
--     ON UPDATE CASCADE
-- );

# Example for on delete cascade:
DELETE FROM course WHERE id = 102;  # It will delete a row with id = 102 from course table as well as also deletes
									# rows from teacher table with course_id = 102 which is a foreign key.
select * from course;
select * from teacher; 

# Example for on update cascade:
UPDATE course SET id = 102 WHERE name = "Science";  # It will update the row with name = "Science" and set id = 102 from course table as
													#  well as also updates rows from teacher table with course_id = 101
													# to course_id = 102 which is a foreign key.
select * from course;
select * from teacher; 

