-- Business Question:
-- Which customers generated the most revenue in June 2026,
-- and how do they compare by order volume and units purchased?

SELECT c.customer_id,
   c.customer_name,
   c.city,
   SUM(oi.quantity * oi.unit_price) AS revenue,
   COUNT(DISTINCT o.order_id) AS order_count,
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
ORDER BY revenue DESC
LIMIT 5;
