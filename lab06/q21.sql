SELECT pnumber
FROM project
WHERE dnum = (
SELECT dno FROM employee WHERE lname = 'Smith')
UNION
SELECT pnumber
FROM project
WHERE dnum = (
SELECT dnumber FROM department dept WHERE mgrssn = (
SELECT ssn FROM employee WHERE lname = 'Smith'));
