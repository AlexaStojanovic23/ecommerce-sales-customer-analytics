-- Business Question:
-- Which product categories generated the most revenue in June 2026,
-- and how many units were sold in each category?

SELECT p.category,
   SUM(oi.quantity * oi.unit_price) AS revenue,
   SUM(oi.quantity) AS units_sold
FROM products p
JOIN order_items oi
   ON oi.product_id = p.product_id
JOIN orders o
   ON o.order_id = oi.order_id
WHERE o.order_date >= '2026-06-01'
AND o.order_date < '2026-07-01'
GROUP BY p.category
ORDER BY revenue DESC;
