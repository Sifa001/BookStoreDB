# Bookstore Relational Database

## Overview
A comprehensive relational database system for managing bookstore operations, including inventory, customers, orders, and shipping.

## Database Schema
**Core Tables:**
- `book`: Stores book details (title, price, stock)
- `author` & `book_author`: Manage authors and their book relationships
- `customer`: Customer information
- `cust_order`: Order records with shipping details
- `order_line`: Individual items within orders
- `order_history`: Status tracking for orders

**Supporting Tables:**
- `publisher`, `book_language`, `country`
- `address`, `customer_address`, `address_status`
- `shipping_method`, `order_status`

## Key Features
- **Inventory Management**: Track book stock levels and values
- **Customer System**: Manage customer details with multiple addresses
- **Order Processing**: Full order lifecycle tracking
- **Reporting**: Built-in queries for sales analysis and inventory reports

## Implementation Details
1. **Database Setup**:
   - MySQL database with 15 related tables
   - Proper foreign key constraints for data integrity

2. **User Access Control**:
   - Four distinct user roles with appropriate privileges:
     - Admin (full access)
     - Manager (read/write)
     - Reporting (read-only)
     - Customer Service (limited write access)

3. **Sample Data**:
   - Pre-loaded with sample books, authors, customers, and orders
   - Demonstrates all relationships and functionalities

## Sample Queries
The database includes ready-to-use queries for:
- Inventory status reports
- Customer purchase history
- Sales analysis by period
- Order fulfillment tracking
- Low stock alerts

## Setup Instructions
1. Execute the complete SQL script in MySQL
2. Use the provided credentials to access different user roles:
   - Admin: `bookstore_admin` / `admin123`
   - Manager: `bookstore_manager` / `manager123`
   - Reporting: `bookstore_report` / `report123`
   - Service: `bookstore_service` / `service123`
