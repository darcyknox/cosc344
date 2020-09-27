SELECT snum, MAX(amt)
FROM orders
GROUP BY snum
ORDER BY snum;


SELECT snum, MAX(amt)
FROM orders
WHERE amt > 3000
GROUP BY snum
ORDER BY snum;


SELECT fname, lname, salary
FROM employee
ORDER BY salary, lname;


SELECT orders.onum, customers.cname, customers.cnum, orders.snum
FROM orders
INNER JOIN customers on orders.cnum = customers.cnum
INNER JOIN salespeople ON orders.snum = salespeople.snum
WHERE customers.city != salespeople.city
ORDER BY cname;


SELECT customers.cname, orders.amt
FROM orders, customers
WHERE (amt = (SELECT MAX(amt) FROM orders)) AND (customers.cnum = orders.cnum);


SELECT *
FROM orders
WHERE amt > (SELECT AVG(amt) FROM orders WHERE odate = TO_DATE('03-10-1990','DD-MM-YYYY'));


SELECT *
FROM orders
WHERE snum IN (SELECT snum FROM salespeople WHERE city = 'London');
