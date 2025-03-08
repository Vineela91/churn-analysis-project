SELECT 
    CASE 
        WHEN Balance = 0 THEN 'No Balance'
        WHEN Balance BETWEEN 1 AND 50000 THEN 'Low Balance'
        WHEN Balance BETWEEN 50001 AND 150000 THEN 'Medium Balance'
        ELSE 'High Balance'
    END AS Balance_Group,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate
FROM `project1-448917.bank_churn.churn_analysis`
GROUP BY Balance_Group
ORDER BY churn_rate DESC
