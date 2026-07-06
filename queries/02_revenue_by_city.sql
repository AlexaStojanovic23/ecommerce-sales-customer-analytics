-- Business Question:
-- Which cities generated the most revenue in June 2026,
-- and how do they compare by orders, customers, and units sold?

SELECT c.city,
   SUM(oi.quantity * oi.unit_price) AS revenue,
   COUNT(DISTINCT o.order_id) AS order_count,
   COUNT(DISTINCT c.customer_id) AS customer_count,
   SUM(oi.quantity) AS units_sold
FROM customers c
JOIN orders o
   ON o.customer_id = c.customer_id
JOIN order_items oi
   ON oi.order_id = o.order_id
WHERE o.order_date >= '2026-06-01'
  AND o.order_date < '2026-07-01'
GROUP BY c.city
ORDER BY revenue DESC;
