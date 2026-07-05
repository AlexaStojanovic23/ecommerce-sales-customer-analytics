-- Business Question:
-- Which sales channels generated the most revenue in June 2026,
-- and how do they compare by order volume and average order value?

SELECT o.channel,
   SUM(oi.quantity * oi.unit_price) AS revenue,
   COUNT(DISTINCT o.order_id) AS order_count,
   SUM(oi.quantity * oi.unit_price) * 1.0
   / COUNT(DISTINCT o.order_id) AS avg_order_value
FROM orders o
JOIN order_items oi
   ON oi.order_id = o.order_id
WHERE o.order_date >= '2026-06-01'
  AND o.order_date < '2026-07-01'
GROUP BY o.channel
ORDER BY revenue DESC;
