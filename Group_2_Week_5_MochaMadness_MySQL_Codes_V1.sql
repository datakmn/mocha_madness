SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    o.order_id,
    o.store_id,
    o.employee_id,
    o.order_date
FROM customers AS c
INNER JOIN orders AS o
    ON c.customer_id = o.customer_id
ORDER BY o.order_date DESC;

-- INNER JOIN: Find all customers, including those who haven't placed orders yet.
SELECT c.first_name, c.last_name, o.order_id
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;


-- RIGHT JOIN: Find all orders, even if they are linked to customers not in the system (e.g., due to data migration errors).
SELECT c.first_name, c.last_name, o.order_id
FROM customers c
RIGHT JOIN orders o ON c.customer_id = o.customer_id;

-- FULL OUTER JOIN: 
-- Combine a complete list of customers and orders, regardless of match.
SELECT c.first_name, c.last_name, o.order_id
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
UNION
SELECT c.first_name, c.last_name, o.order_id
FROM customers c
RIGHT JOIN orders o ON c.customer_id = o.customer_id;

-- CROSS JOIN: 
-- Generate all possible combinations of menu items and promotions.
SELECT p.product_name, s.store_name
FROM products p
CROSS JOIN stores s;

-- Inner Join: Get all orders with customer names
SELECT o.order_id, c.first_name, c.last_name
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id;

-- Self Join: Employees with same manager
SELECT e1.employee_id, e1.first_name, e2.first_name AS manager_name
FROM employees e1
JOIN employees e2 ON e1.manager_id = e2.employee_id;

-- Subquery "IN" - Retrieve all customers who have placed at least one order:
SELECT customer_id, first_name, last_name
FROM customers
WHERE customer_id IN (
    SELECT DISTINCT customer_id
    FROM orders
);


-- EXISTS with JOIN - Find customers who have made at least one payment above $10:
SELECT c.customer_id, c.first_name, c.last_name
FROM customers c
WHERE EXISTS (
    SELECT 1
    FROM orders o
    JOIN payments p ON o.order_id = p.order_id
    WHERE o.customer_id = c.customer_id
      AND p.amount > 10
);


-- Correlated - Find orders greater than the average payment for the same store
SELECT o.order_id, o.store_id, p.amount
FROM orders o
JOIN payments p ON o.order_id = p.order_id
WHERE p.amount > (
    SELECT AVG(p2.amount)
    FROM orders o2
    JOIN payments p2 ON o2.order_id = p2.order_id
    WHERE o2.store_id = o.store_id
);

);

-- Nested: Find customers who have placed at least one order in Store_ID 3.
SELECT customer_id, first_name, last_name
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
    WHERE store_id = 3
);


-- Scenario: Combine Payments from Different Methods.
-- Objective: Merge credit card and cash payments into one unified transaction report.
SELECT 
    payment_id,
    order_id,
    amount,
    'Credit Card' AS payment_type
FROM payments
WHERE payment_type = 'Credit Card'

UNION

SELECT 
    payment_id,
    order_id,
    amount,
    'Cash' AS payment_type
FROM payments
WHERE payment_type = 'Cash';

