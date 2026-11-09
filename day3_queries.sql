-- =======================================================
-- DAY 3 OF SQL: WHAT IS SQL & CORE OPERATIONS IN ACTION
-- =======================================================
-- Topic: Introduction to SQL, Why It Is Used, and Essential Queries
-- =======================================================

-- 1. Create and select the database
CREATE DATABASE IF NOT EXISTS day3_db;
USE day3_db;

-- 2. Create a products table
CREATE TABLE IF NOT EXISTS products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. Insert sample data (DML)
INSERT INTO products (product_name, category, price, stock_quantity) VALUES
('Wireless Mouse', 'Electronics', 24.99, 150),
('Mechanical Keyboard', 'Electronics', 79.99, 80),
('Noise Cancelling Headphones', 'Electronics', 149.99, 45),
('Ergonomic Office Chair', 'Furniture', 199.99, 20),
('Wooden Desk', 'Furniture', 299.99, 15),
('Water Bottle', 'Accessories', 14.50, 200);

-- 4. Basic Query: Retrieve all products (DQL)
SELECT * FROM products;

-- 5. Filtering Data: Get affordable electronics (price < 100)
SELECT product_name, price, stock_quantity 
FROM products 
WHERE category = 'Electronics' AND price < 100.00;

-- 6. Aggregation: Calculate total inventory value and average price per category
SELECT 
    category,
    COUNT(*) AS total_products,
    AVG(price) AS average_price,
    SUM(price * stock_quantity) AS total_inventory_value
FROM products
GROUP BY category;

-- 7. Updating Data: Restock an item
UPDATE products 
SET stock_quantity = stock_quantity + 25 
WHERE product_name = 'Wireless Mouse';

-- 8. Deleting Data: Remove an out-of-catalog or obsolete item
DELETE FROM products 
WHERE product_name = 'Water Bottle';

-- 9. Verify the final updated records
SELECT product_id, product_name, category, price, stock_quantity 
FROM products 
ORDER BY price DESC;
