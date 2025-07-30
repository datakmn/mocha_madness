CREATE DATABASE mocha_madness;

-- 1. Customers
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15) NOT NULL
);

-- 2. Employees
CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    position VARCHAR(50) NOT NULL,
    store_id INT UNIQUE NOT NULL
);

-- 3. Stores
CREATE TABLE stores (
    store_id INT AUTO_INCREMENT PRIMARY KEY,
    store_name VARCHAR(100) NOT NULL,
    location VARCHAR(255) NOT NULL
);

-- 4. Products (Menu Items)
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price DECIMAL(5,2) NOT NULL
);

-- 5. Orders
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    store_id INT,
    employee_id INT,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- 6. Order_Items (many-to-many between orders and products)
CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT
);

-- 7. Payments
CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    payment_type VARCHAR(50), -- e.g. Cash, Credit, Mobile
    amount DECIMAL(6,2),
    payment_date DATETIME DEFAULT CURRENT_TIMESTAMP
);


-- 8. Previously, I have crated required tables. In this step, I am going to add data into the tables.

-- 9. Adding customers data into 'customers' table.
INSERT INTO customers (first_name, last_name, email, phone, address)
VALUES 
('Alice', 'Johnson', 'alice.j@example.com', '714-555-0101', '123 Maple St, Anaheim, CA 92802'),
('Bob', 'Smith', 'bob.smith@example.com', '714-555-0102', '456 Oak Ave, Santa Ana, CA 92701'),
('Charlie', 'Brown', 'charlie.b@example.com', '714-555-0103', '789 Pine Dr, Orange, CA 92866'),
('Diana', 'Lee', 'diana.lee@example.com', '714-555-0104', '321 Birch St, Fullerton, CA 92831'),
('Ethan', 'Garcia', 'ethan.garcia@example.com', '714-555-0105', '654 Spruce Ln, Irvine, CA 92612'),
('Fiona', 'Nguyen', 'fiona.ng@example.com', '714-555-0106', '987 Willow Ct, Garden Grove, CA 92843'),
('George', 'Kim', 'george.kim@example.com', '714-555-0107', '246 Palm Dr, Tustin, CA 92780'),
('Hannah', 'Martinez', 'hannah.m@example.com', '714-555-0108', '135 Sycamore Rd, Brea, CA 92821'),
('Isaac', 'Lopez', 'isaac.lopez@example.com', '714-555-0109', '864 Chestnut St, Costa Mesa, CA 92626'),
('Julia', 'Wang', 'julia.wang@example.com', '714-555-0110', '753 Redwood Blvd, Buena Park, CA 90620');

-- 10. The above code didn't run because I forgot to add "address" column in the 'customers' table. Now, I need to update the table.
-- To add an additional column to an existing table in MySQL, you use the ALTER TABLE statement.

-- 11. Adding 'address' cloumn to 'customers' table.
ALTER TABLE customers
ADD address VARCHAR(50) AFTER phone;

-- 12. The code ran successfuly. So I am runing the code from No.9 again. 
-- 13. It works! The customers table has been updated. 
-- 14. I realized that using 'example.com' for user doesn't seem good. So, I am changing it our shop name.

-- 15. Updaing the email's domain. 
UPDATE customers
SET email = REPLACE(email, '@example.com', '@mochamadness.com');

-- 16. I found that the code didn't run because of the 'safe mode'. Doing some research, if you want to update the table and your workbench's safe mode is on, you need you use 'WHERE' clause using a key.
UPDATE customers
SET email = REPLACE(email, '@example.com', '@mochamadness.com')
WHERE customer_id > 0;

-- 17. Now, it works at Action-43.

