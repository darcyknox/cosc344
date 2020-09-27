SELECT *
FROM salespeople outer
WHERE 1 < (SELECT COUNT(*)
FROM customers inner
WHERE inner.snum = outer.snum);

SELECT *
FROM orders outer
WHERE outer.amt > (
SELECT AVG(amt)
FROM orders inner
WHERE inner.cnum = outer.cnum);

SELECT fname, lname
FROM employee outer
WHERE NOT EXISTS
(SELECT *
FROM dependent inner
WHERE inner.essn = outer.ssn);

SELECT pno
FROM employee, works_on
WHERE employee.lname = 'Smith' AND works_on.essn = employee.ssn
UNION
SELECT pnumber
FROM project, department, employee
WHERE dnum = dnumber AND employee.lname = 'Smith' AND mgrssn = ssn;

UPDATE employee
SET salary = salary * 1.10
WHERE lname != 'Borg';

SELECT lname, salary
FROM employee;

DROP TABLE hou_emp;
DROP TABLE emp_dep;

CREATE TABLE hou_emp
AS (SELECT * FROM employee WHERE address LIKE '%Houston%');

SELECT * FROM hou_emp;

CREATE TABLE emp_dep
AS (SELECT e.fname, e.lname, d.dependent_name, d.sex, d.bdate
FROM employee e, dependent d
WHERE e.ssn = d.essn);

SELECT * FROM emp_dep;
