# SQL commands are categorized into various types based on their functions. Here are the main types of SQL commands:

# 1.Data Definition Language (DDL) :
# DDL commands define and manage database structure or schema. 
# They create, modify, and delete database objects like tables, indexes, and views.

# CREATE: 
# Creates a new database or table.
# Example:
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    position VARCHAR(50)
);

# ALTER: 
# Modifies an existing table structure (adding, deleting, or modifying columns).
# Example:
ALTER TABLE employees ADD COLUMN salary INT;

# DROP: 
# Deletes an entire table or database.
# Example:
DROP TABLE employees;

# TRUNCATE: 
# Deletes all records from a table without removing the table structure.
# Example:
TRUNCATE TABLE employees;


# 2. Data Manipulation Language (DML) :
# DML commands are used to modify data within database tables.

# INSERT: 
# Adds new records to a table.
# Example:
INSERT INTO employees (id, name, position, salary) VALUES (1, 'John Doe', 'Software Engineer', 75000);

# UPDATE: 
# Modifies existing records in a table.
# Example:
UPDATE employees SET salary = 80000 WHERE id = 1;

# DELETE: 
# Removes specific records from a table.
# Example:
DELETE FROM employees WHERE id = 1;


# 3. Data Query Language (DQL)
# DQL is used to retrieve data from the database. The most common DQL command is:

# SELECT: 
#Fetches data from one or more tables.
# Example:
SELECT name, position FROM employees WHERE salary > 50000;


# 4. Data Control Language (DCL)
# DCL commands control access to data within the database. They set permissions for users.

# GRANT: 
# Gives a user access rights to the database.
# Example:
GRANT SELECT, INSERT ON employees TO 'user'@'localhost';

# REVOKE: 
# Removes access rights from a user.
# Example:
REVOKE INSERT ON employees FROM 'user'@'localhost';


# 5. Transaction Control Language (TCL)
# TCL commands manage transactions within a database, allowing for rollbacks and saves to ensure data integrity.

# COMMIT: 
# Saves all changes made during the current transaction to the database.
# Example:
COMMIT;

# ROLLBACK: 
# Reverts all changes made during the current transaction.
# Example:
ROLLBACK;

# SAVEPOINT: 
#Sets a point within a transaction to which you can later roll back.
#Example:
SAVEPOINT sp1;

# RELEASE SAVEPOINT: 
# Removes a savepoint in a transaction.
# Example:
RELEASE SAVEPOINT sp1;

# SET TRANSACTION: 
# Sets transaction properties like isolation level.
# Example:
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;