-- 18. Adding data into 'employees' data.
INSERT INTO employees (first_name, last_name, email, phone, position, store_id)
VALUES 
('Emily', 'Taylor', 'emily.taylor@mochamadness.com', '714-555-1001', 'Barista', 1),
('James', 'Anderson', 'james.anderson@mochamadness.com', '714-555-1002', 'Manager', 1),
('Sophia', 'Lee', 'sophia.lee@mochamadness.com', '714-555-1003', 'Cashier', 2),
('Daniel', 'Kim', 'daniel.kim@mochamadness.com', '714-555-1004', 'Barista', 2),
('Olivia', 'Martinez', 'olivia.martinez@mochamadness.com', '714-555-1005', 'Shift Supervisor', 3),
('Ethan', 'Nguyen', 'ethan.nguyen@mochamadness.com', '714-555-1006', 'Barista', 3),
('Isabella', 'Brown', 'isabella.brown@mochamadness.com', '714-555-1007', 'Cashier', 4),
('Liam', 'Wilson', 'liam.wilson@mochamadness.com', '714-555-1008', 'Manager', 4),
('Mia', 'Lopez', 'mia.lopez@mochamadness.com', '714-555-1009', 'Barista', 5),
('Noah', 'Davis', 'noah.davis@mochamadness.com', '714-555-1010', 'Barista', 5);

-- 19. It can't run because I didn't add 'email' column in the 'employees' table. Now, I will update the table again.alter

-- 20. Adding 'email' column to 'employees' table.
ALTER TABLE employees
ADD email VARCHAR(100) UNIQUE NOT NULL AFTER last_name;

ALTER TABLE employees
ADD phone VARCHAR(20) NOT NULL AFTER email;

ALTER TABLE employees
DROP INDEX store_id;

-- 21. 'email' column has been added to the table, now running the Line-18 again to add data into the table.  

-- 22. Now adding data to 'products' table.
INSERT INTO products (product_name, category, price)
VALUES
('Caffe Latte', 'Coffee', 4.25),
('Cappuccino', 'Coffee', 4.00),
('Espresso', 'Coffee', 3.00),
('Iced Coffee', 'Cold Drink', 3.75),
('Vanilla Latte', 'Coffee', 4.50),
('Matcha Latte', 'Tea', 4.75),
('Chai Tea Latte', 'Tea', 4.50),
('Hot Chocolate', 'Beverage', 3.50),
('Blueberry Muffin', 'Bakery', 2.75),
('Croissant', 'Bakery', 3.25);

-- 23. Now adding 'stores' data.
INSERT INTO stores (store_name, location)
VALUES
('Moch Madness - Downtown', '123 Main St, Anaheim, CA 92801'),
('Moch Madness - GardenWalk', '400 Disney Way, Anaheim, CA 92802'),
('Moch Madness - Santa Ana Central', '789 Civic Center Dr, Santa Ana, CA 92701'),
('Moch Madness - Orange Circle', '101 Plaza Sq, Orange, CA 92866'),
('Moch Madness - Irvine Spectrum', '670 Spectrum Center Dr, Irvine, CA 92618'),
('Moch Madness - Huntington Beach', '200 Beach Blvd, Huntington Beach, CA 92648'),
('Moch Madness - Fullerton Station', '345 Harbor Blvd, Fullerton, CA 92832'),
('Moch Madness - Tustin Legacy', '1201 Tustin Ranch Rd, Tustin, CA 92782'),
('Moch Madness - Costa Mesa', '560 Newport Blvd, Costa Mesa, CA 92627'),
('Moch Madness - Brea Mall', '200 Brea Mall, Brea, CA 92821');

-- 24. Adding 'payments' method.
INSERT INTO payments (order_id, payment_type, amount, payment_date)
VALUES
(1, 'Credit Card', 8.50, '2025-07-15 09:15:23'),
(2, 'Cash', 5.25, '2025-07-15 10:42:17'),
(3, 'Mobile Payment', 12.00, '2025-07-15 11:03:50'),
(4, 'Credit Card', 9.75, '2025-07-16 08:30:00'),
(5, 'Credit Card', 7.00, '2025-07-16 09:45:12'),
(6, 'Cash', 4.95, '2025-07-16 12:15:29'),
(7, 'Mobile Payment', 10.25, '2025-07-17 14:20:45'),
(8, 'Credit Card', 11.60, '2025-07-17 15:05:32'),
(9, 'Cash', 6.80, '2025-07-17 16:40:10'),
(10, 'Mobile Payment', 8.90, '2025-07-18 08:25:00');

