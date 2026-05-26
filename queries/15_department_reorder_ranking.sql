/*For each department, show what percentage of its total orders came from reorders vs first-time 
purchases, and rank departments by reorder rate using `DENSE_RANK()`.*/
 
WITH dept_stats AS (
    SELECT
        d.department,
        COUNT(*) AS total_orders,
        SUM(CASE WHEN op.reordered = true THEN 1 ELSE 0 END) AS reorders,
        SUM(CASE WHEN op.reordered = false THEN 1 ELSE 0 END) AS first_time_orders,
        ROUND(SUM(CASE WHEN op.reordered = true  THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS reorder_pct,
        ROUND(SUM(CASE WHEN op.reordered = false THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS first_time_pct
    FROM orders_prior op
    JOIN products p ON p.product_id=op.product_id
    JOIN departments d ON d.dept_id=p.dept_id
    GROUP BY d.department
)
SELECT * ,
DENSE_RANK() OVER (ORDER BY reorder_pct DESC) AS rnk
FROM dept_stats;

/*
OUTPUT:
department      | total_orders | reorders | first_time_orders | reorder_pct | first_time_pct | rnk
----------------|--------------|----------|-------------------|-------------|----------------|-----
dairy eggs      | 5414016      | 3627221  | 1786795           | 67.00       | 33.00          | 1
beverages       | 2690129      | 1757892  | 932237            | 65.35       | 34.65          | 2
produce         | 9479291      | 6160710  | 3318581           | 64.99       | 35.01          | 3
bakery          | 1176787      | 739188   | 437599            | 62.81       | 37.19          | 4
deli            | 1051249      | 638864   | 412385            | 60.77       | 39.23          | 5
pets            | 97724        | 58760    | 38964             | 60.13       | 39.87          | 6
babies          | 423802       | 245369   | 178433            | 57.90       | 42.10          | 7
bulk            | 34573        | 19950    | 14623             | 57.70       | 42.30          | 8
snacks          | 2887550      | 1657973  | 1229577           | 57.42       | 42.58          | 9
alcohol         | 153696       | 87595    | 66101             | 56.99       | 43.01          | 10
meat seafood    | 708931       | 402442   | 306489            | 56.77       | 43.23          | 11
breakfast       | 709569       | 398013   | 311556            | 56.09       | 43.91          | 12
frozen          | 2236432      | 1211890  | 1024542           | 54.19       | 45.81          | 13
dry goods pasta | 866627       | 399581   | 467046            | 46.11       | 53.89          | 14
canned goods    | 1068058      | 488535   | 579523            | 45.74       | 54.26          | 15
other           | 36291        | 14806    | 21485             | 40.80       | 59.20          | 16
household       | 738666       | 297075   | 441591            | 40.22       | 59.78          | 17
missing         | 69145        | 27371    | 41774             | 39.58       | 60.42          | 18
international   | 269253       | 99416    | 169837            | 36.92       | 63.08          | 19
pantry          | 1875577      | 650301   | 1225276           | 34.67       | 65.33          | 20
personal care   | 447123       | 143584   | 303539            | 32.11       | 67.89          | 21
(21 rows — all departments)
*/
