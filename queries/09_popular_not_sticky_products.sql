/*Find all products that have been ordered more than 10,000 times but have a reorder rate below 50%. 
These are popular but not sticky products.*/

SELECT 
       op.product_id,
       p.product_name,
       COUNT(op.product_id) as total_product_orders,
       ROUND(AVG(op.reordered::int) * 100, 1) AS reorder_rate
FROM orders_prior op
JOIN products p ON p.product_id=op.product_id
GROUP BY op.product_id, p.product_name
HAVING COUNT(op.product_id)>10000 AND AVG(op.reordered::int) * 100 <50
ORDER BY total_product_orders DESC;


/*
OUTPUT (showing 10 of 54 ROWS):
product_id | product_name                     | total_product_orders | reorder_rate
-----------|----------------------------------|----------------------|-------------
31506      | Extra Virgin Olive Oil           | 50255                | 47.7
31553      | Fresh Ginger Root                | 24130                | 48.4
890        | Organic Diced Tomatoes           | 21997                | 47.6
19048      | Organic Butternut Squash         | 19847                | 46.7
39812      | Organic Thyme                    | 19544                | 41.5
45535      | Organic Low Sodium Chicken Broth | 17716                | 47.8
7021       | Organic Tomato Paste             | 17629                | 41.8
15937      | Shallot                          | 17401                | 49.8
39984      | Organic Dill                     | 15954                | 49.7
12206      | Basil Pesto                      | 15638                | 44.0

*/



