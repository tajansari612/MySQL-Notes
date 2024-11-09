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

# Practice Quetions
# Question 1: write a query to find avarage marks in each city in ascending order
SELECT city, AVG(marks) as avg_marks
FROM student
GROUP BY city
ORDER BY city;

# Question 2: write a query to find avarage marks in each city in descending order by their avarage marks
SELECT city, AVG(marks) as avg_marks
FROM student
GROUP BY city
ORDER BY avg_marks DESC;

# Question 3: write a query to find total students in each city
SELECT city, COUNT(*) as total_students
FROM student
GROUP BY city;

# Question 4: write a query to find total students on basis of grade in ascending order
SELECT grade, COUNT(*) as total_students
FROM student
GROUP BY grade
ORDER BY grade;

# Question 5: write a query to find number students in each city where max marks cross 90
SELECT city, COUNT(marks) as total_students 
FROM student
GROUP BY city
HAVING max(marks) >90;
