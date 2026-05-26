/*What are the top 10 aisles with the most products listed in the product catalog?*/

SELECT 
    a.aisle AS TOP_10_AISLES,
    sub.Number_of_Products
FROM aisles a
JOIN (
    SELECT 
    aisle_id,
    COUNT(product_id) AS Number_of_Products
FROM products
GROUP BY aisle_id
) sub ON a.aisle_id= sub.aisle_id
ORDER BY sub.Number_of_Products DESC
LIMIT 10;

/*
OUTPUT:
top_10_aisles        | number_of_products
---------------------|--------------------
missing              | 1258
candy chocolate      | 1246
ice cream ice        | 1091
vitamins supplements | 1038
yogurt               | 1026
chips pretzels       | 989
tea                  | 894
packaged cheese      | 891
frozen meals         | 880
cookies cakes        | 874
(10 rows)
*/
