-- SQL script to create new_state_table and seed data from bca_states
-- Run this script on your MySQL database before using /settings/state-tax

USE bzpayroll;

CREATE TABLE IF NOT EXISTS new_state_table (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    StateCode VARCHAR(20),
    country_id INT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- One-time seed from current state table (safe to run repeatedly)
INSERT INTO new_state_table (id, name, StateCode, country_id)
SELECT b.id, b.name, b.StateCode, b.country_id
FROM bca_states b
WHERE NOT EXISTS (
    SELECT 1
    FROM new_state_table n
    WHERE n.id = b.id
);

-- Keep AUTO_INCREMENT ahead of current max id
SET @next_id = (SELECT COALESCE(MAX(id), 0) + 1 FROM new_state_table);
SET @sql = CONCAT('ALTER TABLE new_state_table AUTO_INCREMENT = ', @next_id);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