-- 25. Adding 'orders' data.
INSERT INTO orders (customer_id, store_id, employee_id, order_date)
VALUES
(1, 2, 3, '2025-07-15 08:15:00'),
(2, 4, 1, '2025-07-15 09:05:00'),
(3, 1, 2, '2025-07-15 09:45:00'),
(4, 3, 4, '2025-07-15 10:30:00'),
(5, 2, 1, '2025-07-16 08:20:00'),
(6, 5, 2, '2025-07-16 09:10:00'),
(7, 4, 3, '2025-07-16 10:05:00'),
(8, 1, 5, '2025-07-17 11:30:00'),
(9, 3, 4, '2025-07-17 12:45:00'),
(10, 2, 2, '2025-07-18 08:55:00');

-- 26. Adding data to 'order_items"
INSERT INTO order_items (order_id, product_id, quantity)
VALUES
(1, 1, 2),
(1, 3, 1),
(2, 2, 1),
(3, 4, 2),
(3, 1, 1),
(4, 5, 1),
(5, 6, 3),
(6, 2, 2),
(7, 3, 1),
(8, 1, 2),
(9, 5, 1),
(10, 4, 2),
(10, 6, 1);

-- 27. The first section, creating sample tables end here.

-- 28. Inspecting 'customers' table.
DESCRIBE customers;

-- 29. Showing Tables
SHOW tables;

-- 30. Adding Constraints. How to Add a Foreign Key After Table Creation! (This prompts allow when a customer is deleted, its related order will be deleted too. In this case, (parent table = customers) and (child table = orders)
  
ALTER TABLE	orders
ADD CONSTRAINT fk_customer
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
ON DELETE CASCADE; 


-- 31. Adding 'constraints' for 'order_items'. I learnt one thing, when updating the table using 'ALTER' clauses, I couldn't add two constraints in one prompt. I have to seperate it to two prompts in order to two constraints (fk_order & fk_product).
ALTER TABLE order_items
ADD CONSTRAINT fk_order
FOREIGN KEY (order_id) REFERENCES orders(order_id) 
ON DELETE CASCADE;

ALTER TABLE order_items
ADD CONSTRAINT fk_product
FOREIGN KEY (product_id) REFERENCES products(product_id);

SELECT * FROM stores;

-- 31. Creating Sales Reports
CREATE TABLE sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    store_id INT,
    sale_month VARCHAR(20),
    sale_year INT,
    amount DECIMAL(10, 2),
    FOREIGN KEY (store_id) REFERENCES stores(store_id)
);

-- 32. Updaing Sales Data
INSERT INTO sales (store_id, sale_month, sale_year, amount) 
VALUES
(1, 'January', 2025, 56231.50),
(2, 'January', 2025, 48912.75),
(3, 'January', 2025, 53298.40),
(4, 'January', 2025, 47012.10),
(5, 'January', 2025, 51560.20),
(6, 'January', 2025, 49877.60),
(7, 'January', 2025, 47652.90),
(8, 'January', 2025, 49028.00),
(9, 'January', 2025, 52590.80),
(10, 'January', 2025, 45218.95);


INSERT INTO sales (store_id, sale_month, sale_year, amount) VALUES
(1, 'February', 2025, 55526.02),
(2, 'February', 2025, 51117.32),
(3, 'February', 2025, 54534.89),
(4, 'February', 2025, 47475.91),
(5, 'February', 2025, 49786.63),
(6, 'February', 2025, 48161.78),
(7, 'February', 2025, 45547.04),
(8, 'February', 2025, 50823.29),
(9, 'February', 2025, 53122.57),
(10, 'February', 2025, 46159.83);

INSERT INTO sales (store_id, sale_month, sale_year, amount) VALUES
(1, 'March', 2025, 53034.74),
(2, 'March', 2025, 51319.11),
(3, 'March', 2025, 52902.25),
(4, 'March', 2025, 48295.80),
(5, 'March', 2025, 51708.69),
(6, 'March', 2025, 47247.57),
(7, 'March', 2025, 43935.98),
(8, 'March', 2025, 49830.11),
(9, 'March', 2025, 51281.51),
(10, 'March', 2025, 45843.31);

