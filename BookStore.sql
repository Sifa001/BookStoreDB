-- BOOKSTORE DATABASE
-- ======================================

-- A. DATABASE CREATION
-- ===================
DROP DATABASE IF EXISTS bookstore;
CREATE DATABASE bookstore;
USE bookstore;


-- B. TABLE CREATION
-- =================

-- Table: book_language
CREATE TABLE book_language(
    language_id INT PRIMARY KEY,
    language_name VARCHAR(50) NOT NULL
);

-- Table: publisher
CREATE TABLE publisher(
    publisher_id INT PRIMARY KEY AUTO_INCREMENT,
    publisher_name VARCHAR(100) NOT NULL
);

-- Table: author
CREATE TABLE author (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    author_name VARCHAR(100) NOT NULL
);

-- Table: book
CREATE TABLE book (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    publication_year YEAR,
    price DECIMAL(10,2),
    publisher_id INT,
    language_id INT,
    stock_quantity INT NOT NULL DEFAULT 0,
    FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id),
    FOREIGN KEY (language_id) REFERENCES book_language(language_id)
);

-- Table: book_author
CREATE TABLE book_author(
    book_id INT NOT NULL,
    author_id INT NOT NULL,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id),
    FOREIGN KEY (author_id) REFERENCES author(author_id)
);

-- Table: country
CREATE TABLE country (
    country_id INT PRIMARY KEY AUTO_INCREMENT,
    country_name VARCHAR(50) NOT NULL
);

-- Table: address
CREATE TABLE address (
    address_id INT PRIMARY KEY AUTO_INCREMENT,
    street_number VARCHAR(10) NOT NULL,
    street_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50),
    postal_code VARCHAR(20),
    country_id INT NOT NULL,
    FOREIGN KEY (country_id) REFERENCES country(country_id)
);

-- Table: address_status
CREATE TABLE address_status (
    status_id INT PRIMARY KEY AUTO_INCREMENT,
    address_status VARCHAR(20) NOT NULL
);

-- Table: customer
CREATE TABLE customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    registration_date DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Table: customer_address
CREATE TABLE customer_address (
    customer_id INT NOT NULL,
    address_id INT NOT NULL,
    status_id INT NOT NULL,
    PRIMARY KEY (customer_id, address_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (address_id) REFERENCES address(address_id),
    FOREIGN KEY (status_id) REFERENCES address_status(status_id)
);

-- Table: shipping_method
CREATE TABLE shipping_method (
    method_id INT PRIMARY KEY AUTO_INCREMENT,
    method_name VARCHAR(50) NOT NULL,
    cost DECIMAL(10,2) NOT NULL
);

-- Table: order_status
CREATE TABLE order_status (
    status_id INT PRIMARY KEY AUTO_INCREMENT,
    status_value VARCHAR(20) NOT NULL
);

-- Table: cust_order (renamed from customer_order to match requirements)
CREATE TABLE cust_order (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    shipping_method_id INT NOT NULL,
    dest_address_id INT NOT NULL,
    total_amount DECIMAL(10,2),
    current_status INT,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (shipping_method_id) REFERENCES shipping_method(method_id),
    FOREIGN KEY (dest_address_id) REFERENCES address(address_id),
    FOREIGN KEY (current_status) REFERENCES order_status(status_id)
);

-- Table: order_line
CREATE TABLE order_line (
    line_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id)
);

-- Table: order_history
CREATE TABLE order_history (
    history_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    status_id INT NOT NULL,
    status_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (status_id) REFERENCES order_status(status_id)
);


-- C. DATA INSERTION
-- =================

-- Insert book languages
INSERT INTO book_language(language_id, language_name)
VALUES (1, 'English'),
       (2, 'Kiswahili'),
       (3, 'German'),
       (4, 'French');

-- Insert publishers
INSERT INTO publisher(publisher_name)
VALUES ('Penguin Random House'),
       ('Oxford University Press'),
       ('HarperCollins'),
       ('Macmillan');

-- Insert authors
INSERT INTO author (author_name)
VALUES ('William Shakespeare'),
       ('Shaaban Robert'),
       ('Herman Hesse'),
       ('Jules Verne');

-- Insert books
INSERT INTO book (title, publication_year, price, publisher_id, language_id, stock_quantity)
VALUES ('Romeo and Juliet', 1597, 15.99, 1, 1, 100),
       ('Kisima cha Giningi', 1990, 12.50, 2, 2, 50),
       ('Siddhartha', 1922, 20.00, 3, 3, 75),
       ('Around the World in 80 Days', 1873, 18.00, 4, 1, 30);

