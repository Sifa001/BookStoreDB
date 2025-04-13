-- DATA INSERTION
-- Table: book_language
 INSERT INTO book_language(language_id, language_name)
  VALUES( 1, 'English'),
  (2, 'Kiswahili'),
  (3, 'German'),
  (4, 'French');
 
 -- Table: publisher
INSERT INTO publisher(publisher_name)
VALUES ('Collen hoover'),
('Ken Walibora'),
('Herman Hesse'),
('Jules Verne');

-- Table: author
INSERT INTO author (author_name)
 VALUES ('William Shakespeare'),
 ('Shaaban Robert'),
 ('John Wolfgang'),
 ('Victor Hugo');

 -- Table: book
INSERT INTO book (title, publication_year, price, publisher_id, language_id, stock_quantity)
VALUES ('Romeo and Juliet', 1597, 15.99, 1, 1, 100),
('Kisima cha Watu', 1990, 12.50, 2, 2, 50),
('Steppenwolf', 1927, 20.00, 3, 3, 75),
('Journey to the Center of the Earth', 1864, 18.00, 4, 4, 30);  

-- Table: country
INSERT INTO country (country_name)
VALUES ('United States'),
('Kenya'),
('Germany'),
('France');

-- Table: address
INSERT INTO address (street_number, street_name, city, state, postal_code, country_id)
VALUES ('123', 'Main St', 'New York', 'NY', '10001', 1),
('456', 'High St', 'Nairobi', 'Nairobi', '00100', 2),
('789', 'Park Ave', 'Berlin', 'Berlin', '10115', 3),
('101', 'Rue de Rivoli', 'Paris', 'Île-de-France', '75001', 4);

-- Table: address_status
INSERT INTO address_status (address_status)
VALUES ('Active'),
('Inactive'),
('Pending'),
('Suspended');

-- Table: customer
INSERT INTO customer (first_name, last_name, email, phone)
VALUES ('Vivian','Sifa','sifavivz@gmail.com', '+15106349734'),
('Linda','Kibiti','leekiboti@gmail.com', '0705881229'),
('Monica','Anders','anders123@gmail.com', '+4930123456'),
('Dennis','Virgo','dennisv@gmail.com', '+33123456789');

-- Table: customer_order
INSERT INTO customer_order (customer_id, order_date, total_amount, order_status)
VALUES (1, '2023-10-01', 100.00, 'Pending'),
(2, '2023-10-02', 50.00, 'Shipped'),
(3, '2023-10-03', 75.00, 'Delivered'),
(4, '2023-10-04', 200.00, 'Cancelled');

-- Table: customer_address
INSERT INTO customer_address (customer_id, address_id, status_id)
VALUES (2, 1, 1),
(3, 2, 2),
(4, 3, 3),
(1, 4, 4);

-- Table:shipping_method
INSERT INTO shipping_method (method_name, cost) 
VALUES ('Standard', 3.99),
('Express', 8.99),
('Overnight', 15.99);

-- Table:order_status
INSERT INTO order_status (status_value)
VALUES ('Pending'),
('Shipped'),
('Delivered'),
('Cancelled');

-- Table: customer_order
INSERT INTO customer_order (customer_id, shipping_method_id, dest_address_id) VALUES 
(1, 1, 1),
(2, 2, 3);


-- Table: order_line
INSERT INTO order_line (order_id, book_id, quantity, price) VALUES 
(1, 5, 2, 15.99),
(1, 6, 1, 12.50),
(2, 7, 3, 20.00),
(2, 8, 1, 18.00);

-- Table: order_history
INSERT INTO order_history (order_id, status_id) 
VALUES (1, 1),
(1, 2),
(2, 3),
(2, 4);