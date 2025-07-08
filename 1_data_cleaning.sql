CREATE DATABASE Bank_Loan_DB;
USE `bank_loan_db`;
SELECT * FROM bank_loan_data;

-- Data Wrangling and Transformation
-- 1. Check Column Names and Data Types
DESCRIBE bank_loan_data;

-- 2. Standardize Date fields
-- issue_date
ALTER TABLE bank_loan_data ADD COLUMN clean_issue_date DATE;
UPDATE bank_loan_data
SET clean_issue_date = STR_TO_DATE(issue_date, '%d-%m-%Y');
ALTER TABLE bank_loan_data DROP COLUMN issue_date;
ALTER TABLE bank_loan_data CHANGE clean_issue_date issue_date DATE;

-- last_payment date
ALTER TABLE bank_loan_data ADD COLUMN clean_last_payment_date DATE;
UPDATE bank_loan_data
SET clean_last_payment_date = STR_TO_DATE(last_payment_date, '%d-%m-%Y');
ALTER TABLE bank_loan_data DROP COLUMN last_payment_date;
ALTER TABLE bank_loan_data CHANGE clean_last_payment_date last_payment_date DATE;

-- last_credit_pull_date
ALTER TABLE bank_loan_data ADD COLUMN clean_last_credit_pull_date DATE;
UPDATE bank_loan_data
SET clean_last_credit_pull_date = STR_TO_DATE(last_credit_pull_date, '%d-%m-%Y');
ALTER TABLE bank_loan_data DROP COLUMN last_credit_pull_date;
ALTER TABLE bank_loan_data CHANGE clean_last_credit_pull_date last_credit_pull_date DATE;

-- next_payment_date
ALTER TABLE bank_loan_data ADD COLUMN clean_next_payment_date DATE;
UPDATE bank_loan_data
SET clean_next_payment_date = STR_TO_DATE(next_payment_date, '%d-%m-%Y');
ALTER TABLE bank_loan_data DROP COLUMN next_payment_date;
ALTER TABLE bank_loan_data CHANGE clean_next_payment_date next_payment_date DATE;

-- 3. Handle Missing or Null Values
SELECT COUNT(*) FROM bank_loan_data WHERE loan_status IS NULL;
SELECT COUNT(*) FROM bank_loan_data WHERE loan_amount IS NULL;

-- 4. Clean emp_length column
ALTER TABLE bank_loan_data ADD COLUMN emp_years INT;                 -- Add a new integer column
UPDATE bank_loan_data                                                -- Set 0 for "< 1 year"
SET emp_years = 0 
WHERE emp_length = '< 1 year';
UPDATE bank_loan_data                                                -- Set 10 for "10+ years" or anything more than 10
SET emp_years = 10 
WHERE emp_length = '10+ years';
UPDATE bank_loan_data                                                -- Extract number for values like "1 year", "2 years", ..., "9 years"
SET emp_years = CAST(SUBSTRING(emp_length, 1, 2) AS UNSIGNED)
WHERE emp_length REGEXP '^[0-9]+ year';

-- 5. Remove Duplicates
SELECT id, COUNT(*) FROM bank_loan_data GROUP BY id HAVING COUNT(*) > 1;

-- 6. Trim Whitespace in Text column
UPDATE bank_loan_data SET emp_title = TRIM(emp_title);
UPDATE bank_loan_data SET purpose = TRIM(purpose);

-- 7. Create Derived Columns
-- Year-Month Column:
ALTER TABLE bank_loan_data ADD COLUMN issue_month VARCHAR(7);
UPDATE bank_loan_data SET issue_month = DATE_FORMAT(issue_date, '%Y-%m');

-- Good/Bad Loan Tag:
ALTER TABLE bank_loan_data ADD COLUMN loan_type VARCHAR(10);
UPDATE bank_loan_data
SET loan_type = CASE 
    WHEN loan_status IN ('Fully Paid', 'Current') THEN 'Good'
    WHEN loan_status = 'Charged Off' THEN 'Bad'
    ELSE 'Other'
END;
