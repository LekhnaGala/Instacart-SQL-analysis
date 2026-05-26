/*Rank the top 5 products in each department by order volume using a window function. 
Return department, product name, order count, and rank.*/


WITH product_volume As(
    SELECT COUNT(op.product_id) AS order_volume,
           p.product_name,
           d.department
    FROM orders_prior op
    JOIN products p ON p.product_id=op.product_id
    JOIN departments d On d.dept_id=p.dept_id
    GROUP BY d.department, p.product_name
    ),
ranked_volume AS(
    SELECT *,
RANK () OVER (PARTITION BY department ORDER BY order_volume DESC) AS rnk
FROM product_volume
)

SELECT 
  r.department,
  r.product_name,
  r.order_volume,
  r.rnk
FROM ranked_volume r
WHERE rnk BETWEEN 1 AND 5;

/*
OUTPUT (showing 15 of 105 ROWS):
department | product_name                                     | order_volume | rnk
-----------|--------------------------------------------------|--------------|----
alcohol    | Sauvignon Blanc                                  | 8246         | 1
alcohol    | Chardonnay                                       | 6153         | 2
alcohol    | Cabernet Sauvignon                               | 6115         | 3
alcohol    | Beer                                             | 5844         | 4
alcohol    | Vodka                                            | 5475         | 5
babies     | Baby Food Stage 2 Blueberry Pear & Purple Carrot | 8793         | 1
babies     | Spinach Peas & Pear Stage 2 Baby Food            | 8035         | 2
babies     | Gluten Free SpongeBob Spinach Littles            | 7083         | 3
babies     | Broccoli & Apple Stage 2 Baby Food               | 6837         | 4
babies     | Free & Clear Unscented Baby Wipes                | 6315         | 5
bakery     | 100% Whole Wheat Bread                           | 60816        | 1
bakery     | Organic Bread with 21 Whole Grains               | 23006        | 2
bakery     | Ezekiel 4:9 Bread Organic Sprouted Whole Grain   | 17789        | 3
bakery     | Sourdough Bread                                  | 16318        | 4
bakery     | Original Nooks & Crannies English Muffins        | 14973        | 5

top 5 per department
*/



