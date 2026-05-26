/*Find users whose basket size has consistently grown — 
meaning every order has more items than the previous one.*/


WITH basket_sizes AS(
SELECT
    MAX(op.add_to_cart_order) AS basket_size,
    o.user_id,
    o.order_id,
    o.order_number

FROM orders_prior op 
JOIN orders o ON o.order_id=op.order_id
GROUP BY o.order_id, o.user_id,o.order_number
ORDER BY o.user_id ),

basket_size_compare AS (
    SELECT *,
    LAG (basket_size) OVER (PARTITION BY user_id ORDER BY order_number) AS prev_basket_size
    FROM basket_sizes
),
growth_check AS (
    SELECT
        user_id,
        COUNT(*)                                                                AS total_orders,
        SUM(CASE WHEN basket_size > prev_basket_size THEN 1 ELSE 0 END)        AS growing_orders
    FROM basket_size_compare
    WHERE prev_basket_size IS NOT NULL
    GROUP BY user_id
)
SELECT
    user_id,
    total_orders
FROM growth_check
WHERE growing_orders = total_orders
ORDER BY user_id DESC;

/*
OUTPUT (showing 10 of 3,756 ROWS):
user_id | total_orders
--------|-------------
206184  | 3
206001  | 3
205963  | 2
205896  | 2
205894  | 2
205841  | 2
205696  | 2
205678  | 3
205618  | 2
205554  | 3

(showing 10 of 3,756 users with consistent basket growth)
*/



