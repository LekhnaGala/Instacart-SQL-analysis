DROP TABLE IF EXISTS orders_prior CASCADE;
DROP TABLE IF EXISTS orders CASCADE;
DROP TABLE IF EXISTS products CASCADE;
DROP TABLE IF EXISTS aisles CASCADE;
DROP TABLE IF EXISTS departments CASCADE;


CREATE TABLE orders(
    order_id INT PRIMARY KEY ,
    user_id int NOT NULL,
    eval_set varchar(10) NOT NULL,
    order_number int NOT NULL,
    order_dow int NOT NULL,
    order_hour_of_day int NOT NULL,
    days_since_prior_order NUMERIC(5,1)
);
CREATE TABLE departments(
    dept_id int PRIMARY KEY,
    department varchar(100) NOT NULL
);
CREATE TABLE aisles(
    aisle_id int PRIMARY KEY,
    aisle varchar(100) NOT NULL
);
CREATE TABLE products(
    product_id INT PRIMARY KEY,
    product_name varchar(300) NOT NULL,
    aisle_id int REFERENCES aisles(aisle_id),
    dept_id int REFERENCES departments(dept_id)
);
CREATE TABLE orders_prior(
    order_id INT REFERENCES orders(order_id),
    product_id int REFERENCES products(product_id),
    add_to_cart_order int NOT NULL,
    reordered boolean NOT NULL
);
