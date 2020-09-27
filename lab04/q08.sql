/* Use 'BETWEEN' to list the customers who placed orders with amounts between
1500 and 5000. */

SELECT cname, amt
FROM orders, customers
WHERE customers.cnum = orders.cnum
AND amt BETWEEN 1500 AND 5000
