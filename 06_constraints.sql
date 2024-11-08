# In MySQL, constraints are rules enforced on the data in a table to ensure accuracy, consistency, and integrity. 
# Constraints define certain conditions that must be met for data to be added or modified within a table.

# Types of Constraints in MySQL
# Here’s a breakdown of common constraints in MySQL:

# 1.PRIMARY KEY :
# Uniquely identifies each record in a table.
# A table can only have one primary key, and it must be unique and non-null.
# Example:
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    position VARCHAR(50)
);


# 2.FOREIGN KEY :
# Enforces a relationship between two tables by linking the foreign key in one table to the primary key in another.
# Helps maintain referential integrity.
# Example:
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100)
);

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);


# 3.UNIQUE :
# Ensures that all values in a column are unique, meaning no duplicate values are allowed in that column.
# A table can have multiple unique constraints.
# Example:
CREATE TABLE employees (
    id INT PRIMARY KEY,
    email VARCHAR(100) UNIQUE,
    name VARCHAR(100)
);


# 4.NOT NULL :
# Prevents null values from being inserted into a column, meaning the column must always have a value.
# Example:
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    position VARCHAR(50)
);


# 5.DEFAULT :
# Sets a default value for a column if no value is provided during record insertion.
# Example:
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary INT DEFAULT 50000
);


# 6.CHECK (Supported starting from MySQL 8.0.16) :
# Ensures that all values in a column satisfy a specific condition.
# Example:
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT CHECK (age >= 18),
    salary INT CHECK (salary >= 0)
);


# Using Constraints in Table Modifications
# Constraints can also be added to an existing table using the ALTER TABLE statement. For example:
ALTER TABLE employees
ADD CONSTRAINT chk_salary CHECK (salary >= 0);