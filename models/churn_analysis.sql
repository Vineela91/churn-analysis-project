SELECT 
    COALESCE(CustomerId, 0) AS CustomerId,
    COALESCE(Surname, 'Unknown') AS Surname,
    COALESCE(Geography, 'Unknown') AS Geography,
    COALESCE(Gender, 'Unknown') AS Gender,
    
    -- Fixing invalid age values
    CASE 
        WHEN Age < 0 OR Age > 120 THEN NULL  
        ELSE Age 
    END AS Age,
    
    -- Fixing invalid credit score values
    CASE 
        WHEN CreditScore < 300 OR CreditScore > 850 THEN NULL  
        ELSE CreditScore 
    END AS CreditScore,

    COALESCE(Balance, 0) AS Balance,
    COALESCE(NumOfProducts, 0) AS NumOfProducts,
    COALESCE(IsActiveMember, 0) AS IsActiveMember,
    COALESCE(EstimatedSalary, 0) AS EstimatedSalary,

    Exited,
    CASE 
        WHEN Exited = 1 THEN 'Churned'
        ELSE 'Retained'
    END AS Churn_Status

FROM `project1-448917.bank_churn.cust_info`

-- Filtering out invalid data
WHERE Age IS NOT NULL 
AND CreditScore IS NOT NULL
