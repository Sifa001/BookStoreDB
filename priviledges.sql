-- CREATE ADMIN USER WITH ALL PRIVILEDGES
 CREATE USER 'bookstore_admin'@'localhost' IDENTIFIED BY 'admin';
 GRANT ALL PRIVILEGES ON BOOKSTOREe.* TO 'bookstore_admin'@'localhost';

-- CREATE MANAGER USER WITH READ/WRITE ACCESS
 CREATE USER 'bookstore_manager'@'localhost' IDENTIFIED BY 'manager';
 GRANT SELECT, INSERT, UPDATE, DELETE ON BOOKSTORE.* TO 'bookstore_manager'@'localhost';

-- CREATE REPORTING USER WITH READ ONLY ACCESS
 CREATE USER 'readonly_user'@'localhost' IDENTIFIED BY 'readonlypass';
 GRANT SELECT ON BookStoreDB.* TO 'readonly_user'@'localhost';

-- CREATE CUSTOMER SERVICE USER
CREATE USER 'bookstore_service'@'localhost' IDENTIFIED BY 'service';
GRANT SELECT ON BookStore.* TO 'bookstore_service'@'localhost';
GRANT INSERT, UPDATE ON BookStore.customer_order TO 'bookstore_service'@'localhost';
GRANT INSERT, UPDATE ON BookStore.order_line TO 'bookstore_service'@'localhost';
GRANT INSERT, UPDATE ON BookStore.order_history TO 'bookstore_service'@'localhost';
