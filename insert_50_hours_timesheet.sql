-- SQL Script to Insert 50 Hours of Work Time Log into Timesheet
-- This script distributes 50 hours across 7 days (one week)
-- Each day uses all 8 work periods (start_work_1 through start_work_8 and end_work_1 through end_work_8)
-- Adjust the employee_id and work_date_start as needed


-- ============================================
-- CONFIGURATION: Update these values as needed
-- ============================================
SET @employee_id = 1;  -- Change this to your employee ID
SET @work_date_start = '2026-02-02';  -- Start date (Sunday of the week)
SET @total_hours = 50.00;  -- Total hours to distribute

-- ============================================
-- DISTRIBUTION: 50 hours across 7 days
-- Day 1-5: 8 hours each = 40 hours
-- Day 6: 7 hours = 7 hours  
-- Day 7: 3 hours = 3 hours
-- Total: 50 hours
-- Each day uses all 8 work periods
-- ============================================

-- Day 1 (Sunday) - 8 hours distributed across 8 work periods
INSERT INTO employee_timesheet (
    row_no, employee_id, work_date,
    start_work_1, end_work_1,
    start_work_2, end_work_2,
    start_work_3, end_work_3,
    start_work_4, end_work_4,
    start_work_5, end_work_5,
    start_work_6, end_work_6,
    start_work_7, end_work_7,
    start_work_8, end_work_8,
    break_minutes, total_hours
) VALUES (
    1, @employee_id, DATE(@work_date_start),
    TIME('08:00:00'), TIME('08:30:00'),  -- Period 1: 0.5 hours
    TIME('08:30:00'), TIME('09:00:00'),  -- Period 2: 0.5 hours
    TIME('09:00:00'), TIME('10:00:00'),  -- Period 3: 1 hour
    TIME('10:00:00'), TIME('11:00:00'),  -- Period 4: 1 hour
    TIME('11:00:00'), TIME('12:00:00'),  -- Period 5: 1 hour
    TIME('12:00:00'), TIME('13:00:00'),  -- Period 6: 1 hour (break period)
    TIME('13:00:00'), TIME('15:00:00'),  -- Period 7: 2 hours
    TIME('15:00:00'), TIME('17:00:00'),  -- Period 8: 2 hours
    TIME('01:00:00'), TIME('08:00:00')   -- Break: 1 hour, Total: 8 hours
);

-- Day 2 (Monday) - 8 hours distributed across 8 work periods
INSERT INTO employee_timesheet (
    row_no, employee_id, work_date,
    start_work_1, end_work_1,
    start_work_2, end_work_2,
    start_work_3, end_work_3,
    start_work_4, end_work_4,
    start_work_5, end_work_5,
    start_work_6, end_work_6,
    start_work_7, end_work_7,
    start_work_8, end_work_8,
    break_minutes, total_hours
) VALUES (
    2, @employee_id, DATE_ADD(@work_date_start, INTERVAL 1 DAY),
    TIME('09:00:00'), TIME('09:30:00'),  -- Period 1: 0.5 hours
    TIME('09:30:00'), TIME('10:30:00'),  -- Period 2: 1 hour
    TIME('10:30:00'), TIME('11:30:00'),  -- Period 3: 1 hour
    TIME('11:30:00'), TIME('12:30:00'),  -- Period 4: 1 hour
    TIME('12:30:00'), TIME('13:30:00'),  -- Period 5: 1 hour (break period)
    TIME('13:30:00'), TIME('14:30:00'),  -- Period 6: 1 hour
    TIME('14:30:00'), TIME('16:00:00'),  -- Period 7: 1.5 hours
    TIME('16:00:00'), TIME('18:00:00'),  -- Period 8: 2 hours
    TIME('01:00:00'), TIME('08:00:00')   -- Break: 1 hour, Total: 8 hours
);

