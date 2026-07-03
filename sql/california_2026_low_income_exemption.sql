START TRANSACTION;

DELETE FROM bc_low_income_exemption
WHERE state_name = 'California' AND year = 2026;

-- TABLE 1 - LOW INCOME EXEMPTION TABLE (2026 California Withholding Schedules Method B)
-- payroll_period ordinals: 0=DAILY, 1=WEEKLY, 2=BI_WEEKLY, 3=SEMI_MONTHLY,
--                          4=MONTHLY, 5=QUARTERLY, 6=ANNUALLY, 7=SEMI_ANNUALLY
-- Columns: single_or_multi_income, married_0_1_allowance, married_2_more_allowance, unmarried_head_of_household

INSERT INTO bc_low_income_exemption
    (payroll_period, single_or_multi_income, married_0_1_allowance, married_2_more_allowance, unmarried_head_of_household, state_name, year)
VALUES
    (0,    73.00,    73.00,   137.00,   137.00, 'California', 2026),
    (1,   363.00,   363.00,   727.00,   727.00, 'California', 2026),
    (2,   727.00,   727.00,  1367.00,  1367.00, 'California', 2026),
    (3,   787.00,   787.00,  1575.00,  1575.00, 'California', 2026),
    (4,  1575.00,  1575.00,  2962.00,  2962.00, 'California', 2026),
    (5,  4724.00,  4724.00,  9448.00,  9448.00, 'California', 2026),
    (6, 18896.00, 18896.00, 37791.00, 37791.00, 'California', 2026),
    (7,  9448.00,  9448.00, 18896.00, 18896.00, 'California', 2026);

COMMIT;
