--Which 5 departments have the highest reorder rate? (reorder rate = average of the `reordered` column × 100)

SELECT 
      d.department,
      ROUND(AVG(reordered::int) * 100, 1) AS reorder_rate

FROM orders_prior op
JOIN products p ON p.product_id=op.product_id
JOIN departments d ON d.dept_id=p.dept_id
GROUP BY d.department
ORDER BY reorder_rate Desc
LIMIT 5;

/*
OUTPUT:
department | reorder_rate
-----------|-------------
dairy eggs | 67.0
beverages  | 65.3
produce    | 65.0
bakery     | 62.8
deli       | 60.8
(5 rows)
*/
