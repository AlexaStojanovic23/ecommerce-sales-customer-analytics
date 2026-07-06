INSERT INTO customers (customer_id, customer_name, city) VALUES
(1, 'Ana Petrovic', 'Belgrade'),
(2, 'Marko Jovanovic', 'Belgrade'),
(3, 'Jelena Nikolic', 'Novi Sad'),
(4, 'Nikola Ilic', 'Novi Sad'),
(5, 'Ivana Stankovic', 'Nis'),
(6, 'Stefan Markovic', 'Nis'),
(7, 'Milica Pavlovic', 'Kragujevac'),
(8, 'Luka Djordjevic', 'Kragujevac');


INSERT INTO products (product_id, product_name, category) VALUES
(1, 'Laptop', 'Electronics'),
(2, 'Headphones', 'Electronics'),
(3, 'Smartphone', 'Electronics'),
(4, 'T-Shirt', 'Clothing'),
(5, 'Jacket', 'Clothing'),
(6, 'Running Shoes', 'Sports'),
(7, 'Dumbbells', 'Sports'),
(8, 'Yoga Mat', 'Sports'),
(9, 'Coffee Maker', 'Home'),
(10, 'Desk Lamp', 'Home'),
(11, 'Office Chair', 'Home'),
(12, 'Blender', 'Home');


INSERT INTO orders (order_id, customer_id, order_date, channel) VALUES
(1, 1, '2026-01-10', 'Online'),
(2, 2, '2026-02-05', 'Store'),
(3, 3, '2026-03-15', 'Marketplace'),
(4, 4, '2026-04-07', 'Online'),
(5, 5, '2026-05-20', 'Store'),

(6, 1, '2026-06-01', 'Online'),
(7, 1, '2026-06-05', 'Store'),
(8, 2, '2026-06-03', 'Online'),
(9, 2, '2026-06-18', 'Marketplace'),
(10, 3, '2026-06-04', 'Store'),
(11, 3, '2026-06-22', 'Online'),
(12, 4, '2026-06-07', 'Marketplace'),
(13, 4, '2026-06-14', 'Online'),
(14, 5, '2026-06-06', 'Store'),
(15, 5, '2026-06-26', 'Online'),
(16, 6, '2026-06-08', 'Online'),
(17, 6, '2026-06-19', 'Store'),
(18, 7, '2026-06-11', 'Marketplace'),
(19, 7, '2026-06-24', 'Online'),
(20, 8, '2026-06-12', 'Store'),
(21, 8, '2026-06-28', 'Marketplace');


INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 1000.00),
(1, 4, 2, 40.00),

(2, 3, 1, 700.00),
(2, 5, 1, 120.00),

(3, 11, 1, 220.00),
(3, 10, 2, 45.00),

(4, 6, 2, 130.00),
(4, 7, 1, 80.00),

(5, 9, 2, 90.00),
(5, 12, 1, 70.00),

(6, 1, 1, 1000.00),
(6, 2, 2, 150.00),

(7, 5, 2, 120.00),
(7, 4, 5, 40.00),

(8, 3, 2, 700.00),
(8, 2, 1, 150.00),

(9, 1, 2, 1000.00),
(9, 10, 2, 45.00),

(10, 11, 2, 220.00),
(10, 9, 1, 90.00),

(11, 12, 3, 70.00),
(11, 10, 4, 45.00),

(12, 6, 3, 130.00),
(12, 7, 2, 80.00),

(13, 8, 5, 30.00),
(13, 2, 2, 150.00),

(14, 5, 4, 120.00),
(14, 4, 10, 40.00),

(15, 3, 1, 700.00),
(15, 4, 2, 40.00),

(16, 1, 1, 1000.00),
(16, 3, 1, 700.00),

(17, 6, 2, 130.00),
(17, 7, 5, 80.00),

(18, 9, 3, 90.00),
(18, 11, 2, 220.00),

(19, 1, 1, 1000.00),
(19, 12, 2, 70.00),

(20, 4, 8, 40.00),
(20, 5, 3, 120.00),

(21, 6, 4, 130.00),
(21, 8, 6, 30.00);
