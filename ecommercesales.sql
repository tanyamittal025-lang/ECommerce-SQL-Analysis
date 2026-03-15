CREATE DATABASE ecommerce_project;
USE ecommerce_project;

CREATE TABLE orders(
order_id INT,
product VARCHAR(100),
quantity_ordered INT,
price_each FLOAT,
order_date DATE,
purchase_address VARCHAR(255)
);
SELECT * FROM orders
LIMIT 10;

SELECT *,
quantity_ordered * price_each AS revenue
FROM orders;

SELECT product, quantity_ordered
FROM orders;

SELECT
SUM(quantity_ordered * price_each) AS total_revenue
FROM orders;

SELECT
product,
SUM(quantity_ordered * price_each) AS revenue
FROM orders
GROUP BY product;

SELECT
product,
SUM(quantity_ordered) AS total_units
FROM orders
GROUP BY product
ORDER BY total_units DESC;

SELECT
product,
SUM(quantity_ordered) AS units
FROM orders
GROUP BY product
ORDER BY units DESC
LIMIT 10;

SELECT
MONTH(order_date) AS month
FROM orders;

SELECT
MONTH(order_date) AS month,
SUM(quantity_ordered * price_each) AS revenue
FROM orders
GROUP BY month
ORDER BY month;

SELECT
purchase_address,
SUBSTRING_INDEX(SUBSTRING_INDEX(purchase_address, ',', 2), ',', -1) AS city
FROM orders;

SELECT product,SUM(quantity_ordered)
FROM orders
GROUP BY product
HAVING SUM( quantity_ordered)> 200
ORDER BY product;

SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(purchase_address, ',', 2), ',', -1) AS city,
SUM(quantity_ordered * price_each) AS revenue
FROM orders
GROUP BY city
ORDER BY revenue DESC;

SELECT VERSION();
SELECT
month,
revenue,
revenue - LAG(revenue) OVER (ORDER BY month) AS change_in_revenue
FROM
(
SELECT
MONTH(order_date) AS month,
SUM(quantity_ordered * price_each) AS revenue
FROM orders
GROUP BY MONTH(order_date)
) AS t;

SELECT
HOUR(order_date) AS hour,
SUM(quantity_ordered) AS products_sold
FROM orders
GROUP BY hour
ORDER BY products_sold DESC;

