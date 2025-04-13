-- CREATING THE DATABASE
 CREATE DATABASE BOOKSTORE;

-- SELECT THE DATABASE
 USE BOOKSTORE;

-- CREATING TABLES
-- TABLE 1:BOOK LANGUAGE
 CREATE TABLE book_language(
  language_id INT PRIMARY KEY,
  language_name VARCHAR(50)
 );

-- TABLE 2:PUBLISHER TABLE
 CREATE TABLE publisher(
 publisher_id INT PRIMARY KEY AUTO_INCREMENT,
 publisher_name VARCHAR(100) NOT NULL
 );

-- TABLE 3:AUTHOR TABLE
CREATE TABLE author (
 author_id INT PRIMARY KEY AUTO_INCREMENT,
 author_name VARCHAR(100) NOT NULL
 );

-- TABLE 4: BOOK
 CREATE TABLE book (
  book_id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(100) NOT NULL,
  publication_year YEAR,
  price DECIMAL (10,2),
  publisher_id INT,
  language_id INT,
  stock_quantity INT NOT NULL DEFAULT 0,
  FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id),
  FOREIGN KEY (language_id) REFERENCES book_language(language_id)
 );

-- TABLE 5:BOOK AUTHOR
 CREATE TABLE book_author(
 book_id INT NOT NULL,
 author_id INT NOT NULL,
 PRIMARY KEY (book_id, author_id),
 FOREIGN KEY (book_id) REFERENCES book(book_id),
 FOREIGN KEY (author_id) REFERENCES author(author_id)
 );

-- TABLE 6:COUNTRY
 CREATE TABLE country (
 country_id INT PRIMARY KEY AUTO_INCREMENT,
 country_name VARCHAR(50) NOT NULL
 );

-- TABLE 7:ADDRESS
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

-- TABLE 8:ADDRESS STATUS
 CREATE TABLE address_status (
 status_id INT PRIMARY KEY AUTO_INCREMENT,
 address_status VARCHAR(20) NOT NULL
 );

-- TABLE 9:CUSTOMER
 CREATE TABLE customer (
 customer_id INT PRIMARY KEY AUTO_INCREMENT,
 first_name VARCHAR(50) NOT NULL,
 last_name VARCHAR(50) NOT NULL,
 email VARCHAR(100) UNIQUE NOT NULL,
 phone VARCHAR(20),
 registration_date DATETIME DEFAULT CURRENT_TIMESTAMP
 );

-- TABLE 10:CUSTOMER ADDRESS
 CREATE TABLE customer_address (
 customer_id INT NOT NULL,
 address_id INT NOT NULL,
 status_id INT NOT NULL,
 PRIMARY KEY (customer_id, address_id),
 FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
 FOREIGN KEY (address_id) REFERENCES address(address_id),
 FOREIGN KEY (status_id) REFERENCES address_status(status_id)
 );

-- TABLE 11:SHIPPING METHOD
 CREATE TABLE shipping_method (
 method_id INT PRIMARY KEY AUTO_INCREMENT,
 method_name VARCHAR(50) NOT NULL,
 cost DECIMAL(10,2) NOT NULL
 );

-- TABLE 12:ORDER STATUS
 CREATE TABLE order_status (
  status_id INT PRIMARY KEY AUTO_INCREMENT,
-  status_value VARCHAR(20) NOT NULL
  );

-- TABLE 13:CUSTOMER ORDER
 CREATE TABLE customer_order (
     order_id INT PRIMARY KEY AUTO_INCREMENT,
     customer_id INT NOT NULL,
     order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
     shipping_method_id INT NOT NULL,
     dest_address_id INT NOT NULL,
     FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
     FOREIGN KEY (shipping_method_id) REFERENCES shipping_method(method_id),
     FOREIGN KEY (dest_address_id) REFERENCES address(address_id)
 );

-- TABLE 14:ORDER LINE
 CREATE TABLE order_line (
    line_id INT PRIMARY KEY AUTO_INCREMENT,
     order_id INT NOT NULL,
     book_id INT NOT NULL,
     quantity INT NOT NULL DEFAULT 1,
    price DECIMAL(10,2) NOT NULL,
     FOREIGN KEY (order_id) REFERENCES customer_order(order_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id)
 );

-- TABLE 15:ORDER HISTORY
 CREATE TABLE order_history (
     history_id INT PRIMARY KEY AUTO_INCREMENT,
     order_id INT NOT NULL,
     status_id INT NOT NULL,
    status_date DATETIME DEFAULT CURRENT_TIMESTAMP,
     FOREIGN KEY (order_id) REFERENCES customer_order(order_id),
     FOREIGN KEY (status_id) REFERENCES order_status(status_id)
);
