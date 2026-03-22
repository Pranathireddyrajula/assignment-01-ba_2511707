CREATE TABLE customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100) NOT NULL,
    customer_city VARCHAR(50) NOT NULL
);

CREATE TABLE products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL
);

CREATE TABLE sales_reps (
    sales_rep_id VARCHAR(10) PRIMARY KEY,
    sales_rep_name VARCHAR(100) NOT NULL,
    sales_rep_email VARCHAR(100) NOT NULL,
    office_address VARCHAR(100) NOT NULL
);

CREATE TABLE orders (
    order_id VARCHAR(10) PRIMARY KEY,
    customer_id VARCHAR(10), NOT NULL,
    sales_rep_id VARCHAR(10), NOT NULL,
    order_date DATE, NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (sales_rep_id) REFERENCES sales_reps(sales_rep_id)
);

CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id VARCHAR(10),NOT NULL,
    product_id VARCHAR(10), NOT NULL,
    quantity INT, NOT NULL
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customers VALUES 
('C1','Rahul','rahul@mail.com','Mumbai'),
('C2','Anita','anita@mail.com','Delhi'),
('C3','Kiran','kiran@mail.com','Mumbai'),
('C4','Sneha','sneha@mail.com','Chennai'),
('C5','Arjun','arjun@mail.com','Bangalore');

INSERT INTO products VALUES 
('P1','Laptop','Electronics',50000),
('P2','Phone','Electronics',20000),
('P3','Headphones','Accessories',2000),
('P4','Keyboard','Accessories',1500),
('P5','Mouse','Accessories',800);

INSERT INTO sales_reps VALUES 
('S1','Ramesh','r@mail.com','Mumbai'),
('S2','Sita','s@mail.com','Delhi'),
('S3','Arun','a@mail.com','Chennai'),
('S4','Priya','p@mail.com','Bangalore'),
('S5','Vikram','v@mail.com','Hyderabad');

INSERT INTO orders VALUES 
('O1','C1','S1','2024-01-10'),
('O2','C2','S2','2024-01-11'),
('O3','C3','S1','2024-01-12'),
('O4','C4','S3','2024-01-13'),
('O5','C5','S4','2024-01-14');

INSERT INTO order_items (order_id, product_id, quantity) VALUES 
('O1','P1',1),
('O1','P3',2),
('O2','P2',1),
('O3','P4',3),
('O4','P5',5);