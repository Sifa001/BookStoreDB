-- Find all books written by William Shakespeare
SELECT b.title 
FROM book b
JOIN book_author ba ON b.book_id = ba.book_id
JOIN author a ON a.author_id = ba.author_id
WHERE author_name = 'Shaaban Robert';

-- Get all orders with customer name and shipping method
SELECT co.order_id, c.first_name, c.last_name, sm.method_name
FROM customer_order co
JOIN customer c ON co.customer_id = c.customer_id
JOIN shipping_method sm ON co.shipping_method_id = sm.method_id;

-- Get all customers who have placed orders in the last month
SELECT c.first_name, c.last_name, co.order_date
FROM customer c
JOIN customer_order co ON c.customer_id = co.customer_id
WHERE co.order_date >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH);

-- Get all books that are out of stock
SELECT b.title, b.stock_quantity
FROM book b
WHERE b.stock_quantity = 0;

-- Get Inventory Report: List of books with their stock quantity and price
SELECT b.title, b.stock_quantity, b.price
FROM book b


