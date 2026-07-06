-- Business Question:
-- What was each customer's highest-revenue product category
-- in June 2026?

WITH customer_category_revenue AS (
    SELECT c.customer_id,
           c.customer_name,
           c.city,
           p.category,
           SUM(oi.quantity * oi.unit_price) AS category_revenue
    FROM customers c
    JOIN orders o
        ON o.customer_id = c.customer_id
    JOIN order_items oi
        ON oi.order_id = o.order_id
    JOIN products p
        ON p.product_id = oi.product_id
    WHERE o.order_date >= '2026-06-01'
      AND o.order_date < '2026-07-01'
    GROUP BY c.customer_id,
             c.customer_name,
             c.city,
             p.category
),
ranked_categories AS (
    SELECT customer_id,
           customer_name,
           city,
           category,
           category_revenue,
           RANK() OVER (
               PARTITION BY customer_id
               ORDER BY category_revenue DESC
           ) AS revenue_rank
    FROM customer_category_revenue
)
SELECT customer_id,
       customer_name,
       city,
       category AS top_category,
       category_revenue
FROM ranked_categories
WHERE revenue_rank = 1;
