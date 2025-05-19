WITH monthly_transactions AS (
  SELECT 
    owner_id, 
    DATE_FORMAT(transaction_date, '%m-%Y') AS date, 
    COUNT(*) AS transaction_count
  FROM 
    adashi_staging.savings_savingsaccount
  GROUP BY 
    owner_id, 
    date
),
avg_transactions AS (
  SELECT 
    owner_id, 
    AVG(transaction_count) AS avg_monthly_transactions
  FROM 
    monthly_transactions
  GROUP BY 
    owner_id
)
SELECT 
  CASE 
    WHEN av.avg_monthly_transactions >= 10 THEN 'High Frequency'
    WHEN av.avg_monthly_transactions BETWEEN 3 AND 9 THEN 'Medium Frequency'
    ELSE 'Low Frequency'
  END AS frequency_category,
  COUNT(av.owner_id) AS customer_count, 
  AVG(av.avg_monthly_transactions) AS avg_transactions_per_month 
FROM avg_transactions av
JOIN adashi_staging.users_customuser u 
ON av.owner_id = u.id
GROUP BY frequency_category
ORDER BY  avg_transactions_per_month  DESC;