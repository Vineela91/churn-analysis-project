SELECT 
    CASE 
        WHEN IsActiveMember = 1 THEN 'Active'
        ELSE 'Inactive'
    END AS Active_Status,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate
FROM `project1-448917.bank_churn.churn_analysis`
GROUP BY Active_Status
ORDER BY churn_rate DESC
