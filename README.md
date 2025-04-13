# BookStoreDB
Overview
This MySQL database provides a comprehensive solution for managing bookstore operations, including inventory, customers, orders, and shipping. The relational design ensures data integrity while supporting efficient queries for business operations.

Database Schema
The system includes 15 normalized tables organized into 3 main components:

Book Management:
book, author, publisher, book_language, book_author

Customer Management:
customer, address, country, customer_address, address_status

Order Management:
customer_order, order_line, shipping_method, order_status, order_history

Key Features
Many-to-many relationships (books to authors)

Customer address tracking with status history

Complete order lifecycle management

Inventory tracking with stock quantities

Multi-currency pricing support

User Accounts
Pre-configured user roles with appropriate permissions:

Username -	Role	- Permissions
bookstore_admin - Administrator	- Full database access
bookstore_manager	- Manager	- CRUD operations
readonlyuser -Reporting -	Read-only access
bookstore_service	- Customer Service - 	Limited order management access

Sample Queries
See queries.sql for common business queries including:

Inventory reports
Customer order history
Sales analytics
Low stock alerts