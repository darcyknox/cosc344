<<<<<<< HEAD
DESCRIBE employee;

=======
/* Lab04 queries */

/* Use the DESCRIBE command to get the attributesand data types of the employee
table */

DESCRIBE employee;


/* List all  the  daughters  and  spouses  inthe dependent table. */

>>>>>>> 7a60a963fe5e90aa3736a06b3ce9f9d1a095f120
SELECT *
FROM dependent
WHERE RELATIONSHIP = 'Daughter' OR RELATIONSHIP = 'Spouse';

<<<<<<< HEAD
SELECT PNAME
FROM project
WHERE PLOCATION IS NULL;

=======

/* List the projects that do not have a project location */

SELECT *
FROM project
WHERE PLOCATION IS NULL;


/* List the name of the manager for each department and the name of the
department they manage */

>>>>>>> 7a60a963fe5e90aa3736a06b3ce9f9d1a095f120
SELECT FNAME, LNAME, DNAME
FROM employee, department
WHERE SSN = MGRSSN;

<<<<<<< HEAD
=======

/* List the names of employees who worked on a project less than 18 hours */

>>>>>>> 7a60a963fe5e90aa3736a06b3ce9f9d1a095f120
SELECT DISTINCT FNAME, LNAME
FROM employee, works_on
WHERE HOURS < 18 AND ESSN = SSN
ORDER BY FNAME;

<<<<<<< HEAD
=======

/* List the names of employees whose last name begins with 'W'. */

>>>>>>> 7a60a963fe5e90aa3736a06b3ce9f9d1a095f120
SELECT DISTINCT FNAME, LNAME
FROM employee
WHERE LNAME LIKE 'W%';

<<<<<<< HEAD
=======

/* Use 'IN' to list the names of salespeople located in San Jose or Barcelona. */

>>>>>>> 7a60a963fe5e90aa3736a06b3ce9f9d1a095f120
SELECT sname
FROM salespeople
WHERE city IN ('San Jose', 'Barcelona');

<<<<<<< HEAD
=======

/* Use 'BETWEEN' to list the customers who placed orders with amounts between
1500 and 5000. */

>>>>>>> 7a60a963fe5e90aa3736a06b3ce9f9d1a095f120
SELECT cname, amt
FROM orders, customers
WHERE customers.cnum = orders.cnum
AND amt BETWEEN 1500 AND 5000;

<<<<<<< HEAD
SELECT COUNT(*) FROM orders;

SELECT AVG(amt) FROM orders;

=======

/* How many rows does the orders tablehave? */

SELECT COUNT(*) FROM orders;


/* What is the average amount of all the orders? */

SELECT AVG(amt) FROM orders;
>>>>>>> 7a60a963fe5e90aa3736a06b3ce9f9d1a095f120
