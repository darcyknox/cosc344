/* Use 'IN' to list the names of salespeople located in San Jose or Barcelona. */

SELECT sname
FROM salespeople
WHERE city IN ('San Jose', 'Barcelona');
