# CRUD (Create, Read, Update, Delete) operations:
# CRUD operations in MySQL allow for basic data manipulation in a database table. 
# Below are examples of how to perform each operation using SQL syntax.

# Assumptions-- 
# Assume a table named employees with the following structure:
create database company_abc;
use company_abc;
CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    position VARCHAR(50),
    salary DECIMAL(10, 2)
);

# 1. Create (Insert)
# To create databases, tables, insert tuples in tables etc
# To add a new record to the table:
INSERT INTO employees (name, position, salary) 
VALUES ('John Doe', 'Software Engineer', 75000.00);
# This statement inserts a new employee record into the employees table.


# 2. Read (Select)
# To read data present in the database
# To retrieve data from the table:
SELECT * FROM employees;
# This retrieves all records and all columns in the employees table. You can also specify specific columns or add conditions:

SELECT name, position FROM employees WHERE salary > 60000;
# This retrieves only the names and positions of employees whose salary is greater than 60,000.


# 3. Update
# Modify already inserted data.
# To modify existing records:
UPDATE employees 
SET salary = 80000 
WHERE name = 'John Doe';
# This updates John Doe's salary to 80,000 in the employees table.


# 4. Delete
# Delete database, table or specific data point/tuple/row or multiple rows.
# To remove records from the table:
DELETE FROM employees 
WHERE name = 'John Doe';
# This deletes John Doe's record from the employees table.

