-- Business Question:
-- How can customers be segmented based on their total spending
-- in June 2026?

WITH customer_spending AS (
    SELECT c.customer_id,
           c.customer_name,
           c.city,
           SUM(oi.quantity * oi.unit_price) AS total_spent,
           COUNT(DISTINCT o.order_id) AS order_count
    FROM customers c
    JOIN orders o
        ON o.customer_id = c.customer_id
    JOIN order_items oi
        ON oi.order_id = o.order_id
    WHERE o.order_date >= '2026-06-01'
      AND o.order_date < '2026-07-01'
    GROUP BY c.customer_id,
             c.customer_name,
             c.city
)
SELECT customer_id,
       customer_name,
       city,
       total_spent,
       order_count,
       CASE
           WHEN total_spent >= 3000 THEN 'VIP'
           WHEN total_spent >= 1000 THEN 'Regular'
           ELSE 'Low'
       END AS customer_segment
FROM customer_spending
ORDER BY total_spent DESC;
