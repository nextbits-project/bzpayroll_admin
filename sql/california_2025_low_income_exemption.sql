START TRANSACTION;

DELETE FROM bc_low_income_exemption
WHERE state_name = 'California' AND year = 2025;

-- TABLE 1 - LOW INCOME EXEMPTION TABLE (2025 California Withholding Schedules Method B)
-- payroll_period ordinals: 0=DAILY, 1=WEEKLY, 2=BI_WEEKLY, 3=SEMI_MONTHLY,
--                          4=MONTHLY, 5=QUARTERLY, 6=ANNUALLY, 7=SEMI_ANNUALLY
-- Columns: single_or_multi_income, married_0_1_allowance, married_2_more_allowance, unmarried_head_of_household

INSERT INTO bc_low_income_exemption
    (payroll_period, single_or_multi_income, married_0_1_allowance, married_2_more_allowance, unmarried_head_of_household, state_name, year)
VALUES
    (0,    71.00,    71.00,   137.00,   137.00, 'California', 2025),
    (1,   353.00,   353.00,   706.00,   706.00, 'California', 2025),
    (2,   706.00,   706.00,  1367.00,  1367.00, 'California', 2025),
    (3,   765.00,   765.00,  1531.00,  1531.00, 'California', 2025),
    (4,  1531.00,  1531.00,  2962.00,  2962.00, 'California', 2025),
    (5,  4592.00,  4592.00,  9184.00,  9184.00, 'California', 2025),
    (6, 18368.00, 18368.00, 36736.00, 36736.00, 'California', 2025),
    (7,  9184.00,  9184.00, 18368.00, 18368.00, 'California', 2025);

COMMIT;
