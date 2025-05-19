SELECT
	u.id AS customer_id,
    CONCAT(u.first_name, ' ', u.last_name) AS name,
    TIMESTAMPDIFF(MONTH, MIN(u.date_joined), NOW()) AS tenure_months,
    COUNT(s.id) AS total_transactions,
    (COUNT(s.id)/TIMESTAMPDIFF(MONTH, MIN(u.date_joined), NOW()))*12*0.1 AS estimated_clv
FROM adashi_staging.users_customuser u 
JOIN adashi_staging.savings_savingsaccount s 
ON u.id = s.owner_id
GROUP BY 1,2
ORDER BY 5 DESC;