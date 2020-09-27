SET SERVEROUTPUT ON;

DROP TABLE e1 cascade constraints;
DROP TABLE d1 cascade constraints;

CREATE TABLE d1
  (dname        VARCHAR2(15)  NOT NULL UNIQUE,
   dnumber	NUMBER(2)     PRIMARY KEY,
   tot_sal	NUMBER(12) DEFAULT 0);

INSERT INTO d1 VALUES
   ('Research', 5, 0);
INSERT INTO d1 VALUES
   ('Administration', 4, 0);
INSERT INTO d1 VALUES
   ('Headquarters', 1, 0);


CREATE TABLE e1
  (fname    VARCHAR2(15) NOT NULL,
   ssn      CHAR(9)	 PRIMARY KEY,
   salary   NUMBER(6),
   dno      INT          NOT NULL
      REFERENCES d1(dnumber));


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
    WHERE dnumber = :OLD.dno;
  ELSE -- update
    UPDATE d1
    SET tot_sal = tot_sal + :NEW.salary - :OLD.salary
    WHERE dnumber = :OLD.dno;
  END IF;
END;
/


CREATE OR REPLACE TRIGGER dno_change
AFTER UPDATE OF dno ON e1
FOR EACH ROW
BEGIN
     	UPDATE d1
        SET tot_sal = tot_sal + :NEW.salary -- add new salary to t$
        WHERE d1.dnumber = :NEW.dno;

        UPDATE d1
        SET tot_sal = tot_sal - :OLD.salary -- subtract salary fro$
        WHERE d1.dnumber = :OLD.dno;
END;
/


INSERT INTO e1 VALUES
  ('Alicia','999887777',25000,4);
INSERT INTO e1 VALUES
  ('Jennifer','987654321',43000,4);
INSERT INTO e1 VALUES
  ('Ramesh','666884444',38000,5);
INSERT INTO e1 VALUES
  ('Joyce','453453453',25000,5);
INSERT INTO e1 VALUES
  ('Ahmad','987987987',25000,4);
INSERT INTO e1 VALUES
  ('James','888665555',55000,1);

BEGIN
     	DBMS_OUTPUT.PUT_LINE('Initial state');
END;
/

SELECT * FROM d1;

INSERT INTO e1 VALUES ('Mitchell','121204898',80000,1);

BEGIN
     	DBMS_OUTPUT.PUT_LINE('Post insertion');
END;
/

SELECT * FROM d1;

DELETE FROM e1 WHERE fname = 'Joyce';

BEGIN
     	DBMS_OUTPUT.PUT_LINE('Post deletion');
END;
/

SELECT * FROM d1;

UPDATE e1
SET salary = 50000
WHERE fname = 'James';

BEGIN
     	DBMS_OUTPUT.PUT_LINE('Updated one employee salary - James'$
END;
/

SELECT * FROM d1;

UPDATE e1
SET dno = 1
WHERE fname = 'Ahmad';

BEGIN
     	DBMS_OUTPUT.PUT_LINE('Updated one employee dno - Ahmad');
END;
/

SELECT * FROM d1;

COMMIT;

