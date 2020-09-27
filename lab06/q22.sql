UPDATE employee
SET salary = salary * 1.10
WHERE lname != 'Borg';

SELECT lname, salary
FROM employee;
