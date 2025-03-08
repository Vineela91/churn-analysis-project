SELECT 
    Geography,
    Gender,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate
FROM `project1-448917.bank_churn.cust_info`
GROUP BY Geography, Gender
ORDER BY churn_rate DESC