-- Day 3 (Tuesday) - 8 hours distributed across 8 work periods
INSERT INTO employee_timesheet (
    row_no, employee_id, work_date,
    start_work_1, end_work_1,
    start_work_2, end_work_2,
    start_work_3, end_work_3,
    start_work_4, end_work_4,
    start_work_5, end_work_5,
    start_work_6, end_work_6,
    start_work_7, end_work_7,
    start_work_8, end_work_8,
    break_minutes, total_hours
) VALUES (
    3, @employee_id, DATE_ADD(@work_date_start, INTERVAL 2 DAY),
    TIME('08:30:00'), TIME('09:00:00'),  -- Period 1: 0.5 hours
    TIME('09:00:00'), TIME('09:30:00'),  -- Period 2: 0.5 hours
    TIME('09:30:00'), TIME('10:30:00'),  -- Period 3: 1 hour
    TIME('10:30:00'), TIME('11:30:00'),  -- Period 4: 1 hour
    TIME('11:30:00'), TIME('12:30:00'),  -- Period 5: 1 hour
    TIME('12:30:00'), TIME('13:30:00'),  -- Period 6: 1 hour (break period)
    TIME('13:30:00'), TIME('15:00:00'),  -- Period 7: 1.5 hours
    TIME('15:00:00'), TIME('17:30:00'),  -- Period 8: 2.5 hours
    TIME('01:00:00'), TIME('08:00:00')   -- Break: 1 hour, Total: 8 hours
);

-- Day 4 (Wednesday) - 8 hours distributed across 8 work periods
INSERT INTO employee_timesheet (
    row_no, employee_id, work_date,
    start_work_1, end_work_1,
    start_work_2, end_work_2,
    start_work_3, end_work_3,
    start_work_4, end_work_4,
    start_work_5, end_work_5,
    start_work_6, end_work_6,
    start_work_7, end_work_7,
    start_work_8, end_work_8,
    break_minutes, total_hours
) VALUES (
    4, @employee_id, DATE_ADD(@work_date_start, INTERVAL 3 DAY),
    TIME('07:00:00'), TIME('07:30:00'),  -- Period 1: 0.5 hours
    TIME('07:30:00'), TIME('08:30:00'),  -- Period 2: 1 hour
    TIME('08:30:00'), TIME('09:30:00'),  -- Period 3: 1 hour
    TIME('09:30:00'), TIME('10:30:00'),  -- Period 4: 1 hour
    TIME('10:30:00'), TIME('11:00:00'),  -- Period 5: 0.5 hours
    TIME('11:00:00'), TIME('12:00:00'),  -- Period 6: 1 hour (break period)
    TIME('12:00:00'), TIME('13:00:00'),  -- Period 7: 1 hour
    TIME('13:00:00'), TIME('16:00:00'),  -- Period 8: 3 hours
    TIME('01:00:00'), TIME('08:00:00')   -- Break: 1 hour, Total: 8 hours
);

-- Day 5 (Thursday) - 8 hours distributed across 8 work periods
INSERT INTO employee_timesheet (
    row_no, employee_id, work_date,
    start_work_1, end_work_1,
    start_work_2, end_work_2,
    start_work_3, end_work_3,
    start_work_4, end_work_4,
    start_work_5, end_work_5,
    start_work_6, end_work_6,
    start_work_7, end_work_7,
    start_work_8, end_work_8,
    break_minutes, total_hours
) VALUES (
    5, @employee_id, DATE_ADD(@work_date_start, INTERVAL 4 DAY),
    TIME('09:30:00'), TIME('10:00:00'),  -- Period 1: 0.5 hours
    TIME('10:00:00'), TIME('10:30:00'),  -- Period 2: 0.5 hours
    TIME('10:30:00'), TIME('11:30:00'),  -- Period 3: 1 hour
    TIME('11:30:00'), TIME('12:30:00'),  -- Period 4: 1 hour
    TIME('12:30:00'), TIME('13:30:00'),  -- Period 5: 1 hour (break period)
    TIME('13:30:00'), TIME('14:30:00'),  -- Period 6: 1 hour
    TIME('14:30:00'), TIME('16:00:00'),  -- Period 7: 1.5 hours
    TIME('16:00:00'), TIME('18:30:00'),  -- Period 8: 2.5 hours
    TIME('01:00:00'), TIME('08:00:00')   -- Break: 1 hour, Total: 8 hours
);

