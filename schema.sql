CREATE DATABASE Inventory_Management_System;
USE Inventory_Management_System;

-- Roles Table
CREATE TABLE roles (
    r_id INT AUTO_INCREMENT PRIMARY KEY,
    role_name VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Users Table
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    password_hash VARCHAR(255),
    role_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (role_id) REFERENCES roles(r_id)
);

-- Fuel Types Table
CREATE TABLE fuel_types (
    fuel_id INT AUTO_INCREMENT PRIMARY KEY,
    fuelType_name VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Vehicles Table
CREATE TABLE vehicles (
    vehicle_id INT AUTO_INCREMENT PRIMARY KEY,
    model_name VARCHAR(100),
    brand VARCHAR(50),
    variant VARCHAR(50),
    fuel_id INT,
    price DECIMAL(10,2),
    stock_quantity INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (fuel_id) REFERENCES fuel_types(fuel_id)
);

-- Suppliers Table
CREATE TABLE suppliers (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_name VARCHAR(100),
    contact_person VARCHAR(100),
    contact_number VARCHAR(20),
    email VARCHAR(100),
    address VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Spare Parts Table
CREATE TABLE spare_parts (
    part_id INT AUTO_INCREMENT PRIMARY KEY,
    part_name VARCHAR(100),
    part_number VARCHAR(50),
    stock_quantity INT,
    reorder_level INT,
    supplier_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

-- Customers Table
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    contact_number VARCHAR(20),
    email VARCHAR(100),
    address VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Payments Table
CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    payment_type VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Sales Table
CREATE TABLE sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    vehicle_id INT,
    sale_date TIMESTAMP,
    quantity INT,
    total_price DECIMAL(10,2),
    payment_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicles(vehicle_id),
    FOREIGN KEY (payment_id) REFERENCES payments(payment_id)
);

-- Spare Parts Sales Table
CREATE TABLE spare_parts_sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    part_id INT,
    sale_date TIMESTAMP,
    quantity INT,
    total_price DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (part_id) REFERENCES spare_parts(part_id)
);

-- Purchase Orders Table
CREATE TABLE purchase_orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_id INT,
    order_date TIMESTAMP,
    total_amount DECIMAL(10,2),
    order_status VARCHAR(20),
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

-- Stock Transactions Table
CREATE TABLE stock_transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    item_type VARCHAR(50),
    item_id INT,
    transaction_type VARCHAR(50),
    quantity INT,
    transaction_date TIMESTAMP
);

-- Invoices Table
CREATE TABLE invoices (
    invoice_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    sale_id INT,
    issue_date TIMESTAMP,
    amount DECIMAL(10,2),
    payment_status VARCHAR(50),
    FOREIGN KEY (order_id) REFERENCES purchase_orders(order_id),
    FOREIGN KEY (sale_id) REFERENCES sales(sale_id)
);
