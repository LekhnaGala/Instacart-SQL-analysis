-- What are the top 10 most ordered products? Return the product name, department, and total times ordered.


SELECT COUNT(op.product_id) AS times_ordered,
p.product_name,
d.department 

FROM orders_prior op
JOIN products p ON op.product_id=p.product_id
JOIN departments d ON p.dept_id=d.dept_id
GROUP BY op.product_id, p.product_name, d.department
ORDER BY times_ordered DESC
LIMIT 10;


/*
OUTPUT:
times_ordered | product_name           | department
--------------|------------------------|------------
472565        | Banana                 | produce
379450        | Bag of Organic Bananas | produce
264683        | Organic Strawberries   | produce
241921        | Organic Baby Spinach   | produce
213584        | Organic Hass Avocado   | produce
176815        | Organic Avocado        | produce
152657        | Large Lemon            | produce
142951        | Strawberries           | produce
140627        | Limes                  | produce
137905        | Organic Whole Milk     | dairy eggs
(10 rows)
*/