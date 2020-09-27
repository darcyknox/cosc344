SELECT fname, lname
FROM employee outer
WHERE NOT EXISTS
(SELECT *
FROM dependent inner
WHERE inner.essn = outer.ssn);
