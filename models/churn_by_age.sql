SELECT 
    Age, 
    COUNT(*) AS total_customers,  -- Counting total customers in each age group
    SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS churned_customers,  -- Counting churned customers
    ROUND(AVG(Exited)* 100, 2)AS churn_rate 
FROM `project1-448917.bank_churn.cleansed_data`
GROUP BY Age
ORDER BY Age
