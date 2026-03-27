USE Inventory_Management_System;

-- Monthly Sales Report
SELECT 
    DATE_FORMAT(sale_date, '%Y-%M') AS month,
    SUM(total_price) AS total_sales
FROM sales
GROUP BY month;

-- Top Selling Vehicles
SELECT
    v.model_name,
    SUM(s.quantity) AS total_units_sold
FROM sales s
JOIN vehicles v ON s.vehicle_id = v.vehicle_id
GROUP BY v.model_name;

-- Low Stock Alert
SELECT
    part_name,
    stock_quantity,
    reorder_level
FROM spare_parts
WHERE stock_quantity <= reorder_level;

-- Update Vehicle Stock
UPDATE vehicles v
JOIN sales s ON v.vehicle_id = s.vehicle_id
SET v.stock_quantity = v.stock_quantity - s.quantity
WHERE s.sale_id = 1;
