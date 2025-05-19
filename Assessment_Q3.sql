SELECT 
	p.id AS plan_id, 
    p.owner_id,
    CASE 
		WHEN p.is_a_fund = 1 THEN 'Investment'
        WHEN p.is_regular_savings = 1 THEN 'Savings'
        ELSE 'Others'
	END AS type,
    MAX(s.transaction_date) AS last_transaction_date,
    TIMESTAMPDIFF(DAY, MAX(s.transaction_date), NOW()) AS inactivity_days
 FROM adashi_staging.plans_plan p
 JOIN adashi_staging.savings_savingsaccount s
 ON p.id = s.plan_id
 GROUP BY plan_id, owner_id, type
 HAVING (type = 'Investment' OR type = 'Savings') AND inactivity_days > 365
 ORDER BY inactivity_days DESC;
 
 
