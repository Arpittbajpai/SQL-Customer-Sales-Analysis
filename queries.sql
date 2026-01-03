/* =========================================
   PROJECT: Customer & Sales Analysis
   DATABASE: MySQL
   ========================================= */


/* -----------------------------------------
   1. View Raw Tables
----------------------------------------- */

SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;


/* -----------------------------------------
   2. Basic Metrics
----------------------------------------- */

-- Total number of customers
SELECT COUNT(*) AS total_customers
FROM customers;

-- Total number of orders
SELECT COUNT(*) AS total_orders
FROM orders;


/* -----------------------------------------
   3. Orders per Customer (LEFT JOIN)
----------------------------------------- */

SELECT 
    customers.name,
    COUNT(orders.order_id) AS total_orders
FROM customers
LEFT JOIN orders
    ON customers.customer_id = orders.customer_id
GROUP BY customers.name;


/* -----------------------------------------
   4. Customer Category by Order Frequency
----------------------------------------- */

SELECT 
    customers.name,
    COUNT(orders.order_id) AS order_quantity,
    CASE
        WHEN COUNT(orders.order_id) >= 2 THEN 'Frequent Buyer'
        WHEN COUNT(orders.order_id) = 1 THEN 'Occasional Buyer'
        ELSE 'No Orders'
    END AS customer_category
FROM customers
LEFT JOIN orders
    ON customers.customer_id = orders.customer_id
GROUP BY customers.name;


/* -----------------------------------------
   5. Revenue by Product
----------------------------------------- */

SELECT 
    products.product_name,
    SUM(orders.quantity) AS total_quantity_sold,
    SUM(orders.quantity * products.price) AS total_revenue
FROM orders
JOIN products
    ON orders.product_id = products.product_id
GROUP BY products.product_name;


/* -----------------------------------------
   6. High Revenue Products (HAVING)
----------------------------------------- */

SELECT 
    products.product_name,
    SUM(orders.quantity * products.price) AS total_revenue
FROM orders
JOIN products
    ON orders.product_id = products.product_id
GROUP BY products.product_name
HAVING SUM(orders.quantity * products.price) > 50000;


/* -----------------------------------------
   7. Total Spending per Customer
----------------------------------------- */

SELECT 
    customers.name,
    SUM(products.price * orders.quantity) AS total_spending
FROM customers
LEFT JOIN orders
    ON customers.customer_id = orders.customer_id
LEFT JOIN products
    ON products.product_id = orders.product_id
GROUP BY customers.name;


/* -----------------------------------------
   8. Customer Spending Category
----------------------------------------- */

SELECT 
    customers.name,
    SUM(products.price * orders.quantity) AS total_spending,
    CASE
        WHEN SUM(products.price * orders.quantity) > 50000 THEN 'High Spender'
        WHEN SUM(products.price * orders.quantity) BETWEEN 20000 AND 50000 THEN 'Medium Spender'
        ELSE 'Low Spender'
    END AS spending_category
FROM customers
LEFT JOIN orders
    ON customers.customer_id = orders.customer_id
LEFT JOIN products
    ON products.product_id = orders.product_id
GROUP BY customers.name;


/* -----------------------------------------
   9. Frequent AND High-Value Customers
----------------------------------------- */

SELECT 
    customers.name,
    COUNT(orders.order_id) AS order_quantity,
    SUM(products.price * orders.quantity) AS total_spending,
    CASE
        WHEN COUNT(orders.order_id) >= 2 THEN 'Frequent Buyer'
        WHEN COUNT(orders.order_id) = 1 THEN 'Occasional Buyer'
        ELSE 'No Orders'
    END AS customer_category
FROM customers
LEFT JOIN orders
    ON customers.customer_id = orders.customer_id
LEFT JOIN products
    ON products.product_id = orders.product_id
GROUP BY customers.name
HAVING COUNT(orders.order_id) >= 2
   AND SUM(products.price * orders.quantity) > 50000;

  
/* -----------------------------------------
   END OF ANALYSIS QUERIES
----------------------------------------- */
  
