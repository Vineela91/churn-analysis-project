--CREATE OR REPLACE TABLE `project1-448917.bank_churn.churned_customers` AS
 SELECT 
    Geography,
    Age,
    Active_Status, 
    ROUND(Balance, 2) AS Balance,  
    'Churned' AS Churn_Status
FROM `project1-448917.bank_churn.churn_analysis`
WHERE Churn_Status = 'Churned'
