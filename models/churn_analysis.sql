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
    ROUND(AVG(Exited) OVER () * 100, 2) AS Churn_Rate 
FROM `project1-448917.bank_churn.cleansed_data`
ORDER BY Churn_Rate DESC