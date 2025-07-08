-- Loan Data Breakdown: Regional, Temporal & Demographic Insights
-- 1. Monthly Trends
SELECT
    DATE_FORMAT(issue_date, '%Y-%m') AS month,
    COUNT(*) AS applications,
    SUM(loan_amount) AS total_funded,
    SUM(total_payment) AS total_received
FROM bank_loan_data
GROUP BY DATE_FORMAT(issue_date, '%Y-%m')
ORDER BY month;

-- 2. Regional Analysis by State
SELECT
    address_state,
    COUNT(*) AS applications,
    SUM(loan_amount) AS total_funded,
    SUM(total_payment) AS total_received
FROM bank_loan_data
GROUP BY address_state;

-- 3. Loan Term Analysis
SELECT
    term,
    COUNT(*) AS applications,
    SUM(loan_amount) AS total_funded,
    SUM(total_payment) AS total_received
FROM bank_loan_data
GROUP BY term;

-- 4. Employment Length Analysis
SELECT
    emp_length,
    COUNT(*) AS applications,
    SUM(loan_amount) AS total_funded,
    SUM(total_payment) AS total_received
FROM bank_loan_data
GROUP BY emp_length;

-- 5. Loan Purpose Breakdown
SELECT
    purpose,
    COUNT(*) AS applications,
    SUM(loan_amount) AS total_funded,
    SUM(total_payment) AS total_received
FROM bank_loan_data
GROUP BY purpose;

-- 6.  Home Ownership TreeMap
SELECT
    home_ownership,
    COUNT(*) AS applications,
    SUM(loan_amount) AS total_funded,
    SUM(total_payment) AS total_received
FROM bank_loan_data
GROUP BY home_ownership;

-- 7. Status-Wise Grid
SELECT
    loan_status,
    COUNT(*) AS total_applications,
    SUM(loan_amount) AS total_funded,
    SUM(total_payment) AS total_received,
    AVG(int_rate) AS avg_interest_rate,
    AVG(dti) AS avg_dti
FROM bank_loan_data
GROUP BY loan_status;