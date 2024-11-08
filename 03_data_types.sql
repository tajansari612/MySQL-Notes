#MySQL Data Types

# 1) char : string(0-255), can store characters of fixed length
# example: column_name char(10); #creates a column that accepts strings with fixed size of 10

# 2) varchar : string(0-255), can store characters up to given length
# example: column_name varchar(50); #creates a column that accepts strings with size <= 50

# 3) blob : string(0-65535), can store binary large object 
# a MySQL data type that stores binary data, such as images, videos, and PDF files

# 4) int : integer( -2,147,483,648 to 2,147,483,647 )
# example: column_name int; #creates a column that accepts integers

# 5) tinyint : integer(-128 to 127)
# example: column_name tinyint; #creates a column that accepts integers between (-128 to 127)

# 6) bigint : integer( -9,223,372,036,854,775,808 to 9,223,372,036,854,775,807 )
# example: column_name bigint; #creates a column that accepts big integers

# 7) flost : Decimal number - with precision to 23 digits
# example: column_name float; #creates a column that accepts decimal values upto 23 digits

# 8) double : Decimal number - with 24 to 53 digits
# example: column_name double; #creates a column that accepts decimal values upto 53 digits

# 9) boolean : Boolean values 0 or 1 
# example: column_name boolean; #creates a column that accepts boolean values 1 or 0

# 10) date : date in format of YYYY-MM-DD ranging from 1000-01-01 to 9999-12-31
# example: column_name date; #creates a column that accepts date in YYYY-MM-DD format

# 11) time : time in format of HH:MM:SS
# example: column_name time; #creates a column that accepts time in HH:MM:SS format

# 12) time : year in 4 digits format ranging from 1901 to 2155
# example: column_name year; #creates a column that accepts years in 4 digit format

# 13) bit : can store x-bit values. x can range from 1 to 64
# example: column_name bit(2); #creates a column that accepts 2 bits