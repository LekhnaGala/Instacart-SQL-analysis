--Which hour of the day has the largest average basket size?

SELECT
O.ORDER_HOUR_OF_DAY,
ROUND(AVG(sub.basket_size),0) AS average_basket_size
FROM orders o
JOIN(
SELECT  MAX(add_to_cart_order) AS basket_size,
         order_id 
FROM orders_prior 
GROUP BY order_id
)sub ON o.order_id=sub.order_id
GROUP BY o.order_hour_of_day
ORDER BY average_basket_size DESC;


/*
OUTPUT:
order_hour_of_day | average_basket_size
------------------|--------------------
22                | 11
21                | 11
23                | 11
4                 | 10
0                 | 10
14                | 10
3                 | 10
17                | 10
20                | 10
7                 | 10
8                 | 10
9                 | 10
10                | 10
1                 | 10
5                 | 10
18                | 10
2                 | 10
16                | 10
15                | 10
6                 | 10
12                | 10
13                | 10
11                | 10
19                | 10

(24 rows — all hours)
*/
