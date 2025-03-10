SELECT 
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(AVG(Exited) * 100, 2) AS churn_rate
FROM `project1-448917.bank_churn.cleansed_data`
