
-- Instacart Market Basket Analysis SQL Queries
-- Description: Complete SQL query set for 20 analysis questions + insights

use project_orders;

-- 1. Top 10 aisles with the highest number of products
SELECT a.aisle, COUNT(p.product_id) AS product_count
FROM products p
JOIN aisles a ON p.aisle_id = a.aisle_id
GROUP BY a.aisle
ORDER BY product_count DESC
limit 10 ;

-- 2. Unique departments
SELECT COUNT(DISTINCT department_id) AS unique_departments
FROM departments;

-- 3. Distribution of products across departments
SELECT d.department, COUNT(p.product_id) AS total_products
FROM products p
JOIN departments d ON p.department_id = d.department_id
GROUP BY d.department
ORDER BY total_products DESC;

-- 4. Top 10 products with highest reorder rate
SELECT p.product_name,
SUM(op.reordered) / COUNT(op.reordered) AS reorder_rate
FROM order_products_train op
JOIN products p ON op.product_id = p.product_id
GROUP BY p.product_name
HAVING COUNT(op.product_id) > 5
ORDER BY reorder_rate DESC
limit 10;

-- 5. Number of unique users
SELECT COUNT(DISTINCT user_id) AS unique_users
FROM orders;

-- 6. Average number of days between orders per user
SELECT AVG(avg_days) AS avg_days_between_orders
FROM (
    SELECT user_id, AVG(days_since_prior_order) AS avg_days
    FROM orders
    WHERE days_since_prior_order IS NOT NULL
    GROUP BY user_id
) AS user_avg;

-- 7. Peak hours of order placement
SELECT order_hour_of_day, COUNT(order_id) AS total_orders
FROM orders
GROUP BY order_hour_of_day
ORDER BY total_orders DESC;

-- 8. Order volume variation by day of week
SELECT order_dow, COUNT(order_id) AS total_orders
FROM orders
GROUP BY order_dow
ORDER BY order_dow;

-- 9. Top 10 most ordered products
SELECT p.product_name, COUNT(op.product_id) AS total_orders
FROM order_products_train op
JOIN products p ON op.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_orders DESC
LIMIT 10;

-- 10. Number of users who placed orders in each department
SELECT d.department, COUNT(DISTINCT o.user_id) AS total_users
FROM orders o
JOIN order_products_train op ON o.order_id = op.order_id
JOIN products p ON op.product_id = p.product_id
JOIN departments d ON p.department_id = d.department_id
GROUP BY d.department
ORDER BY total_users DESC;

-- 11. Average number of products per order
SELECT AVG(product_count) AS avg_products_per_order
FROM (
    SELECT order_id, COUNT(product_id) AS product_count
    FROM order_products_train
    GROUP BY order_id
) AS order_sizes;

-- 12. Most reordered products in each department
SELECT d.department, p.product_name, SUM(op.reordered) AS total_reorders
FROM order_products_train op
JOIN products p ON op.product_id = p.product_id
JOIN departments d ON p.department_id = d.department_id
GROUP BY d.department, p.product_name
HAVING total_reorders > 0
ORDER BY d.department, total_reorders DESC;

-- 13. Products reordered more than once
SELECT COUNT(*) AS products_reordered_more_than_once
FROM (
    SELECT product_id, SUM(reordered) AS reorder_count
    FROM order_products_train
    GROUP BY product_id
    HAVING SUM(reordered) > 1
) AS reorders;

-- 14. Average number of products added to the cart per order
SELECT AVG(product_count) AS avg_cart_size
FROM (
    SELECT order_id, COUNT(product_id) AS product_count
    FROM order_products_train
    GROUP BY order_id
) AS cart_counts;

-- 15. Orders variation by hour of day
SELECT order_hour_of_day, COUNT(order_id) AS order_count
FROM orders
GROUP BY order_hour_of_day
ORDER BY order_hour_of_day;

-- 16. Distribution of order sizes
SELECT product_count, COUNT(*) AS num_orders
FROM (
    SELECT order_id, COUNT(product_id) AS product_count
    FROM order_products_train
    GROUP BY order_id
) AS order_size
GROUP BY product_count
ORDER BY product_count;

-- 17. Average reorder rate per aisle
SELECT a.aisle,
       SUM(op.reordered) * 1.0 / COUNT(op.product_id) AS avg_reorder_rate
FROM order_products_train op
JOIN products p ON op.product_id = p.product_id
JOIN aisles a ON p.aisle_id = a.aisle_id
GROUP BY a.aisle
ORDER BY avg_reorder_rate DESC;

-- 18. Average order size by day of week
SELECT o.order_dow, AVG(product_count) AS avg_order_size
FROM (
    SELECT order_id, COUNT(product_id) AS product_count
    FROM order_products_train
    GROUP BY order_id
) AS order_counts
JOIN orders o ON o.order_id = order_counts.order_id
GROUP BY o.order_dow
ORDER BY o.order_dow;

-- 19. Top 10 users with highest number of orders
SELECT user_id, COUNT(order_id) AS total_orders
FROM orders
GROUP BY user_id
ORDER BY total_orders DESC
LIMIT 10;

-- 20. Product counts per aisle and department
SELECT d.department, a.aisle, COUNT(p.product_id) AS product_count
FROM products p
JOIN aisles a ON p.aisle_id = a.aisle_id
JOIN departments d ON p.department_id = d.department_id
GROUP BY d.department, a.aisle
ORDER BY d.department, product_count DESC;

-- Additional: Customer and Product Insights

-- A. Frequent users and average order gap
SELECT user_id, COUNT(order_id) AS total_orders, AVG(days_since_prior_order) AS avg_days
FROM orders
GROUP BY user_id
ORDER BY total_orders DESC;

-- B. Product performance (reorder + sales)
SELECT p.product_name,
       COUNT(op.product_id) AS total_orders,
       SUM(op.reordered) AS total_reorders,
       (SUM(op.reordered)*1.0 / COUNT(op.product_id)) AS reorder_rate
FROM order_products_train op
JOIN products p ON op.product_id = p.product_id
GROUP BY p.product_name
ORDER BY reorder_rate DESC, total_orders DESC
LIMIT 20;
