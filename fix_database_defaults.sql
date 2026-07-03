-- SQL script to add default values to bcp_employee table columns
-- Run this script on your MySQL database to fix the "doesn't have a default value" errors

USE bzpayroll;

-- CRITICAL: Fix field1099 (bit field) - this is causing the error!
ALTER TABLE bcp_employee 
MODIFY COLUMN field1099 BIT(1) DEFAULT 0;

-- Fix other bit fields that are NOT NULL without defaults
ALTER TABLE bcp_employee 
MODIFY COLUMN fulTime BIT(1) DEFAULT 0,
MODIFY COLUMN overtimeApplied BIT(1) DEFAULT 0,
MODIFY COLUMN partTime BIT(1) DEFAULT 0;

-- Fix other NOT NULL fields without defaults
ALTER TABLE bcp_employee 
MODIFY COLUMN sortBy INT DEFAULT 0,
MODIFY COLUMN sr INT DEFAULT 0,
MODIFY COLUMN EmployeeIndexID INT DEFAULT 0;

-- Add default value to field_1099 column (varchar version)
ALTER TABLE bcp_employee 
MODIFY COLUMN field_1099 VARCHAR(255) DEFAULT 'No';

-- Add default values to other columns that might cause issues
ALTER TABLE bcp_employee 
MODIFY COLUMN allowed_url VARCHAR(255) DEFAULT 'No',
MODIFY COLUMN website_access VARCHAR(255) DEFAULT 'No',
MODIFY COLUMN time_clock_access VARCHAR(255) DEFAULT 'No',
MODIFY COLUMN w2_submitted VARCHAR(255) DEFAULT 'No',
MODIFY COLUMN is_deleted VARCHAR(255) DEFAULT 'No',
MODIFY COLUMN full_time VARCHAR(255) DEFAULT 'No',
MODIFY COLUMN part_time VARCHAR(255) DEFAULT 'No';

-- Set default for boolean columns
ALTER TABLE bcp_employee 
MODIFY COLUMN hourly BOOLEAN DEFAULT FALSE,
MODIFY COLUMN daily BOOLEAN DEFAULT FALSE,
MODIFY COLUMN salary BOOLEAN DEFAULT FALSE;

-- Verify the changes
DESCRIBE bcp_employee;

