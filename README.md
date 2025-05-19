# DataAnalytics-Assessment

## Question 1 - High-Value Customers with Multiple Products
### Scenario: 
The business wants to identify customers who have both a savings and an investment plan (cross-selling opportunity).

### Task: 
Write a query to find customers with at least one funded savings plan AND one funded investment plan, sorted by total deposits.

### Approach
To solve this problem, I took the following approach:

* I started by creating a CTE to count how many savings and investment plans each customer has so I could focus on customers who have both.
* Next, I calculated the total deposits made by each customer.
* For the final step, I joined the two CTEs with the users table and sorted by total deposits.



## Question 2 - Transaction Frequency Analysis
### Scenario: 
The finance team wants to analyze how often customers transact to segment them (e.g., frequent vs. occasional users).

### Task: 
Calculate the average number of transactions per customer per month and categorize them:
"High Frequency" (≥10 transactions/month)
"Medium Frequency" (3-9 transactions/month)
"Low Frequency" (≤2 transactions/month)

### Approach
To analyze transaction frequency, I took the following steps:

* I started by calculating the number of transactions each customer makes per month.
* Next, I calculated the average number of transactions per customer per month.
* Finally, I categorized customers based on their average monthly transactions, grouping them into "High Frequency" (≥10 transactions/month), "Medium Frequency" (3-9 transactions/month), and "Low Frequency" (≤2 transactions/month).


## Question 3 -  Account Inactivity Alert
### Scenario: 
The ops team wants to flag accounts with no inflow transactions for over one year.

### Task: 
Find all active accounts (savings or investments) with no transactions in the last 1 year (365 days).

### Approach
To find all active accounts (savings or investments) with no transactions in the last 1 year (365 days), I used the following approach:

* I linked plans with their corresponding transactions and found the most recent transaction date for each plan.
* Next, I calculated the number of days since the last transaction date.
* The question was not specific about what makes an account active so I made the assumption that an active account is one that is either a savings plan or an investment plan.
* Next, I filtered the results to identify plans with inactivity days greater than 365 and sorted the results by inactivity days in descending order.

## Question 4 - Customer Lifetime Value (CLV) Estimation

### Scenario: 
Marketing wants to estimate CLV based on account tenure and transaction volume (simplified model).

### Task: 
For each customer, assuming the profit_per_transaction is 0.1% of the transaction value, calculate:
* Account tenure (months since signup)
* Total transactions
* Estimated CLV (Assume: CLV = (total_transactions / tenure) * 12 * avg_profit_per_transaction)
Order by estimated CLV from highest to lowest

### Approach
To estimate Customer Lifetime Value (CLV), I used the following approach:

* I calculated the number of months since each customer signed up and counted the total number of transactions for each customer.
* Next, I used a profit per transaction of 0.1% from the assumption provided and calculated the estimated clv with the formula provided.
* I sorted the results by estimated CLV in descending order.
