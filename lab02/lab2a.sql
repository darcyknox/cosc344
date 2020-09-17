DROP TABLE lab2a;

CREATE TABLE lab2a
       (i int,
       r number(6,2),
       txt varchar2(20),
       when date);

INSERT INTO lab2a VALUES (1, 1.5, 'First', TO_DATE('10-11-1998', 'dd-mm-yyyy'));
INSERT INTO lab2a VALUES (2, 1.4, 'Second', TO_DATE('11-11-1998', 'dd-mm-yyyy'));
INSERT INTO lab2a VALUES (3, 1.1, 'Third', TO_DATE('1-11-1998', 'dd-mm-yyyy'));
INSERT INTO lab2a VALUES (4, 1.3, 'Fourth', TO_DATE('8-11-1998', 'dd-mm-yyyy'));
INSERT INTO lab2a VALUES (5, 1.45, 'Fifth', TO_DATE('19-11-1998', 'dd-mm-yyyy'));
INSERT INTO lab2a VALUES (6, 1.5, 'Sixth', TO_DATE('21-11-1998', 'dd-mm-yyyy'));
INSERT INTO lab2a VALUES (7, 1.1, 'Seventh', TO_DATE('30-11-1998', 'dd-mm-yyyy'));
INSERT INTO lab2a VALUES (8, 1.1, 'Eighth', TO_DATE('25-11-1998', 'dd-mm-yyyy'));
INSERT INTO lab2a VALUES (9, 1.15, 'Ninth', TO_DATE('15-11-1998', 'dd-mm-yyyy'));
INSERT INTO lab2a VALUES (10, 1.0, 'Tenth', TO_DATE('12-11-1998', 'dd-mm-yyyy'));

COMMIT;

