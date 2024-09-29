/* Write your T-SQL query statement below */
SELECT transaction_date, COALESCE(SUM(CASE WHEN amount %2 !=0 THEN amount END),0) odd_sum,
COALESCE(SUM(CASE WHEN amount %2 =0 THEN amount END),0) even_sum
FROM transactions
GROUP BY transaction_date
ORDER BY transaction_date ASC