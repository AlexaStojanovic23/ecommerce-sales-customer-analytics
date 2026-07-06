-- Business Question:
-- Which product generated the highest revenue within each product category
-- in June 2026?

WITH product_revenue AS (
    SELECT p.category,
           p.product_id,
           p.product_name,
           SUM(oi.quantity * oi.unit_price) AS revenue,
           SUM(oi.quantity) AS units_sold
    FROM products p
    JOIN order_items oi
        ON oi.product_id = p.product_id
    JOIN orders o
        ON o.order_id = oi.order_id
    WHERE o.order_date >= '2026-06-01'
      AND o.order_date < '2026-07-01'
    GROUP BY p.category,
             p.product_id,
             p.product_name
),
ranked_products AS (
    SELECT category,
           product_id,
           product_name,
           revenue,
           units_sold,
           RANK() OVER (
               PARTITION BY category
               ORDER BY revenue DESC
           ) AS revenue_rank
    FROM product_revenue
)
SELECT category,
       product_id,
       product_name,
       revenue,
       units_sold
FROM ranked_products
WHERE revenue_rank = 1;
