CREATE DATABASE olist_ecommerce;
USE olist_ecommerce;

-- 1. CUSTOMERS TABLE
CREATE TABLE customers (
    customer_id VARCHAR(50) PRIMARY KEY,
    customer_unique_id VARCHAR(50),
    customer_zip_code_prefix VARCHAR(10),
    customer_city VARCHAR(100),
    customer_state VARCHAR(5)
);
SELECT * FROM customers;
-- 2. ORDERS TABLE
CREATE TABLE orders (
    order_id VARCHAR(50) PRIMARY KEY,
    customer_id VARCHAR(50),
    order_status VARCHAR(30),
    order_purchase_timestamp DATETIME,
    order_approved_at DATETIME,
    order_delivered_carrier_date DATETIME,
    order_delivered_customer_date DATETIME,
    order_estimated_delivery_date DATETIME
);
SELECT * FROM orders;
-- 3. ORDER ITEMS TABLE
CREATE TABLE order_items (
    order_id VARCHAR(50),
    order_item_id INT,
    product_id VARCHAR(50),
    seller_id VARCHAR(50),
    shipping_limit_date DATETIME,
    price DECIMAL(10,2),
    freight_value DECIMAL(10,2)
);
SELECT * FROM order_items;
-- 4. PRODUCTS TABLE
CREATE TABLE products (
    product_id VARCHAR(50) PRIMARY KEY,
    product_category_name VARCHAR(100),
    product_name_length INT,
    product_description_length INT,
    product_photos_qty INT,
    product_weight_g INT,
    product_length_cm INT,
    product_height_cm INT,
    product_width_cm INT
);
SELECT * FROM products;
-- 5. SELLERS TABLE
CREATE TABLE sellers (
    seller_id VARCHAR(50) PRIMARY KEY,
    seller_zip_code_prefix VARCHAR(10),
    seller_city VARCHAR(100),
    seller_state VARCHAR(5)
);
SELECT * FROM sellers;
-- 6. ORDER PAYMENTS TABLE
CREATE TABLE order_payments (
    order_id VARCHAR(50),
    payment_sequential INT,
    payment_type VARCHAR(30),
    payment_installments INT,
    payment_value DECIMAL(10,2)
);
SELECT * FROM order_payments;



-- Q1. Who are the top 10 customers by total revenue?
SELECT c.customer_id , SUM(op.payment_value) AS total_revenue
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_payments op
ON o.order_id = op.order_id
GROUP BY c.customer_id
ORDER BY total_revenue DESC
LIMIT 10;


-- Q2. How many customers bought more than once vs only once?
SELECT 
    SUM(order_count = 1) AS one_time_buyers,
    SUM(order_count > 1) AS repeat_buyers
FROM (
    SELECT 
        customer_id,
        COUNT(order_id) AS order_count
    FROM orders
    GROUP BY customer_id
) t;


-- Q3. Which states have the most customers?
SELECT customer_state, COUNT(customer_id) as total_customer
FROM customers
GROUP BY customer_state
ORDER BY total_customer DESC;

-- Q4. What is the total revenue generated each month?
SELECT 
    DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m') AS month,
    SUM(op.payment_value) AS monthly_revenue
FROM orders o
JOIN order_payments op ON o.order_id = op.order_id
WHERE o.order_status = 'delivered'
GROUP BY month
ORDER BY month ASC;

-- Q5. What percentage of total revenue comes from each payment method?
SELECT 
    payment_type,
    SUM(payment_value) AS total_revenue,
        SUM(payment_value) * 100 / 
        (SELECT SUM(payment_value) FROM order_payments) AS revenue_percentage
FROM order_payments
GROUP BY payment_type;


-- Q6. What is the average order value per state?
SELECT 
    c.customer_state,
    AVG(op.order_total) AS avg_order_value
FROM customers c
JOIN orders o 
    ON c.customer_id = o.customer_id
JOIN (
    SELECT order_id, SUM(payment_value) AS order_total
    FROM order_payments
    GROUP BY order_id
) op 
    ON o.order_id = op.order_id
GROUP BY c.customer_state;

-- Q7. Which product categories have the highest average order value?
SELECT 
    p.product_category_name,
    AVG(op.order_total) AS avg_order_value
FROM (
    SELECT order_id, SUM(payment_value) AS order_total
    FROM order_payments
    GROUP BY order_id
) op
JOIN order_items oi ON op.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY avg_order_value DESC;

-- Q8. Which sellers have the most orders but lowest revenue?
SELECT 
    oi.seller_id,
    COUNT(DISTINCT oi.order_id) AS total_orders,
    SUM(op.order_total) AS total_revenue
FROM (
    SELECT order_id, SUM(payment_value) AS order_total
    FROM order_payments
    GROUP BY order_id
) op
JOIN order_items oi ON op.order_id = oi.order_id
GROUP BY oi.seller_id
ORDER BY total_orders DESC, total_revenue ASC;

-- Q9. How many orders have multiple items vs single item?
SELECT 
    CASE 
        WHEN item_count = 1 THEN 'single item'
        ELSE 'multiple items'
    END AS order_type,
    COUNT(*) AS total_orders
FROM (
    SELECT order_id, COUNT(*) AS item_count
    FROM order_items
    GROUP BY order_id
) t
GROUP BY order_type;

-- Q10. How many orders were cancelled and what was the revenue lost?
SELECT 
    COUNT(DISTINCT o.order_id) AS cancelled_orders,
    SUM(op.payment_value) AS lost_revenue
FROM orders o
JOIN order_payments op ON o.order_id = op.order_id
WHERE o.order_status = 'canceled';

-- Q11. What is the average delivery time in days per state?
SELECT 
    c.customer_state,
    AVG(DATEDIFF(o.order_delivered_customer_date, o.order_purchase_timestamp)) AS avg_delivery_days
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_status = 'delivered'
GROUP BY c.customer_state
ORDER BY avg_delivery_days;

-- Q12. Which product categories have the most cancellations?
SELECT 
    p.product_category_name,
    COUNT(DISTINCT o.order_id) AS cancelled_orders
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.order_status = 'canceled'
GROUP BY p.product_category_name
ORDER BY cancelled_orders DESC;
