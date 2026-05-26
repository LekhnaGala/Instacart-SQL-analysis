COPY departments (dept_id, department)
FROM 'C:\instacart temp\Instacart\departments.csv'
WITH (FORMAT csv, HEADER true);
 
COPY aisles (aisle_id, aisle)
FROM 'C:\instacart temp\Instacart\aisles.csv'
WITH (FORMAT csv, HEADER true);
 
-- Load products (depends on aisles + departments)
COPY products (product_id, product_name, aisle_id, dept_id)
FROM 'C:\instacart temp\Instacart\products.csv\products.csv'
WITH (FORMAT csv, HEADER true);
 

COPY orders (order_id, user_id, eval_set, order_number, order_dow,
             order_hour_of_day, days_since_prior_order)
FROM 'C:\instacart temp\Instacart\orders.csv\orders.csv'
WITH (FORMAT csv, HEADER true, NULL '');
-- NULL '' handles the blank days_since_prior_order on first orders
 
-- Load order line items (~32M rows — expect 2-5 mins)
COPY orders_prior (order_id, product_id, add_to_cart_order, reordered)
FROM 'C:\instacart temp\Instacart\order_products__prior.csv\order_products__prior.csv'
WITH (FORMAT csv, HEADER true);


SELECT 'departments'          AS table_name, COUNT(*) AS row_count FROM departments
UNION ALL
SELECT 'aisles',                             COUNT(*)              FROM aisles
UNION ALL
SELECT 'products',                           COUNT(*)              FROM products
UNION ALL
SELECT 'orders (all eval_sets)',             COUNT(*)              FROM orders
UNION ALL
SELECT 'orders (prior only)',                COUNT(*)              FROM orders WHERE eval_set = 'prior'
UNION ALL
SELECT 'orders_prior',               COUNT(*)              FROM orders_prior
ORDER BY table_name;