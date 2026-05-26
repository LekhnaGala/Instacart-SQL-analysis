--What are the top 10 product pairs most commonly bought together in the same order?

SELECT
    p1.product_name AS product_a,
    p2.product_name AS product_b,
    COUNT(*)        AS times_bought_together
FROM orders_prior a
JOIN orders_prior b ON b.order_id   = a.order_id
                   AND a.product_id < b.product_id
JOIN products p1   ON p1.product_id = a.product_id
JOIN products p2   ON p2.product_id = b.product_id
GROUP BY p1.product_name, p2.product_name
ORDER BY times_bought_together DESC
LIMIT 10;

/*
OUTPUT:
product_a              | product_b            | times_bought_together
-----------------------|----------------------|-----------------------
Bag of Organic Bananas | Organic Hass Avocado | 62341
Bag of Organic Bananas | Organic Strawberries | 61628
Organic Strawberries   | Banana               | 56156
Banana                 | Organic Avocado      | 53395
Organic Baby Spinach   | Banana               | 51395
Bag of Organic Bananas | Organic Baby Spinach | 50372
Strawberries           | Banana               | 41232
Banana                 | Large Lemon          | 40880
Organic Strawberries   | Organic Hass Avocado | 40794
Bag of Organic Bananas | Organic Raspberries  | 40503
(10 rows)
*/