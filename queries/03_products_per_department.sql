/* How many products are in each department? 
Sort by product count descending.*/


SELECT d.dept_id,
    d.department,
    sub.product_count
FROM departments d
JOIN(
SELECT COUNT(p.product_id) AS product_count,
p.dept_id
FROM products p
GROUP BY dept_id) sub ON d.dept_id=sub.dept_id
ORDER BY sub.product_count DESC


/*
OUTPUT:
dept_id | department      | product_count
--------|-----------------|---------------
11      | personal care   | 6563
19      | snacks          | 6264
13      | pantry          | 5371
7       | beverages       | 4365
1       | frozen          | 4007
16      | dairy eggs      | 3449
17      | household       | 3085
15      | canned goods    | 2092
9       | dry goods pasta | 1858
4       | produce         | 1684
3       | bakery          | 1516
20      | deli            | 1322
21      | missing         | 1258
6       | international   | 1139
14      | breakfast       | 1115
18      | babies          | 1081
5       | alcohol         | 1054
8       | pets            | 972
12      | meat seafood    | 907
2       | other           | 548
10      | bulk            | 38
(21 rows — all departments)
*/
