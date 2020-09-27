SET SERVEROUTPUT ON;

DECLARE
CURSOR ec IS
SELECT * FROM dependent;
emp ec%ROWTYPE;
BEGIN
FOR emp IN ec
LOOP
DBMS_OUTPUT.PUT_LINE(emp.dependent_name || ' ' || emp.relationship);
END LOOP;
END;
/
<<<<<<< HEAD

SELECT * FROM dependent;
=======
>>>>>>> 7a60a963fe5e90aa3736a06b3ce9f9d1a095f120
