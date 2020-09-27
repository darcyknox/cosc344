CREATE OR REPLACE TRIGGER salary_change
AFTER INSERT OR DELETE OR UPDATE OF salary
ON e1
FOR EACH ROW
BEGIN
  IF INSERTING THEN -- insert
    UPDATE d1
    SET tot_sal = tot_sal + :NEW.salary
    WHERE dnumber = :NEW.dno;
  ELSIF DELETING THEN -- delete
    UPDATE d1
    SET tot_sal = tot_sal - :OLD.salary
    WHERE dnumber = :OLD.dno
  ELSE -- update
    UPDATE d1
    SET tot_sal = tot_sal + :NEW.salary - :OLD.salary
    WHERE dnumber = :OLD.dno
  END IF;
END;
/
