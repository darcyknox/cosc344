DESCRIBE employee;

SELECT *
FROM dependent
WHERE RELATIONSHIP = 'Daughter' OR RELATIONSHIP = 'Spouse';

SELECT PNAME
FROM project
WHERE PLOCATION IS NULL;

SELECT FNAME, LNAME, DNAME
FROM employee, department
WHERE SSN = MGRSSN;

SELECT DISTINCT FNAME, LNAME
FROM employee, works_on
WHERE HOURS < 18 AND ESSN = SSN
ORDER BY FNAME;

SELECT DISTINCT FNAME, LNAME
FROM employee
WHERE LNAME LIKE 'W%';

SELECT sname
FROM salespeople
WHERE city IN ('San Jose', 'Barcelona');

SELECT cname, amt
FROM orders, customers
WHERE customers.cnum = orders.cnum
AND amt BETWEEEN 1500 AND 5000;

SELECT COUNT(*) FROM orders;

SELECT AVG(amt) FROM orders;

