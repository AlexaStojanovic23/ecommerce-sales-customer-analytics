-- Business Question:
-- Which city generated the highest revenue for each product category
-- in June 2026?

WITH category_city_revenue AS (
    SELECT p.category,
           c.city,
           SUM(oi.quantity * oi.unit_price) AS revenue,
           SUM(oi.quantity) AS units_sold
    FROM customers c
    JOIN orders o
        ON o.customer_id = c.customer_id
    JOIN order_items oi
        ON oi.order_id = o.order_id
    JOIN products p
        ON p.product_id = oi.product_id
    WHERE o.order_date >= '2026-06-01'
      AND o.order_date < '2026-07-01'
    GROUP BY p.category,
             c.city
),
ranked_cities AS (
    SELECT category,
           city,
           revenue,
           units_sold,
           RANK() OVER (
               PARTITION BY category
               ORDER BY revenue DESC
           ) AS revenue_rank
    FROM category_city_revenue
)
SELECT category,
       city,
       revenue,
       units_sold
FROM ranked_cities
WHERE revenue_rank = 1;
