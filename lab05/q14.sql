SELECT orders.onum, customers.cname, customers.cnum, orders.snum
FROM orders
INNER JOIN customers on orders.cnum = customers.cnum
INNER JOIN salespeople ON orders.snum = salespeople.snum
WHERE customers.city != salespeople.city
ORDER BY cname;