-- Link books to authors
INSERT INTO book_author (book_id, author_id)
VALUES (1, 1),
       (2, 2),
       (3, 3),
       (4, 4);

-- Insert countries
INSERT INTO country (country_name)
VALUES ('United States'),
       ('Kenya'),
       ('Germany'),
       ('France');

-- Insert addresses
INSERT INTO address (street_number, street_name, city, state, postal_code, country_id)
VALUES ('123', 'Main St', 'New York', 'NY', '10001', 1),
       ('456', 'Kenyatta Ave', 'Nairobi', NULL, '00100', 2),
       ('789', 'Goethestrasse', 'Berlin', NULL, '10115', 3),
       ('101', 'Rue de Rivoli', 'Paris', 'Île-de-France', '75001', 4);

-- Insert address statuses
INSERT INTO address_status (address_status)
VALUES ('Active'),
       ('Inactive'),
       ('Pending'),
       ('Suspended');

-- Insert customers
INSERT INTO customer (first_name, last_name, email, phone)
VALUES ('John', 'Doe', 'john.doe@example.com', '+1234567890'),
       ('Jane', 'Smith', 'jane.smith@example.com', '+254700000000'),
       ('Hans', 'Müller', 'hans.muller@example.com', '+49123456789'),
       ('Marie', 'Dupont', 'marie.dupont@example.com', '+33123456789');

-- Insert customer addresses
INSERT INTO customer_address (customer_id, address_id, status_id)
VALUES (1, 1, 1),
       (2, 2, 1),
       (3, 3, 1),
       (4, 4, 1);

-- Insert shipping methods
INSERT INTO shipping_method (method_name, cost)
VALUES ('Standard', 5.99),
       ('Express', 12.99),
       ('Overnight', 24.99);

-- Insert order statuses
INSERT INTO order_status (status_value)
VALUES ('Pending'),
       ('Processing'),
       ('Shipped'),
       ('Delivered'),
       ('Cancelled');

-- Insert orders
INSERT INTO cust_order (customer_id, shipping_method_id, dest_address_id, total_amount, current_status)
VALUES (1, 1, 1, 31.98, 1),
       (2, 2, 2, 12.50, 3),
       (3, 3, 3, 60.00, 4),
       (4, 1, 4, 18.00, 2);

-- Insert order lines
INSERT INTO order_line (order_id, book_id, quantity, price)
VALUES (1, 1, 2, 15.99),
       (2, 2, 1, 12.50),
       (3, 3, 3, 20.00),
       (4, 4, 1, 18.00);

-- Insert order history
INSERT INTO order_history (order_id, status_id)
VALUES (1, 1),
       (2, 1), (2, 2), (2, 3),
       (3, 1), (3, 2), (3, 3), (3, 4),
       (4, 1), (4, 2);


-- D. USER PRIVILEGES
-- ==================

-- Create admin user with all privileges
CREATE USER IF NOT EXISTS 'bookstore_admin'@'localhost' IDENTIFIED BY 'admin123';
GRANT ALL PRIVILEGES ON bookstore.* TO 'bookstore_admin'@'localhost';

-- Create manager user with read/write access
CREATE USER IF NOT EXISTS 'bookstore_manager'@'localhost' IDENTIFIED BY 'manager123';
GRANT SELECT, INSERT, UPDATE, DELETE ON bookstore.* TO 'bookstore_manager'@'localhost';

-- Create reporting user with read only access
CREATE USER IF NOT EXISTS 'bookstore_report'@'localhost' IDENTIFIED BY 'report123';
GRANT SELECT ON bookstore.* TO 'bookstore_report'@'localhost';

-- Create customer service user
CREATE USER IF NOT EXISTS 'bookstore_service'@'localhost' IDENTIFIED BY 'service123';
GRANT SELECT ON bookstore.* TO 'bookstore_service'@'localhost';
GRANT INSERT, UPDATE ON bookstore.cust_order TO 'bookstore_service'@'localhost';
GRANT INSERT, UPDATE ON bookstore.order_line TO 'bookstore_service'@'localhost';
GRANT INSERT, UPDATE ON bookstore.order_history TO 'bookstore_service'@'localhost';


