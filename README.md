# E-commerce Sales & Customer Analytics

## Project Overview

This project analyzes e-commerce sales data using SQL to explore revenue performance, customer behavior, product categories, sales channels, and monthly revenue trends.

The goal of the project is to answer realistic business questions using analytical SQL patterns, including multi-table joins, aggregations, common table expressions, customer segmentation, and window functions.

The analysis focuses primarily on June 2026, with additional monthly revenue trend analysis across 2026.

## Database Structure

The project uses four relational tables:

- `customers` — customer information and city
- `orders` — order dates, customers, and sales channels
- `order_items` — products, quantities, and unit prices for each order
- `products` — product names and categories

Revenue is calculated using:

```sql
quantity * unit_price
```

## Business Questions

The SQL analysis answers questions such as:

- Which sales channels generated the most revenue?
- Which cities and product categories performed best?
- Who were the highest-value customers?
- Which customers showed repeat purchasing behavior?
- How can customers be segmented based on total spending?
- Which product generated the highest revenue within each category?
- Who was the top customer in each city?
- Which city performed best for each product category?
- What was each customer's top spending category?
- Which customers had Electronics as a top spending category?
- How did monthly revenue change compared with the previous month?
- Which orders performed above each customer's average order value?

## SQL Skills Demonstrated

- Multi-table `JOIN`
- `GROUP BY` and `HAVING`
- `SUM`, `COUNT`, and `AVG`
- `COUNT(DISTINCT ...)`
- Date filtering
- Revenue and Average Order Value calculations
- `CASE` expressions
- Common Table Expressions (`CTE`)
- Window functions
- `RANK()`
- `AVG() OVER(PARTITION BY ...)`
- `LAG()`
- Top-N per group analysis
- Customer segmentation
- Running analytical comparisons
- Grain and level-of-aggregation awareness

## Analyses

1. [Revenue by Sales Channel](queries/01_revenue_by_channel.sql)
2. [Revenue by City](queries/02_revenue_by_city.sql)
3. [Revenue by Product Category](queries/03_revenue_by_category.sql)
4. [Revenue by Channel and Category](queries/04_revenue_by_channel_and_category.sql)
5. [Top Customers by Revenue](queries/05_top_customers_by_revenue.sql)
6. [High-Value Repeat Customers](queries/06_high_value_repeat_customers.sql)
7. [Customer Segmentation](queries/07_customer_segmentation.sql)
8. [Top Product per Category](queries/08_top_product_per_category.sql)
9. [Top Customer per City](queries/09_top_customer_per_city.sql)
10. [Top City per Category](queries/10_top_city_per_category.sql)
11. [Customer Top Spending Category](queries/11_customer_top_spending_category.sql)
12. [Electronics Top-Category Customers](queries/12_electronics_top_category_customers.sql)
13. [Monthly Revenue Change](queries/13_monthly_revenue_change.sql)
14. [Orders Above Customer Average](queries/14_orders_above_customer_average.sql)

## Project Structure

```text
ecommerce-sales-customer-analytics/
│
├── README.md
├── schema.sql
├── sample_data.sql
│
└── queries/
    ├── 01_revenue_by_channel.sql
    ├── 02_revenue_by_city.sql
    ├── 03_revenue_by_category.sql
    ├── 04_revenue_by_channel_and_category.sql
    ├── 05_top_customers_by_revenue.sql
    ├── 06_high_value_repeat_customers.sql
    ├── 07_customer_segmentation.sql
    ├── 08_top_product_per_category.sql
    ├── 09_top_customer_per_city.sql
    ├── 10_top_city_per_category.sql
    ├── 11_customer_top_spending_category.sql
    ├── 12_electronics_top_category_customers.sql
    ├── 13_monthly_revenue_change.sql
    └── 14_orders_above_customer_average.sql
```

## How to Run

1. Create the database tables using `schema.sql`.
2. Insert the sample dataset using `sample_data.sql`.
3. Run the SQL files inside the `queries` directory.

The project uses SQLite-style SQL syntax.

## Key Analytical Concepts

A major focus of this project is selecting the correct level of aggregation before applying analytical logic.

For example, top-per-group analyses first calculate revenue at the required grain, such as customer-category or category-city level, and then apply window functions to rank results within each group.

The project also uses window functions to compare current values with group-level or previous-period values while preserving row-level detail.

## Author

**Alexa Stojanovic**

Aspiring Data Analyst focused on SQL, analytical thinking, and business-oriented data analysis.
