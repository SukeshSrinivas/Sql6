# Write your MySQL query statement below
WITH CTE AS (
    SELECT customer_id, YEAR(order_date) AS Year, SUM(price) AS TotalPurchase
    FROM orders
    GROUP BY customer_id, Year
)
SELECT c1.customer_id
FROM CTE c1
LEFT JOIN CTE c2
ON c1.customer_id = c2.customer_id
   AND c1.Year + 1 = c2.Year
   AND c1.TotalPurchase < c2.TotalPurchase
GROUP BY c1.customer_id
HAVING (COUNT(*)- COUNT(c2.customer_id))=1