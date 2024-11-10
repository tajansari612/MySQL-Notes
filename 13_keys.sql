# In MySQL, keys are special columns or sets of columns that are used to identify and establish relationships between rows in a database. 
# Keys ensure data integrity, enforce uniqueness, and optimize database performance. 
# Here’s a breakdown of the main types of keys in MySQL:


# 1. Super key:
# In MySQL, a super key is a combination of one or more columns that can uniquely identify each row in a table. 
# Super keys are a broad category that includes primary keys, candidate keys, and any additional combinations of 
# columns that provide unique identification.
# Characteristics of a Super Key:
# A super key uniquely identifies each row in a table.
# It can consist of a single column or a combination of multiple columns.
# A table can have many super keys.
# For example, a super key may contain additional columns beyond what’s necessary to uniquely identify a row, making it non-minimal. 
# Only minimal super keys are considered candidate keys.


# 2. Candidate Key:
# Purpose: Represents columns that can potentially serve as a primary key.
# Characteristics:
# A table can have multiple candidate keys.
# Each candidate key is unique, and any of them can serve as the primary key.
# The chosen candidate key becomes the primary key; others are alternate keys.
# Example:
-- In a students table, student_id and email might both be candidate keys if both are unique.


# 3. Composite Key :
# Purpose: A key made up of two or more columns that together uniquely identify each row.
# Characteristics:
# Useful when no single column is unique enough to be a primary key.
# Often used as a primary key or unique key in cases where multiple columns combined create a unique constraint.
# Example:
CREATE TABLE project_assignments (
    project_id INT,
    employee_id INT,
    PRIMARY KEY (project_id, employee_id)
);


# 4. Primary Key :
# Purpose: Uniquely identifies each row in a table.
# Characteristics:
# Cannot contain NULL values.
# Must be unique for each record.
# Each table can have only one primary key, which may consist of one or more columns (composite primary key).
# Example:
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    position VARCHAR(50)
);


# 5. Alternate Key:
# Purpose: Any candidate key not chosen as the primary key.
# Characteristics:
# Unique within the table, but not the primary key.
# Example:
-- If email is a candidate key in the students table but student_id is chosen as the primary key, email is an alternate key.
