CREATE TABLE emp_dep
AS (SELECT e.fname, e.lname, d.dependent_name, d.sex, d.bdate
FROM employee e, dependent d
WHERE e.ssn = d.essn);
