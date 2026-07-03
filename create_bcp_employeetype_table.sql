-- SQL script to create/fix bcp_employeetype table based on BcpEmployeetype.java entity
-- Run this script on your MySQL database

USE bzpayroll;

-- Drop and recreate the table with correct column names
-- WARNING: This will delete all existing data in the table
DROP TABLE IF EXISTS bcp_employeetype;

CREATE TABLE bcp_employeetype (
    EmployeeTypeID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    EmployeeType VARCHAR(50)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- If you need to preserve data and the table has wrong column names, use this instead:
-- First backup your data:
-- CREATE TABLE bcp_employeetype_backup AS SELECT * FROM bcp_employeetype;
-- 
-- Then drop and recreate:
-- DROP TABLE bcp_employeetype;
-- CREATE TABLE bcp_employeetype (
--     EmployeeTypeID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
--     EmployeeType VARCHAR(50)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
-- 
-- Then restore data (adjust column names based on your backup):
-- INSERT INTO bcp_employeetype (EmployeeType) 
-- SELECT employee_type FROM bcp_employeetype_backup;

-- Insert some sample data (optional)
INSERT INTO bcp_employeetype (EmployeeType) VALUES ('Full Time');
INSERT INTO bcp_employeetype (EmployeeType) VALUES ('Part Time');
INSERT INTO bcp_employeetype (EmployeeType) VALUES ('Contractor');

-- Verify the table structure
DESCRIBE bcp_employeetype;

