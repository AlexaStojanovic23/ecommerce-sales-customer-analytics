CREATE TABLE customers (
   customer_id INTEGER PRIMARY KEY,
   customer_name TEXT NOT NULL,
   city TEXT
);

CREATE TABLE orders (
   order_id INTEGER PRIMARY KEY,
   customer_id INTEGER NOT NULL,
   order_date DATE NOT NULL,
   channel TEXT,
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE products (
    product_id INTEGER PRIMARY KEY,
    product_name TEXT NOT NULL,
    category TEXT
);

CREATE TABLE order_items (
   order_id INTEGER NOT NULL,
   product_id INTEGER NOT NULL,
   quantity INTEGER NOT NULL,
   unit_price DECIMAL(10, 2) NOT NULL,
   FOREIGN KEY (order_id) REFERENCES orders(order_id),
   FOREIGN KEY (product_id) REFERENCES products(product_id)
);
