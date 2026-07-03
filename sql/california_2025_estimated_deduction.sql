START TRANSACTION;

DELETE FROM bc_estimated_deduction
WHERE state_name = 'California' AND year = 2025;

-- TABLE 2 - ESTIMATED DEDUCTION TABLE (2025 California Withholding Schedules Method B)
-- Stores the deduction amount for ONE additional withholding allowance per payroll period.
-- Table 2 has no filing-status distinction, so all three filing-status columns hold the same value.
-- In code: multiply this by additionalAllowances count to get the total Step 2 deduction.
--
-- payroll_period ordinals: 0=DAILY, 1=WEEKLY, 2=BI_WEEKLY, 3=SEMI_MONTHLY,
--                          4=MONTHLY, 5=QUARTERLY, 6=ANNUALLY, 7=SEMI_ANNUALLY

INSERT INTO bc_estimated_deduction
    (payroll_period, single_or_multi_income, married_0_1_allowance, married_2_more_allowance, unmarried_head_of_household, state_name, year)
VALUES
    (0,     4.00,     4.00,     4.00,     4.00, 'California', 2025),
    (1,    19.00,    19.00,    19.00,    19.00, 'California', 2025),
    (2,    38.00,    38.00,    38.00,    38.00, 'California', 2025),
    (3,    42.00,    42.00,    42.00,    42.00, 'California', 2025),
    (4,    83.00,    83.00,    83.00,    83.00, 'California', 2025),
    (5,   250.00,   250.00,   250.00,   250.00, 'California', 2025),
    (6,  1040.00,  1040.00,  1040.00,  1040.00, 'California', 2025),
    (7,   520.00,   520.00,   520.00,   520.00, 'California', 2025);

COMMIT;
