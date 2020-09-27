/* List the names of employees whose last name begins with 'W'. */

SELECT DISTINCT FNAME, LNAME
FROM employee
WHERE LNAME LIKE 'W%';
