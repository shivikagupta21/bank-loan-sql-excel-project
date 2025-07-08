-- Important Questions
-- Q1. Print top 5 States by loan amount.
SELECT address_state, SUM(loan_amount) AS total_funded
FROM bank_loan_data
GROUP BY address_state
ORDER BY total_funded DESC
LIMIT 5;

-- Q2. Print Average Loan Amount by Purpose.
SELECT purpose, AVG(loan_amount) AS avg_loan_amount
FROM bank_loan_data
GROUP BY purpose
ORDER BY avg_loan_amount DESC;

-- Q3. Print default rate by Grade.
SELECT grade,
       COUNT(CASE WHEN loan_status = 'Charged Off' THEN 1 END) * 100.0 / COUNT(*) AS default_rate
FROM bank_loan_data
GROUP BY grade;

-- Q4. Print top 5 highest risk Subgrades.
SELECT sub_grade,
       COUNT(CASE WHEN loan_status = 'Charged Off' THEN 1 END) * 100.0 / COUNT(*) AS subgrade_default_rate
FROM bank_loan_data
GROUP BY sub_grade
ORDER BY subgrade_default_rate DESC
LIMIT 5;

-- Q5. Print bad loan trends over time.
SELECT DATE_FORMAT(issue_date, '%Y-%m') AS month,
       COUNT(CASE WHEN loan_status = 'Charged Off' THEN 1 END) AS bad_loans
FROM bank_loan_data
GROUP BY month
ORDER BY month;

-- Q6. Print top 5 job titles associated with Charged Off loans.
SELECT emp_title,
       COUNT(*) AS charged_off_count
FROM bank_loan_data
WHERE loan_status = 'Charged Off'
GROUP BY emp_title
ORDER BY charged_off_count DESC
LIMIT 5;

-- Q7. Print average interest rate by Home Ownership Status
SELECT home_ownership,
       AVG(int_rate) AS avg_interest_rate
FROM bank_loan_data
GROUP BY home_ownership
ORDER BY avg_interest_rate DESC;

-- Q8. Print most common loan purpose among high DTI borrowers.
SELECT purpose, COUNT(*) AS count
FROM bank_loan_data
WHERE dti > 0.25
GROUP BY purpose
ORDER BY count DESC
LIMIT 5;

-- Q9. Print loan grade distribution for 'Current' loans only.
SELECT grade, COUNT(*) AS current_loan_count
FROM bank_loan_data
WHERE loan_status = 'Current'
GROUP BY grade
ORDER BY current_loan_count DESC;