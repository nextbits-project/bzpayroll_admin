START TRANSACTION;

DELETE FROM bc_low_income_exemption
WHERE state_name = 'California' AND year = 2024;

-- TABLE 1 - LOW INCOME EXEMPTION TABLE (2024 California Withholding Schedules Method B)
-- payroll_period ordinals: 0=DAILY, 1=WEEKLY, 2=BI_WEEKLY, 3=SEMI_MONTHLY,
--                          4=MONTHLY, 5=QUARTERLY, 6=ANNUALLY, 7=SEMI_ANNUALLY
-- Columns: single_or_multi_income, married_0_1_allowance, married_2_more_allowance, unmarried_head_of_household

INSERT INTO bc_low_income_exemption
    (payroll_period, single_or_multi_income, married_0_1_allowance, married_2_more_allowance, unmarried_head_of_household, state_name, year)
VALUES
    (0,    68.00,    68.00,   137.00,   137.00, 'California', 2024),
    (1,   342.00,   342.00,   683.00,   683.00, 'California', 2024),
    (2,   683.00,   683.00,  1367.00,  1367.00, 'California', 2024),
    (3,   740.00,   740.00,  1481.00,  1481.00, 'California', 2024),
    (4,  1481.00,  1481.00,  2962.00,  2962.00, 'California', 2024),
    (5,  4442.00,  4442.00,  8885.00,  8885.00, 'California', 2024),
    (6, 17769.00, 17769.00, 35538.00, 35538.00, 'California', 2024),
    (7,  8885.00,  8885.00, 17769.00, 17769.00, 'California', 2024);

COMMIT;
