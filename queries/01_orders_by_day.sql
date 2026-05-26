/* How many orders were placed on each day of the week? Return the day name (not the number) 
and order count, sorted by most orders first.*/

SELECT  
    CASE order_dow
    WHEN 0 THEN 'SATURDAY'
    When 1 THEN 'SUNDAY'
    WHEN 2 THEN 'MONDAY'
    WHEN 3 THEN 'TUESDAY'
    WHEN 4 THEN 'WEDNESDAY'
    WHEN 5 THEN 'THURSDAY'
    WHEN 6 THEN 'FRIDAY'
    END AS Day_of_Week,
COUNT (order_id) AS Number_of_Orders 
FROM orders
GROUP BY order_dow
ORDER BY Number_of_Orders DESC;

/*
OUTPUT:
day_of_week | number_of_orders
------------|------------------
SATURDAY    | 600905
SUNDAY      | 587478
MONDAY      | 467260
THURSDAY    | 453368
FRIDAY      | 448761
TUESDAY     | 436972
WEDNESDAY   | 426339
(7 rows)
*/
