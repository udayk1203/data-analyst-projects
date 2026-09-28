-- Manufacturing Quality Analysis
-- SQL Analysis Queries


-- 1. Total Manufacturing Quantity
SELECT 
    CONCAT(FORMAT(SUM(totalqty / 1000000), 0), "M") AS Manufacture_Qty
FROM manufactured_data;


-- 2. Total Rejected Quantity
SELECT 
    CONCAT(FORMAT(SUM(rejected_qty / 1000), 0), "K") AS Rejected_Qty
FROM manufactured_data;


-- 3. Total Processed Quantity
SELECT 
    CONCAT(FORMAT(SUM(processed_qty / 1000000), 0), "M") AS Processed_Qty
FROM manufactured_data;


-- 4. Total Wastage Percentage
SELECT
    ROUND(
        SUM(rejected_qty) * 100.0 / NULLIF(SUM(processed_qty), 0),
        2
    ) AS Wastage_Percentage
FROM manufactured_data;


-- 5. Rejected and Manufactured Quantity by Employee
SELECT 
    emp_name,
    SUM(totalqty) AS Manufactured_Qty,
    SUM(rejected_qty) AS Rejected_Qty
FROM manufactured_data
GROUP BY emp_name
ORDER BY Rejected_Qty DESC;


-- 6. Rejected and Manufactured Quantity by Machine
SELECT 
    machine_code,
    SUM(totalqty) AS Manufactured_Qty,
    SUM(rejected_qty) AS Rejected_Qty
FROM manufactured_data
GROUP BY machine_code
ORDER BY Rejected_Qty DESC
LIMIT 10;


-- 7. Month-wise Manufactured and Rejected Quantity
SELECT 
    MONTHNAME(doc_date) AS Month,
    SUM(totalqty) AS Manufactured_Qty,
    SUM(rejected_qty) AS Rejected_Qty
FROM manufactured_data
GROUP BY MONTHNAME(doc_date);


-- 8. Department-wise Manufactured and Rejected Quantity
SELECT 
    department_name,
    SUM(totalqty) AS Manufactured_Qty,
    SUM(rejected_qty) AS Rejected_Qty
FROM manufactured_data
GROUP BY department_name
ORDER BY Rejected_Qty DESC;


-- 9. Brand-wise Manufactured and Rejected Quantity
SELECT 
    buyer,
    SUM(totalqty) AS Manufactured_Qty,
    SUM(rejected_qty) AS Rejected_Qty
FROM manufactured_data
GROUP BY buyer
ORDER BY Rejected_Qty DESC;
