USE Inventory_Management_System;

INSERT INTO roles (role_name) VALUES
('Admin'), ('Inventory Manager'), ('Sales Executive');

INSERT INTO users (username, password_hash, role_id) VALUES
('admin', 'hash_admin', 1),
('manager', 'hash_manager', 2),
('sales', 'hash_sales', 3);

INSERT INTO fuel_types (fuelType_name) VALUES
('Petrol'), ('Diesel'), ('Electric'), ('Hybrid');

INSERT INTO vehicles (model_name, brand, variant, fuel_id, price, stock_quantity) VALUES
('City', 'Honda', 'ZX', 1, 1200000, 10),
('Creta', 'Hyundai', 'SX', 2, 1500000, 8),
('Nexon EV', 'Tata', 'Max', 3, 1800000, 5);

INSERT INTO suppliers (supplier_name, contact_person, contact_number, email, address) VALUES
('Auto Parts Ltd', 'Ramesh', '9876543210', 'auto@gmail.com', 'Mumbai'),
('Speed Motors', 'Suresh', '9123456789', 'speed@gmail.com', 'Delhi');

INSERT INTO spare_parts (part_name, part_number, stock_quantity, reorder_level, supplier_id) VALUES
('Brake Pad', 'BP101', 50, 10, 1),
('Oil Filter', 'OF202', 30, 5, 2),
('Head Light', 'HL303', 20, 5, 1);

INSERT INTO customers (name, contact_number, email, address) VALUES
('Rahul Sharma', '9000011111', 'rahul@gmail.com', 'Pune'),
('Anjali Mehta', '9000022222', 'anjali@gmail.com', 'Ahmedabad');

INSERT INTO purchase_orders VALUES
(1, 1, '2025-01-05', 50000, 'Completed'),
(2, 2, '2025-02-01', 75000, 'Pending');

INSERT INTO payments (payment_type) VALUES
('Cash'),
('Credit Card'),
('UPI');

INSERT INTO sales VALUES
(1, 1, 1, '2025-01-10', 1, 1200000, 1),
(2, 2, 2, '2025-02-15', 1, 1500000, 2);

INSERT INTO spare_parts_sales VALUES
(1, 1, 1, '2025-01-12', 2, 3000),
(2, 2, 2, '2025-02-18', 3, 1500);

INSERT INTO stock_transactions VALUES
(1, 'Vehicle', 1, 'OUT', 1, '2025-01-10'),
(2, 'Spare Part', 1, 'OUT', 2, '2025-01-12'),
(3, 'Spare Part', 2, 'IN', 10, '2025-02-01');

INSERT INTO invoices VALUES
(1, NULL, 1, '2025-01-10', 1200000, 'Paid'),
(2, NULL, 2, '2025-02-15', 1500000, 'Pending');
