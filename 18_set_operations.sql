# In MySQL, set operations allow you to combine the results of two or more SELECT queries into a single result set. 

# The main set operations in MySQL are:
# 1.UNION
# 2.UNION ALL
# 3.INTERSECT (Not directly supported in MySQL, but can be simulated)
# 4.EXCEPT (also not directly supported but can be simulated with LEFT JOIN and WHERE clauses)

# Each set operation works only if the participating queries have the same number of columns and compatible data types.

# Consider below database
create database if not exists company;
use company;

create table employees(id int primary key, name varchar(50));
insert into employees values
(1001, "Rohit"),
(1002, "Raj"),
(1003, "Kishor"),
(1004, "Nikita"),
(1005, "Sahil"),
(1006, "Sanika");
select * from employees;

create table clients(id int primary key, name varchar(50));
insert into clients values
(1001, "Rohit"),
(1002, "Raj"),
(1007, "Suresh"),
(1008, "Pooja"),
(1005, "Sahil"),
(1006, "Sanika");
select * from clients;


# 1. UNION
# The UNION operator combines the results of two or more SELECT statements, removing duplicates from the final result set.
# Syntax:
-- SELECT column1, column2 FROM table1
-- UNION
-- SELECT column1, column2 FROM table2;

# Example: This query returns a list of unique names from both employees and clients
SELECT name FROM employees
UNION
SELECT name FROM clients;


# 2. UNION ALL:
# The UNION ALL operator combines the results of two or more SELECT statements, but unlike UNION, it does not remove duplicates. 
# This operation is generally faster than UNION because it doesn’t require an extra step to remove duplicates.
# Syntax:
-- SELECT column1, column2 FROM table1
-- UNION ALL
-- SELECT column1, column2 FROM table2;

# Example: This query returns all names from both employees and clients, including duplicates if there are any.
SELECT name FROM employees
UNION ALL
SELECT name FROM clients;


# 3. INTERSECT (Simulated):
# MySQL does not directly support the INTERSECT operator. 
# However, you can simulate an INTERSECT using an INNER JOIN or by using a subquery.

# Simulating INTERSECT with INNER JOIN:
SELECT employees.name FROM employees
INNER JOIN clients ON employees.name = clients.name;

# Simulating INTERSECT with Subquery:
SELECT employees.name FROM employees
WHERE name IN (SELECT clients.name FROM clients);
# In both cases, the result will include only names that exist in both employees and clients.


# 4. EXCEPT (Simulated):
# MySQL also does not directly support the EXCEPT operator (which is known as MINUS in some databases). 
# However, you can simulate an EXCEPT operation by using a LEFT JOIN with a WHERE clause or with a subquery.

# Simulating EXCEPT with LEFT JOIN:
SELECT employees.name FROM employees
LEFT JOIN clients ON employees.name = clients.name
WHERE clients.name IS NULL;
# This query will return names that are in the employees table but not in the clients table.

# Simulating EXCEPT with Subquery:
SELECT employees.name FROM employees
WHERE name NOT IN (SELECT name FROM clients);
# This query also returns names that are in the employees table but not in the clients table.

