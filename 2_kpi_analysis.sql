-- Loan Portfolio Performance Metrics (Core KPIs)
-- 1. Total Loan applications
SELECT COUNT(*) AS total_loan_applications FROM bank_loan_data;

-- 2. Month-Over-Month Application
SELECT
    MONTH(issue_date) AS month,
    COUNT(*) AS monthly_apps
FROM bank_loan_data
GROUP BY MONTH(issue_date), YEAR(issue_date)
ORDER BY YEAR(issue_date), MONTH(issue_date);

-- 3. Total Funded Amount
SELECT SUM(loan_amount) AS total_funding FROM bank_loan_data;

-- 4. Total Amount Received
SELECT SUM(total_payment) AS total_received FROM bank_loan_data;

-- 5. Avergae Interest Rate and DTI
SELECT
    CONCAT(ROUND(AVG(int_rate) * 100, 2), '%') AS avg_interest_rate,
    CONCAT(ROUND(AVG(dti) * 100, 2), '%') AS avg_dti
FROM bank_loan_data;


