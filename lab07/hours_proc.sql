SET SERVEROUTPUT ON;

CREATE OR REPLACE
PROCEDURE hours(pnum IN NUMBER)
AS
  CURSOR workers IS
    SELECT *
    FROM works_on
    WHERE works_on.pno = pnum;

employee workers%ROWTYPE;

lowHours EXCEPTION;

BEGIN
  FOR employee IN workers
  LOOP
    DBMS_OUTPUT.PUT_LINE(employee.essn || ' worked ' || employee.hours || ' hours.');
      IF employee.hours < 8.0 THEN
        RAISE lowHours;
      END IF;
  END LOOP;

  EXCEPTION
    WHEN lowHours THEN
      DBMS_OUTPUT.PUT_LINE('Exception: employee hours are less than 8');
END;
/

DBMS_OUTPUT.PUT_LINE()
