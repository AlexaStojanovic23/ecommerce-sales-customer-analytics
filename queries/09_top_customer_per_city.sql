-- Business Question:
-- Which customer generated the highest revenue in each city
-- in June 2026?

WITH customer_revenue AS (
    SELECT c.city,
           c.customer_id,
           c.customer_name,
           SUM(oi.quantity * oi.unit_price) AS revenue
    FROM customers c
    JOIN orders o
        ON o.customer_id = c.customer_id
    JOIN order_items oi
        ON oi.order_id = o.order_id
    WHERE o.order_date >= '2026-06-01'
      AND o.order_date < '2026-07-01'
    GROUP BY c.city,
             c.customer_id,
             c.customer_name
),
ranked_customers AS (
    SELECT city,
           customer_id,
           customer_name,
           revenue,
           RANK() OVER (
               PARTITION BY city
               ORDER BY revenue DESC
           ) AS revenue_rank
    FROM customer_revenue
)
SELECT city,
       customer_id,
       customer_name,
       revenue
FROM ranked_customers
WHERE revenue_rank = 1;