INSERT INTO sales (store_id, sale_month, sale_year, amount) VALUES
(1, 'April', 2025, 54177.93),
(2, 'April', 2025, 52582.64),
(3, 'April', 2025, 50954.65),
(4, 'April', 2025, 50085.49),
(5, 'April', 2025, 52723.83),
(6, 'April', 2025, 45893.81),
(7, 'April', 2025, 41752.99),
(8, 'April', 2025, 50562.82),
(9, 'April', 2025, 50629.88),
(10, 'April', 2025, 44136.73);

INSERT INTO sales (store_id, sale_month, sale_year, amount) VALUES
(1, 'May', 2025, 55279.75),
(2, 'May', 2025, 54146.51),
(3, 'May', 2025, 53149.30),
(4, 'May', 2025, 51551.74),
(5, 'May', 2025, 51960.74),
(6, 'May', 2025, 47254.75),
(7, 'May', 2025, 43247.13),
(8, 'May', 2025, 50746.31),
(9, 'May', 2025, 48726.64),
(10, 'May', 2025, 45306.31);

INSERT INTO sales (store_id, sale_month, sale_year, amount) VALUES
(1, 'June', 2025, 54866.30),
(2, 'June', 2025, 54371.22),
(3, 'June', 2025, 52498.92),
(4, 'June', 2025, 50824.12),
(5, 'June', 2025, 52348.26),
(6, 'June', 2025, 49425.73),
(7, 'June', 2025, 42763.43),
(8, 'June', 2025, 49370.47),
(9, 'June', 2025, 49068.10),
(10, 'June', 2025, 44948.47);

INSERT INTO sales (store_id, sale_month, sale_year, amount) VALUES
(1, 'July', 2025, 56505.92),
(2, 'July', 2025, 56389.44),
(3, 'July', 2025, 52919.38),
(4, 'July', 2025, 50575.41),
(5, 'July', 2025, 52217.44),
(6, 'July', 2025, 51887.45),
(7, 'July', 2025, 44498.94),
(8, 'July', 2025, 51607.30),
(9, 'July', 2025, 47907.98),
(10, 'July', 2025, 43998.74);

-- 33. Using 'Comparison Operators'
SELECT store_id, sale_month, sale_year, amount
FROM sales
WHERE store_id = 1;


-- 34. Using "ORDER BY"
SELECT store_id, amount
FROM sales
WHERE sale_month = 'January' AND sale_year = 2025
ORDER BY amount DESC;

-- 35. Using "Aggregate Functions"

-- 36. Using "COUNT"
SELECT COUNT(*) AS stores_above_50k
FROM sales
WHERE sale_month = 'January' AND sale_year = 2025 AND amount > 50000;

-- 37. Using "SUM"
SELECT SUM(amount) AS total_sales_store_1
FROM sales
WHERE store_id = 1
  AND sale_year = 2025
  AND sale_month IN ('January', 'February', 'March', 'April', 'May', 'June');

-- 38. Using "AVG"
SELECT AVG(amount) AS average_sales_january
FROM sales
WHERE sale_month = 'January' AND sale_year = 2025;

-- 39. Using "MAX"

SELECT store_id, amount
FROM sales
WHERE sale_month = 'February' AND sale_year = 2025
  AND amount = (
    SELECT MAX(amount)
    FROM sales
    WHERE sale_month = 'February' AND sale_year = 2025
);


-- 40. Find stores with January sales between $45,000 and $55,000.
SELECT store_id, amount
FROM sales
WHERE sale_month = 'January' AND sale_year = 2025
  AND amount BETWEEN 45000 AND 55000;



-- 41. Using "LIKE"
SELECT first_name, last_name, email
FROM customers
WHERE email LIKE '%@mochamadness.com';

-- 42. Using "IN"
SELECT store_id, sale_month, amount
FROM sales
WHERE sale_month IN ('January', 'February', 'March') AND sale_year = 2025;





