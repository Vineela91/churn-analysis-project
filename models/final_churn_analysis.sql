SELECT 
    Geography,
    Age,
    CASE 
        WHEN IsActiveMember = 1 THEN 'Active'
        ELSE 'Inactive'
    END AS Active_Status,
    Balance,
    CASE 
        WHEN Exited = 1 THEN 'Churned'
        ELSE 'Retained'
    END AS Churn_Status,
    ROUND(SUM(CASE WHEN Exited = 1 THEN 1 ELSE 0 END) OVER () * 100.0 / COUNT(*) OVER (), 2) AS Churn_Rate
FROM `project1-448917.bank_churn.churn_analysis`
ORDER BY Churn_Rate DESC
