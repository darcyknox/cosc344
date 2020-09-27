SELECT customers.cname, orders.amt
FROM orders, customers
WHERE (amt = (SELECT MAX(amt) FROM orders)) AND (customers.cnum = orders.cnum);
