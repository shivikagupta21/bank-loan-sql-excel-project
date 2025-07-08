-- Loan Repayment Behavior Analysis
-- 1. Recovery ratio (received vs funded)
SELECT 
    id,
    loan_amount,
    total_payment,
    ROUND(total_payment / loan_amount, 2) AS recovery_ratio
FROM bank_loan_data
WHERE loan_amount > 0;

-- 2. Repayment behavior by Loan Status
SELECT 
    loan_status,
    AVG(total_payment / loan_amount) AS avg_recovery_ratio
FROM bank_loan_data
WHERE loan_amount > 0
GROUP BY loan_status;

-- 3. Slow vs fast repayers (Custom Segmentation)
SELECT 
    CASE 
        WHEN total_payment / loan_amount >= 0.95 THEN 'Fully Repaid'
        WHEN total_payment / loan_amount BETWEEN 0.5 AND 0.95 THEN 'Partial Repayer'
        ELSE 'Low Repayer'
    END AS repayment_behavior,
    COUNT(*) AS borrower_count
FROM bank_loan_data
WHERE loan_amount > 0
GROUP BY repayment_behavior;

-- 4. Repayment ratio vs Grade
SELECT 
    grade,
    AVG(total_payment / loan_amount) AS avg_recovery_ratio
FROM bank_loan_data
WHERE loan_amount > 0
GROUP BY grade
ORDER BY avg_recovery_ratio DESC;

-- 5. Recovery ratio by purpose
SELECT 
    purpose,
    ROUND(AVG(total_payment / loan_amount), 2) AS avg_recovery_ratio
FROM bank_loan_data
WHERE loan_amount > 0
GROUP BY purpose
ORDER BY avg_recovery_ratio DESC;



