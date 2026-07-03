START TRANSACTION;

DELETE FROM bc_standard_deduction
WHERE state_name = 'California' AND year = 2024;

DELETE FROM bc_exemption_allowance
WHERE state = 'California' AND year = 2024;

INSERT INTO bc_standard_deduction (
    payroll_period,
    single_or_multi_income,
    married_0_1_allowance,
    married_2_more_allowance,
    unmarried_head_of_household,
    state_name,
    year
) VALUES
    (0, 21.00, 21.00, 41.00, 41.00, 'California', 2024),
    (1, 103.00, 103.00, 206.00, 206.00, 'California', 2024),
    (2, 206.00, 206.00, 413.00, 413.00, 'California', 2024),
    (3, 223.00, 223.00, 447.00, 447.00, 'California', 2024),
    (4, 447.00, 447.00, 894.00, 894.00, 'California', 2024),
    (5, 1341.00, 1341.00, 2682.00, 2682.00, 'California', 2024),
    (6, 5363.00, 5363.00, 10726.00, 10726.00, 'California', 2024),
    (7, 2682.00, 2682.00, 5363.00, 5363.00, 'California', 2024);

INSERT INTO bc_exemption_allowance (
    allowance_at_least,
    weekly,
    bi_weekly,
    semi_monthly,
    monthly,
    quarterly,
    semi_annual,
    annual,
    daily,
    state,
    year
) VALUES
    (0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'California', 2024),
    (1, 3.05, 6.09, 6.60, 13.20, 39.60, 79.20, 158.40, 0.61, 'California', 2024),
    (2, 6.09, 12.18, 13.20, 26.40, 79.20, 158.40, 316.80, 1.22, 'California', 2024),
    (3, 9.14, 18.28, 19.80, 39.60, 118.80, 237.60, 475.20, 1.83, 'California', 2024),
    (4, 12.18, 24.37, 26.40, 52.80, 158.40, 316.80, 633.60, 2.44, 'California', 2024),
    (5, 15.23, 30.46, 33.00, 66.00, 198.00, 396.00, 792.00, 3.05, 'California', 2024),
    (6, 18.28, 36.55, 39.60, 79.20, 237.60, 475.20, 950.40, 3.66, 'California', 2024),
    (7, 21.32, 42.65, 46.20, 92.40, 277.20, 554.40, 1108.80, 4.26, 'California', 2024),
    (8, 24.37, 48.74, 52.80, 105.60, 316.80, 633.60, 1267.20, 4.87, 'California', 2024),
    (9, 27.42, 54.83, 59.40, 118.80, 356.40, 712.80, 1425.60, 5.48, 'California', 2024),
    (10, 30.46, 60.92, 66.00, 132.00, 396.00, 792.00, 1584.00, 6.09, 'California', 2024);

COMMIT;
