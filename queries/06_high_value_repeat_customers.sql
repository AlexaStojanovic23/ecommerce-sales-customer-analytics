-- Business Question:
-- Which customers placed at least two orders and spent more than 1,000
-- in June 2026?

SELECT c.customer_id,
       c.customer_name,
       c.city,
       COUNT(DISTINCT o.order_id) AS order_count,
       SUM(oi.quantity * oi.unit_price) AS total_spent,
       SUM(oi.quantity) AS units_bought
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
HAVING COUNT(DISTINCT o.order_id) >= 2
   AND SUM(oi.quantity * oi.unit_price) > 1000
ORDER BY total_spent DESC;
