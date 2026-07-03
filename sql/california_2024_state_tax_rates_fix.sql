START TRANSACTION;

DELETE FROM bc_state_tax_rate
WHERE state_name = 'California' AND year = 2024;

-- TABLE 5 - TAX RATE TABLE (2024 California Withholding Schedules Method B)
-- Annual brackets only (payroll_period = 6 = ANNUALLY ordinal).
-- Code annualizes per-period taxable income before lookup, then divides the resulting annual tax
-- by the frequency number to get the per-period withholding amount.
--
-- Rates for the first five brackets are 1.1%, 2.2%, 4.4%, 6.6%, 8.8% (confirmed by EDD Method B
-- Example B: biweekly $800–$1,900 bracket at 2.2% + $8.80 accumulated, where $8.80 = $800 × 1.1%).
-- Higher brackets remain at the standard CA PIT rates: 9.3%, 10.3%, 11.3%, 12.3%, 13.3%.
--
-- plus = cumulative tax from all lower brackets (progressive accumulation).
--
-- filing_status ordinals (from FilingStatus enum):
--   0 = MARRIED_FILING_JOINTLY
--   1 = HEAD_OF_HOUSEHOLD
--   2 = SINGLE_OR_MARRIED_FILING_SEPARATELY

INSERT INTO bc_state_tax_rate
    (filing_status, payroll_period, `over`, not_over, plus, tax_rate, state_name, year)
VALUES

-- MARRIED_FILING_JOINTLY (filing_status = 0)
(0, 6,        0.00,   20824.00,       0.00,  1.1, 'California', 2024),
(0, 6,    20824.00,   49368.00,     229.06,  2.2, 'California', 2024),
(0, 6,    49368.00,   77918.00,     857.03,  4.4, 'California', 2024),
(0, 6,    77918.00,  108162.00,    2113.23,  6.6, 'California', 2024),
(0, 6,   108162.00,  136700.00,    4109.33,  8.8, 'California', 2024),
(0, 6,   136700.00,  698274.00,    6620.67,  9.3, 'California', 2024),
(0, 6,   698274.00,  837922.00,   58847.05, 10.3, 'California', 2024),
(0, 6,   837922.00, 1000000.00,   73230.79, 11.3, 'California', 2024),
(0, 6,  1000000.00, 1396542.00,   91545.60, 12.3, 'California', 2024),
(0, 6,  1396542.00, 9999999.00,  140320.27, 13.3, 'California', 2024),

-- HEAD_OF_HOUSEHOLD (filing_status = 1)
(1, 6,        0.00,   21527.00,       0.00,  1.1, 'California', 2024),
(1, 6,    21527.00,   51000.00,     236.80,  2.2, 'California', 2024),
(1, 6,    51000.00,   65744.00,     885.21,  4.4, 'California', 2024),
(1, 6,    65744.00,   81364.00,    1533.95,  6.6, 'California', 2024),
(1, 6,    81364.00,   96107.00,    2564.87,  8.8, 'California', 2024),
(1, 6,    96107.00,  490493.00,    3862.25,  9.3, 'California', 2024),
(1, 6,   490493.00,  588593.00,   40540.15, 10.3, 'California', 2024),
(1, 6,   588593.00,  980987.00,   50644.45, 11.3, 'California', 2024),
(1, 6,   980987.00, 9999999.00,   94984.97, 12.3, 'California', 2024),

-- SINGLE_OR_MARRIED_FILING_SEPARATELY (filing_status = 2)
(2, 6,        0.00,   10412.00,       0.00,  1.1, 'California', 2024),
(2, 6,    10412.00,   24684.00,     114.53,  2.2, 'California', 2024),
(2, 6,    24684.00,   38959.00,     428.51,  4.4, 'California', 2024),
(2, 6,    38959.00,   54081.00,    1056.61,  6.6, 'California', 2024),
(2, 6,    54081.00,   68350.00,    2054.66,  8.8, 'California', 2024),
(2, 6,    68350.00,  349137.00,    3310.33,  9.3, 'California', 2024),
(2, 6,   349137.00,  418961.00,   29423.52, 10.3, 'California', 2024),
(2, 6,   418961.00,  698271.00,   36615.39, 11.3, 'California', 2024),
(2, 6,   698271.00, 1000000.00,   68177.42, 12.3, 'California', 2024),
(2, 6,  1000000.00, 9999999.00,  105290.09, 13.3, 'California', 2024);

COMMIT;
