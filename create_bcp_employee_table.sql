-- SQL script to create bcp_employee table based on BcpEmployee.java entity
-- Run this script on your MySQL database

USE bzpayroll;

DROP TABLE IF EXISTS bcp_employee;

CREATE TABLE bcp_employee (
    EmployeeID INT NOT NULL PRIMARY KEY,
    firstName VARCHAR(255),
    lastName VARCHAR(255),
    ssn VARCHAR(255) UNIQUE,
    address1 VARCHAR(255),
    address2 VARCHAR(255),
    city VARCHAR(255),
    state VARCHAR(255),
    province VARCHAR(255),
    country VARCHAR(255),
    zipCode VARCHAR(255),
    phone VARCHAR(255),
    cellPhone VARCHAR(255),
    email VARCHAR(255),
    amount DECIMAL(19, 2),
    allowance INT,
    dateof_birth DATETIME(6),
    date_added DATETIME(6),
    date_started DATETIME(6),
    date_terminated DATETIME(6),
    hourly BOOLEAN DEFAULT FALSE,
    daily BOOLEAN DEFAULT FALSE,
    salary BOOLEAN DEFAULT FALSE,
    title VARCHAR(255),
    mi VARCHAR(255),
    memo VARCHAR(255),
    photo VARCHAR(255),
    payPeriod VARCHAR(255),
    password VARCHAR(255),
    fullTime VARCHAR(255) DEFAULT 'No',
    part_time VARCHAR(255) DEFAULT 'No',
    stateWorked VARCHAR(255),
    hourlyRate DOUBLE,
    monthlySalary DOUBLE,
    jobType VARCHAR(255),
    overtime_applied VARCHAR(255),
    allowed_url VARCHAR(255) DEFAULT 'No',
    website_access VARCHAR(255) DEFAULT 'No',
    time_clock_access VARCHAR(255) DEFAULT 'No',
    code_number VARCHAR(255),
    w2_submitted VARCHAR(255) DEFAULT 'No',
    field_1099 VARCHAR(255) DEFAULT 'No',
    filing_status VARCHAR(255),
    is_deleted VARCHAR(255) DEFAULT 'No',
    job_title VARCHAR(255),
    employee_status VARCHAR(255),
    dba_name VARCHAR(255),
    company_name VARCHAR(255),
    -- Bit fields (NOT NULL with defaults)
    field1099 BIT(1) NOT NULL DEFAULT 0,
    fulTime BIT(1) NOT NULL DEFAULT 0,
    partTime BIT(1) NOT NULL DEFAULT 0,
    -- Integer fields (NOT NULL with defaults)
    sortBy INT NOT NULL DEFAULT 0,
    sr INT NOT NULL DEFAULT 0,
    EmployeeIndexID INT NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Add index on ssn (already unique, but explicit index for performance)
CREATE INDEX idx_ssn ON bcp_employee(ssn);

-- Verify the table structure
DESCRIBE bcp_employee;

