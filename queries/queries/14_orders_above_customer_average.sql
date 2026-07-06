-- Business Question:
-- Which orders had a value greater than the customer's average order value
-- in June 2026?

WITH order_totals AS (
    SELECT o.order_id,
           o.customer_id,
           o.order_date,
           SUM(oi.quantity * oi.unit_price) AS order_value
    FROM orders o
    JOIN order_items oi
        ON oi.order_id = o.order_id
    WHERE o.order_date >= '2026-06-01'
      AND o.order_date < '2026-07-01'
    GROUP BY o.order_id,
             o.customer_id,
             o.order_date
),
orders_with_customer_average AS (
    SELECT order_id,
           customer_id,
           order_date,
           order_value,
           AVG(order_value) OVER (
               PARTITION BY customer_id
           ) AS customer_avg_order_value
    FROM order_totals
)
SELECT order_id,
       customer_id,
       order_date,
       order_value,
       customer_avg_order_value
FROM orders_with_customer_average
WHERE order_value > customer_avg_order_value
ORDER BY customer_id,
         order_date;
