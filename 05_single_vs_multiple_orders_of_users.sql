 --How many users placed only a single order vs multiple orders?

WITH user_order_counts AS (
    SELECT 
        user_id,
        COUNT(order_id) AS order_count
    FROM orders
    GROUP BY user_id
)
SELECT
    CASE WHEN order_count = 1 THEN 'SINGLE ORDER'
                              ELSE 'MULTIPLE ORDERS'
    END          AS order_type,
    COUNT(*)     AS user_numbers
FROM user_order_counts
GROUP BY order_type;

/*
OUTPUT:
order_type      | user_numbers
----------------|-------------
MULTIPLE ORDERS | 206209
(1 row)
 
NOTE: The Instacart dataset was intentionally filtered to only include
users with multiple orders, so no single-order users exist in this dataset.
*/