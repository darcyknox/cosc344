SELECT *
FROM salespeople outer
WHERE 1 < (SELECT COUNT(*)
FROM customers inner
WHERE inner.snum = outer.snum);