-- Day 6 (Friday) - 7 hours distributed across 8 work periods
INSERT INTO employee_timesheet (
    row_no, employee_id, work_date,
    start_work_1, end_work_1,
    start_work_2, end_work_2,
    start_work_3, end_work_3,
    start_work_4, end_work_4,
    start_work_5, end_work_5,
    start_work_6, end_work_6,
    start_work_7, end_work_7,
    start_work_8, end_work_8,
    break_minutes, total_hours
) VALUES (
    6, @employee_id, DATE_ADD(@work_date_start, INTERVAL 5 DAY),
    TIME('10:00:00'), TIME('10:30:00'),  -- Period 1: 0.5 hours
    TIME('10:30:00'), TIME('11:00:00'),  -- Period 2: 0.5 hours
    TIME('11:00:00'), TIME('11:30:00'),  -- Period 3: 0.5 hours
    TIME('11:30:00'), TIME('12:00:00'),  -- Period 4: 0.5 hours
    TIME('12:00:00'), TIME('13:00:00'),  -- Period 5: 1 hour (break period)
    TIME('13:00:00'), TIME('14:00:00'),  -- Period 6: 1 hour
    TIME('14:00:00'), TIME('16:00:00'),  -- Period 7: 2 hours
    TIME('16:00:00'), TIME('18:00:00'),  -- Period 8: 2 hours
    TIME('01:00:00'), TIME('07:00:00')   -- Break: 1 hour, Total: 7 hours
);

-- Day 7 (Saturday) - 3 hours distributed across 8 work periods
INSERT INTO employee_timesheet (
    row_no, employee_id, work_date,
    start_work_1, end_work_1,
    start_work_2, end_work_2,
    start_work_3, end_work_3,
    start_work_4, end_work_4,
    start_work_5, end_work_5,
    start_work_6, end_work_6,
    start_work_7, end_work_7,
    start_work_8, end_work_8,
    break_minutes, total_hours
) VALUES (
    7, @employee_id, DATE_ADD(@work_date_start, INTERVAL 6 DAY),
    TIME('09:00:00'), TIME('09:15:00'),  -- Period 1: 0.25 hours
    TIME('09:15:00'), TIME('09:30:00'),  -- Period 2: 0.25 hours
    TIME('09:30:00'), TIME('10:00:00'),  -- Period 3: 0.5 hours
    TIME('10:00:00'), TIME('10:30:00'),  -- Period 4: 0.5 hours
    TIME('10:30:00'), TIME('11:00:00'),  -- Period 5: 0.5 hours
    TIME('11:00:00'), TIME('11:30:00'),  -- Period 6: 0.5 hours
    TIME('11:30:00'), TIME('12:00:00'),  -- Period 7: 0.5 hours
    TIME('12:00:00'), TIME('12:00:00'),  -- Period 8: 0 hours (no work)
    TIME('00:00:00'), TIME('03:00:00')   -- No break, Total: 3 hours
);

-- ============================================
-- VERIFICATION: Check total hours inserted
-- ============================================
-- This query calculates total hours by converting TIME to seconds, then to hours
SELECT 
    employee_id,
    SUM(TIME_TO_SEC(total_hours) / 3600.0) AS total_hours_decimal,
    SEC_TO_TIME(SUM(TIME_TO_SEC(total_hours))) AS total_hours_time_format,
    COUNT(*) AS days_worked
FROM employee_timesheet
WHERE employee_id = @employee_id
  AND work_date >= @work_date_start
  AND work_date <= DATE_ADD(@work_date_start, INTERVAL 6 DAY)
GROUP BY employee_id;

-- View all inserted records with all 8 work periods
SELECT 
    id, row_no, employee_id, work_date,
    start_work_1, end_work_1, 
    start_work_2, end_work_2,
    start_work_3, end_work_3,
    start_work_4, end_work_4,
    start_work_5, end_work_5,
    start_work_6, end_work_6,
    start_work_7, end_work_7,
    start_work_8, end_work_8,
    break_minutes, total_hours,
    TIME_TO_SEC(total_hours) / 3600.0 AS hours_decimal
FROM employee_timesheet
WHERE employee_id = @employee_id
  AND work_date >= @work_date_start
  AND work_date <= DATE_ADD(@work_date_start, INTERVAL 6 DAY)
ORDER BY work_date;

-- ============================================
-- ALTERNATIVE: If you want to delete existing entries first
-- ============================================
-- DELETE FROM employee_timesheet 
-- WHERE employee_id = @employee_id
--   AND work_date >= @work_date_start
--   AND work_date <= DATE_ADD(@work_date_start, INTERVAL 6 DAY);
