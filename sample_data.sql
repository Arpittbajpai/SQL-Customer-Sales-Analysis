-- Sample data for SQL Customer & Sales Analysis Project

-- Customers table data
INSERT INTO customers (customer_id, name, country, age) VALUES
(1, 'Amit', 'India', 28),
(2, 'Sarah', 'USA', 34),
(3, 'John', 'UK', 45),
(4, 'Priya', 'India', 25),
(5, 'David', 'USA', 40),
(6, 'Ananya', 'India', 31),
(7, 'Michael', 'Canada', 38);

-- Products table data
INSERT INTO products (product_id, product_name, price) VALUES
(101, 'Laptop', 80000),
(102, 'Smartphone', 40000),
(103, 'Headphones', 3000),
(104, 'Tablet', 25000);

-- Orders table data
INSERT INTO orders (order_id, customer_id, product_id, quantity, order_date) VALUES
(1001, 1, 101, 1, '2024-01-10'),
(1002, 1, 103, 2, '2024-01-15'),
(1003, 2, 102, 1, '2024-01-20'),
(1004, 4, 103, 3, '2024-02-05'),
(1005, 5, 101, 1, '2024-02-10'),
(1006, 6, 104, 2, '2024-02-12'),
(1007, 7, 102, 1, '2024-02-15'),
(1008, 2, 101, 1, '2024-02-18');
