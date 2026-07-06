-- Business Question:
-- How did monthly revenue change throughout 2026
-- compared with the previous month?

WITH monthly_revenue AS (
    SELECT STRFTIME('%Y-%m', o.order_date) AS month,
           SUM(oi.quantity * oi.unit_price) AS revenue
    FROM orders o
    JOIN order_items oi
        ON oi.order_id = o.order_id
    WHERE o.order_date >= '2026-01-01'
      AND o.order_date < '2027-01-01'
    GROUP BY STRFTIME('%Y-%m', o.order_date)
),
revenue_with_previous_month AS (
    SELECT month,
           revenue,
           LAG(revenue) OVER (
               ORDER BY month
           ) AS previous_month_revenue
    FROM monthly_revenue
)
SELECT month,
       revenue,
       previous_month_revenue,
       revenue - previous_month_revenue AS revenue_change
FROM revenue_with_previous_month
ORDER BY month;
