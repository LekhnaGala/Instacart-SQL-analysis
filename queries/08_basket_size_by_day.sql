--What is the average basket size per day of the week? (basket size = number of products per order)

SELECT  
    CASE o.order_dow
    WHEN 0 THEN 'SATURDAY'
    When 1 THEN 'SUNDAY'
    WHEN 2 THEN 'MONDAY'
    WHEN 3 THEN 'TUESDAY'
    WHEN 4 THEN 'WEDNESDAY'
    WHEN 5 THEN 'THURSDAY'
    WHEN 6 THEN 'FRIDAY'
    END AS Day_of_Week,
    ROUND(AVG(sub.basket_size),0) AS average_basket_size
FROM orders o
JOIN(
SELECT  MAX(add_to_cart_order) AS basket_size,
         order_id 
FROM orders_prior 
GROUP BY order_id
)sub ON o.order_id=sub.order_id
GROUP BY o.order_dow
ORDER BY average_basket_size DESC;

 
/*
OUTPUT:
day_of_week | average_basket_size
------------|--------------------
FRIDAY      | 11
SATURDAY    | 11
SUNDAY      | 10
MONDAY      | 10
THURSDAY    | 10
WEDNESDAY   | 9
TUESDAY     | 9
(7 rows)
*/
