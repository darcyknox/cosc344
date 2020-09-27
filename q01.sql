DROP TABLE q01;

CREATE TABLE q01
    (d date,
    dtime timestamp);

INSERT INTO q01 VALUES (TO_DATE('20-01-2000', 'dd-mm-yyyy'), TIMESTAMP'2000-01-20 10:30:11');
INSERT INTO q01 VALUES ('10-may-10', TIMESTAMP'2000-01-05 11:30:11');
INSERT INTO q01 VALUES ('31-jan-00', TIMESTAMP'2000-01-05 15:55:55');
INSERT INTO q01 VALUES (TO_DATE('31-01-2000', 'dd-mm-yyyy'), TIMESTAMP'2000-01-31 15:10:20');

SELECT TO_CHAR(d, 'dd-mm-yyyy'),
    TO_CHAR(dtime, 'dd-mm-yyyy hh24:mi:ss')
    FROM q01;

COMMIT;
