/*For each user, find their most frequently ordered product. 
Return `user_id`, `product_name`, and the number of times they ordered it.*/

WITH user_product_counts AS
(SELECT o.user_id,
        op.product_id,
       COUNT(*) AS times_ordered
FROM orders_prior op 
JOIN orders o ON o.order_id=op.order_id
GROUP BY o.user_id, op.product_id),

ranked as (
    SELECT *,
    RANK() OVER (PARTITION BY user_id ORDER BY times_ordered DESC) AS rnk
    FROM user_product_counts
)

SELECT 
   r.user_id,
   p.product_name,
   r.times_ordered
FROM ranked r
JOIN products p ON p.product_id = r.product_id
WHERE rnk=1
ORDER BY user_id ASC;

/*
OUTPUT (showing 10 of 206,209 ROWS):
user_id | product_name                    | times_ordered
--------|---------------------------------|--------------
1       | Original Beef Jerky             | 10
1       | Soda                            | 10
2       | Chipotle Beef & Pork Realstick  | 9
3       | Vanilla Unsweetened Almond Milk | 10
4       | Enchilada Black Bean Vegetable  | 2
5       | Organic Blackberries            | 4
5       | Red Raspberries                 | 4
6       | Organic Baby Spinach            | 2
6       | Ground Turkey Breast            | 2
7       | Lactose Free Fat Free Milk      | 13

NOTE — MULTIPLE PRODUCTS FOR SOME USERS
*/

