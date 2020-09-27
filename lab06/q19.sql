SELECT *
FROM orders outer
WHERE outer.amt > (
SELECT AVG(amt)
FROM orders inner
WHERE inner.cnum = outer.cnum);
