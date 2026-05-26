--What percentage of orders were placed between 9am and 5pm (working hours)?


SELECT 
    (SELECT COUNT(*) AS total_orders FROM orders),
    COUNT(o.order_id) AS working_hours_orders,
    ROUND((COUNT(o.order_id)*100)/ (SELECT COUNT(*) FROM orders),2) AS percentage
FROM orders o
WHERE o.order_hour_of_day between 9 and 17

/*
OUTPUT:
total_orders | working_hours_orders | percentage
-------------|----------------------|-----------
3421083      | 2449827              | 71.0
(1 row)
*

