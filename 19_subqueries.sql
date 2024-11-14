# In MySQL, subqueries (also known as nested queries or inner queries) are queries embedded within another query. 
# A subquery can return individual values, rows, or a complete table that can be used by the main (outer) query. 
# Subqueries are typically enclosed within parentheses and can be used in various parts of a query, like in 
# SELECT, WHERE, FROM, and HAVING clauses.

# Types of Subqueries in MySQL
# Single-Row Subqueries: Return a single value (one row and one column).
# Multiple-Row Subqueries: Return multiple rows of data but typically one column.
# Multiple-Column Subqueries: Return multiple columns, often used in the FROM clause.
# Correlated Subqueries: Refer to columns from the outer query and are re-evaluated for each row processed by the outer query.


# Consider below database
drop database if exists company;
create database if not exists company;
use company;

create table employees(id int primary key, name varchar(50), salary int, dept_id int);
insert into employees values
(1001, "Rohit", 30000, 2004),
(1002, "Raj", 25000, 2002),
(1003, "Kishor", 35000, 2003),
(1004, "Nikita", 40000, 2001),
(1005, "Sahil", 20000, 2003),
(1006, "Sanika", 50000, 2004);
select * from employees;

create table departments(dept_id int primary key, name varchar(50), location varchar(30), budget int);
insert into departments values
(2001, "HR", "New York", 400000),
(2002, "CEO", "USA", 700000),
(2003, "Administration", "Japan", 900000),
(2004, "Server", "Kolkata", 200000);
select * from departments;


# Examples of Subqueries:
# 1. Subquery in the WHERE Clause:
# Subqueries are often used in the WHERE clause to filter data based on results from another query.
# Example: Find all employees who work in the department with the highest budget.
SELECT name
FROM employees
WHERE dept_id = (SELECT dept_id FROM departments ORDER BY budget DESC LIMIT 1);
-- Here, the subquery (SELECT dept_id FROM departments ORDER BY budget DESC LIMIT 1) finds the dept_id with the highest budget.
-- The main query then returns the names of employees who belong to this department.


# 2. Subquery with IN in the WHERE Clause:
# A subquery can also return multiple rows, which can be handled using IN.
# Example: Find employees who are in departments located in New York.
SELECT name
FROM employees
WHERE dept_id IN (SELECT dept_id FROM departments WHERE location = 'New York');
-- The subquery returns all dept_ids for departments in New York.
-- The main query returns employees who belong to those departments.


# 3. Subquery in the FROM Clause (Derived Table):
# Subqueries can be used in the FROM clause to create a temporary, derived table.
# Example: Calculate the average salary by department and find departments where the average salary is above $50,000.
SELECT dept_id, avg_salary
FROM (SELECT dept_id, AVG(salary) AS avg_salary FROM employees GROUP BY dept_id) AS dept_avg
WHERE avg_salary > 35000;
-- The subquery (SELECT dept_id, AVG(salary) AS avg_salary FROM employees GROUP BY dept_id) calculates the average salary per department.
-- The outer query filters to show only those departments with an average salary above $35,000.


# 4. Subquery in the SELECT Clause:
# Subqueries in the SELECT clause can return a calculated value for each row in the main query.
# Example: Display each department’s name and the number of employees present in it.
SELECT name,
       (SELECT COUNT(*) FROM employees WHERE employees.dept_id = departments.dept_id) AS emp_count
FROM departments;
-- The subquery (SELECT COUNT(*) FROM employees WHERE employees.dept_id = departments.dept_id) counts the number of employees 
-- for each department.
-- The main query displays the department’s name and their employees count.


# 5. Correlated Subqueries:
# A correlated subquery depends on the outer query and is executed once for each row processed by the outer query.
# Example: Find employees who earn more than the average salary in their department.
SELECT name, salary
FROM employees e1
WHERE salary > (SELECT AVG(salary) FROM employees e2 WHERE e1.dept_id = e2.dept_id);
-- The subquery (SELECT AVG(salary) FROM employees e2 WHERE e1.dept_id = e2.dept_id) calculates the average salary 
-- for the department of each employee.
-- The main query then checks if the employee’s salary is greater than the department’s average.

