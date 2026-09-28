
USE Projects

SELECT * FROM finance_1_2

SELECT * FROM finance_2_2

-- Year wise Loan Amount Stats.
SELECT YEAR(issue_d) AS Year_of_Issue,SUM(loan_amnt) AS Loan_Amount FROM finance_1_2
GROUP BY YEAR(issue_d)
ORDER BY Year_of_Issue;
 
-- Grade and Sub-grade wise Revolving Balance.
SELECT grade [Grade],sub_grade [Sub-Grade],SUM(revol_bal) [Total Balance] FROM finance_1_2
INNER JOIN finance_2_2 ON finance_1_2.id=finance_2_2.id 
GROUP BY grade, sub_grade
ORDER BY grade, sub_grade;
 
--  Total Payment for Verified status vs Total Payment for not Verified Status
SELECT finance_1_2.verification_status,CONCAT('$',FORMAT(ROUND(SUM(finance_2_2.total_pymnt)/1000000,2),'N2'),'M') AS Total_Payment
FROM finance_2_2 
INNER JOIN finance_1_2 ON finance_2_2.id=finance_1_2.id
GROUP BY finance_1_2.verification_status;

-- State wise Month wise Loan Status
SELECT State as States,last_credit_pull_d AS [Last_Credit_Month],loan_status,COUNT(loan_status) [Count of Loan] FROM finance_1_2 
INNER JOIN finance_2_2 ON finance_2_2.id=finance_1_2.id
GROUP BY State,last_credit_pull_d,loan_status
ORDER BY State,loan_status,[Count of Loan];

-- Home Ownership vs Last Payment Date Stats.
SELECT home_ownership [Home Ownership],last_pymnt_d [Last Payment Date],COUNT(home_ownership) [No.of Home Ownership] FROM finance_1_2 
INNER JOIN finance_2_2 ON finance_2_2.id=finance_1_2.id 
GROUP BY home_ownership,last_pymnt_d
ORDER BY home_ownership,last_pymnt_d;