-- E. SAMPLE QUERIES
-- =================

-- 1. Find all books by a specific author
SELECT b.title, a.author_name, b.price, b.stock_quantity
FROM book b
JOIN book_author ba ON b.book_id = ba.book_id
JOIN author a ON ba.author_id = a.author_id
WHERE a.author_name = 'William Shakespeare';

-- 2. Get all orders with customer details and shipping method
SELECT 
    o.order_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    o.order_date,
    sm.method_name AS shipping_method,
    sm.cost AS shipping_cost,
    o.total_amount,
    os.status_value AS order_status
FROM cust_order o
JOIN customer c ON o.customer_id = c.customer_id
JOIN shipping_method sm ON o.shipping_method_id = sm.method_id
JOIN order_status os ON o.current_status = os.status_id;

-- 3. Get customers with their active addresses
SELECT 
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    a.street_number,
    a.street_name,
    a.city,
    a.state,
    a.postal_code,
    co.country_name,
    ast.address_status
FROM customer c
JOIN customer_address ca ON c.customer_id = ca.customer_id
JOIN address a ON ca.address_id = a.address_id
JOIN country co ON a.country_id = co.country_id
JOIN address_status ast ON ca.status_id = ast.status_id
WHERE ast.address_status = 'Active';

-- 4. Inventory report with publisher information
SELECT 
    b.book_id,
    b.title,
    GROUP_CONCAT(a.author_name SEPARATOR ', ') AS authors,
    p.publisher_name,
    bl.language_name,
    b.publication_year,
    b.price,
    b.stock_quantity,
    (b.price * b.stock_quantity) AS inventory_value
FROM book b
JOIN book_author ba ON b.book_id = ba.book_id
JOIN author a ON ba.author_id = a.author_id
JOIN publisher p ON b.publisher_id = p.publisher_id
JOIN book_language bl ON b.language_id = bl.language_id
GROUP BY b.book_id
ORDER BY inventory_value DESC;

-- 5. Sales report by month
SELECT 
    DATE_FORMAT(co.order_date, '%Y-%m') AS month,
    COUNT(DISTINCT co.order_id) AS total_orders,
    SUM(ol.quantity) AS total_books_sold,
    SUM(co.total_amount) AS total_sales
FROM cust_order co
JOIN order_line ol ON co.order_id = ol.order_id
GROUP BY DATE_FORMAT(co.order_date, '%Y-%m')
ORDER BY month;

-- 6. Order history timeline for a specific order
SELECT 
    oh.history_id,
    co.order_id,
    os.status_value,
    oh.status_date,
    TIMESTAMPDIFF(HOUR, LAG(oh.status_date) OVER (PARTITION BY co.order_id ORDER BY oh.status_date), oh.status_date) AS hours_since_last_status
FROM order_history oh
JOIN cust_order co ON oh.order_id = co.order_id
JOIN order_status os ON oh.status_id = os.status_id
WHERE co.order_id = 3
ORDER BY oh.status_date;

-- 7. Books that are low in stock (less than 10)
SELECT 
    title,
    stock_quantity,
    CASE 
        WHEN stock_quantity < 5 THEN 'CRITICALLY LOW'
        WHEN stock_quantity < 10 THEN 'LOW'
        ELSE 'IN STOCK'
    END AS stock_status
FROM book
WHERE stock_quantity < 10
ORDER BY stock_quantity ASC;

-- 8. Customer order history
SELECT 
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(DISTINCT co.order_id) AS total_orders,
    SUM(co.total_amount) AS total_spent,
    MAX(co.order_date) AS last_order_date
FROM customer c
LEFT JOIN cust_order co ON c.customer_id = co.customer_id
GROUP BY c.customer_id
ORDER BY total_spent DESC;

-- 9. Update book stock after shipment
UPDATE book b
JOIN order_line ol ON b.book_id = ol.book_id
JOIN cust_order co ON ol.order_id = co.order_id
JOIN order_history oh ON co.order_id = oh.order_id
SET b.stock_quantity = b.stock_quantity - ol.quantity
WHERE oh.status_id = (SELECT status_id FROM order_status WHERE status_value = 'Shipped')
AND ol.order_id = 1;

-- 10. Delete test data (example)
DELETE FROM order_history WHERE order_id = 99;
DELETE FROM order_line WHERE order_id = 99;
DELETE FROM cust_order WHERE order_id = 99;