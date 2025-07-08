-- Loan Performance Analysis: Good vs Bad Loans
-- 1. Good Loan % & Count
SELECT 
    COUNT(*) * 100.0 / (SELECT COUNT(*) FROM bank_loan_data) AS good_loan_pct,
    COUNT(*) AS good_loan_count
FROM bank_loan_data
WHERE loan_status IN ('Fully Paid', 'Current');

-- 2. Good Loan Funded & Received Amount
SELECT
    SUM(loan_amount) AS good_funded_amount,
    SUM(total_payment) AS good_received_amount
FROM bank_loan_data
WHERE loan_status IN ('Fully Paid', 'Current');

-- 3. Bad Loan % & Count
SELECT 
    COUNT(*) * 100.0 / (SELECT COUNT(*) FROM bank_loan_data) AS bad_loan_pct,
    COUNT(*) AS bad_loan_count
FROM bank_loan_data
WHERE loan_status = 'Charged Off';

-- 4. Bad Loan Funded & Received Amount
SELECT
    SUM(loan_amount) AS bad_funded_amount,
    SUM(total_payment) AS bad_received_amount
FROM bank_loan_data
WHERE loan_status = 'Charged Off';