WITH plan_counts AS (
  SELECT 
    owner_id, 
    SUM(CASE 
		WHEN is_regular_savings = 1 THEN 1 ELSE 0 END) AS savings_count, 
	SUM(CASE 
		WHEN is_a_fund = 1 THEN 1 ELSE 0 END) AS investment_count
	FROM 
	adashi_staging.plans_plan
    GROUP BY 
    owner_id
    HAVING savings_count + investment_count > 0
),
total_deposits AS (
  SELECT 
    owner_id, 
    SUM(confirmed_amount) AS total_deposits
  FROM 
    adashi_staging.savings_savingsaccount
  GROUP BY 
    owner_id
)
SELECT 
  pc.owner_id, 
  CONCAT(u.first_name, ' ', u.last_name) AS name, 
  pc.savings_count, 
  pc.investment_count, 
  COALESCE(td.total_deposits, 0) AS total_deposits
FROM 
  plan_counts pc
  JOIN adashi_staging.users_customuser u ON pc.owner_id = u.id
  JOIN total_deposits td ON pc.owner_id = td.owner_id
ORDER BY total_deposits DESC;
