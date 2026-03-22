CREATE DATABASE datawarehouse;
USE datawarehouse;

-- Dimension Table 1: dim_date

CREATE TABLE dim_date (
    date_id     INT         PRIMARY KEY,
    full_date   DATE        NOT NULL,
    day         INT         NOT NULL,
    month       INT         NOT NULL,
    month_name  VARCHAR(20) NOT NULL,
    quarter     INT         NOT NULL,
    year        INT         NOT NULL
) ENGINE=InnoDB;
 
INSERT INTO dim_date (date_id, full_date, day, month, month_name, quarter, year) VALUES
(20230105, '2023-01-05', 5,  1,  'January',   1, 2023),
(20230115, '2023-01-15', 15, 1,  'January',   1, 2023),
(20230205, '2023-02-05', 5,  2,  'February',  1, 2023),
(20230331, '2023-03-31', 31, 3,  'March',     1, 2023),
(20230418, '2023-04-18', 18, 4,  'April',     2, 2023),
(20230521, '2023-05-21', 21, 5,  'May',       2, 2023),
(20230604, '2023-06-04', 4,  6,  'June',      2, 2023),
(20230722, '2023-07-22', 22, 7,  'July',      3, 2023),
(20230809, '2023-08-09', 9,  8,  'August',    3, 2023),
(20231026, '2023-10-26', 26, 10, 'October',   4, 2023),
(20231118, '2023-11-18', 18, 11, 'November',  4, 2023),
(20231208, '2023-12-08', 8,  12, 'December',  4, 2023);
 
 -- Dimension Table 2: dim_store

 CREATE TABLE dim_store (
    store_id    INT         AUTO_INCREMENT PRIMARY KEY,
    store_name  VARCHAR(100) NOT NULL,
    store_city  VARCHAR(100) NOT NULL
) ENGINE=InnoDB;
 
INSERT INTO dim_store (store_id, store_name, store_city) VALUES
(1, 'Chennai Anna',    'Chennai'),
(2, 'Delhi South',     'Delhi'),
(3, 'Bangalore MG',    'Bangalore'),
(4, 'Pune FC Road',    'Pune'),
(5, 'Mumbai Central',  'Mumbai');

-- Dimension Table 3: dim_product

CREATE TABLE dim_product (
    product_id      INT         AUTO_INCREMENT PRIMARY KEY,
    product_name    VARCHAR(100) NOT NULL,
    category        VARCHAR(100) NOT NULL,
    unit_price      DECIMAL(10,2) NOT NULL
) ENGINE=InnoDB;
 
INSERT INTO dim_product (product_id, product_name, category, unit_price) VALUES
(1,  'Speaker',     'Electronics', 49262.78),
(2,  'Tablet',      'Electronics', 23226.12),
(3,  'Phone',       'Electronics', 48703.39),
(4,  'Smartwatch',  'Electronics', 58851.01),
(5,  'Laptop',      'Electronics', 42343.15),
(6,  'Headphones',  'Electronics', 15000.00),
(7,  'Jeans',       'Clothing',     2317.47),
(8,  'Jacket',      'Clothing',    30187.24),
(9,  'Saree',       'Clothing',     5000.00),
(10, 'T-Shirt',     'Clothing',     1500.00),
(11, 'Atta 10kg',   'Groceries',   52464.00),

--Fact Table: fact_sales

CREATE TABLE fact_sales (
    sale_id         INT         AUTO_INCREMENT PRIMARY KEY,
    transaction_id  VARCHAR(20) NOT NULL,
    date_id         INT         NOT NULL,
    store_id        INT         NOT NULL,
    product_id      INT         NOT NULL,
    units_sold      INT         NOT NULL,
    unit_price      DECIMAL(10,2) NOT NULL,
    total_amount    DECIMAL(12,2) NOT NULL,
    FOREIGN KEY (date_id)    REFERENCES dim_date(date_id),
    FOREIGN KEY (store_id)   REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
) ENGINE=InnoDB;

INSERT INTO fact_sales (transaction_id, date_id, store_id, product_id, units_sold, unit_price, total_amount) VALUES
('TXN5000', 20230809, 1, 1,  3,  49262.78, 147788.34),
('TXN5001', 20231208, 1, 2,  11, 23226.12, 255487.32),
('TXN5002', 20230205, 1, 3,  20, 48703.39, 974067.80),
('TXN5003', 20230205, 2, 2,  14, 23226.12, 325165.68),
('TXN5004', 20230115, 1, 4,  10, 58851.01, 588510.10),
('TXN5005', 20230809, 3, 11, 12, 52464.00, 629568.00),
('TXN5006', 20230331, 4, 4,  6,  58851.01, 353106.06),
('TXN5007', 20231026, 4, 7,  16, 2317.47,  37079.52),
('TXN5008', 20231208, 3, 12, 9,  27469.99, 247229.91),
('TXN5009', 20230809, 3, 4,  3,  58851.01, 176553.03),
('TXN5010', 20230604, 1, 8,  15, 30187.24, 452808.60),
('TXN5011', 20231026, 5, 7,  13, 2317.47,  30127.11);
