-- Business Question:
-- How is revenue distributed across sales channels and product categories
-- in June 2026?

SELECT o.channel,
   p.category,
   SUM(oi.quantity * oi.unit_price) AS revenue,
   SUM(oi.quantity) AS units_sold,
   COUNT(DISTINCT o.order_id) AS order_count
FROM orders o
JOIN order_items oi
   ON oi.order_id = o.order_id
JOIN products p
   ON p.product_id = oi.product_id
WHERE o.order_date >= '2026-06-01'
AND o.order_date < '2026-07-01'
GROUP BY o.channel, p.category
ORDER BY revenue DESC;
