DROP TABLE salespeople;
DROP TABLE customers;
DROP TABLE orders;

CREATE TABLE salespeople
  (snum  INT PRIMARY KEY,
   sname VARCHAR2(10),
   city  VARCHAR2(15),
   comm  NUMBER(4,2));

CREATE TABLE customers
  (cnum   INT PRIMARY KEY,
   cname  VARCHAR2(12),
   city   VARCHAR2(15),
   rating INT,
   snum   INT);

CREATE TABLE orders
  (onum  INT PRIMARY KEY,
   amt   NUMBER(8,2),
   odate DATE,
   cnum  INT,
   snum  INT);

INSERT INTO salespeople VALUES (1001,'Peel','London',0.12);
INSERT INTO salespeople VALUES (1002,'Serres','San Jose',0.13);
INSERT INTO salespeople VALUES (1004,'Motika','London',0.11);
INSERT INTO salespeople VALUES (1007,'Rifkin','Barcelona',0.15);
INSERT INTO salespeople VALUES (1003,'Axelrod','New York',0.10);

INSERT INTO customers VALUES (2001,'Hoffman','London',100,1001);
INSERT INTO customers VALUES (2002,'Giovanni','Rome',200,1003);
INSERT INTO customers VALUES (2003,'Liu','San Jose',200,1002);
INSERT INTO customers VALUES (2004,'Grass','Berlin',300,1002);
INSERT INTO customers VALUES (2006,'Clemens','London',100,1001);
INSERT INTO customers VALUES (2008,'Cisneros','San Jose',300,1007);
INSERT INTO customers VALUES (2007,'Pereira','Rome',100,1004);

INSERT INTO orders VALUES
   (3001,18.69,TO_DATE('03-10-1990','DD-MM-YYYY'),2008,1007);
INSERT INTO orders VALUES
   (3003,767.19,TO_DATE('03-10-1990','DD-MM-YYYY'),2001,1001);
INSERT INTO orders VALUES
   (3002,1900.10,TO_DATE('03-10-1990','DD-MM-YYYY'),2007,1004);
INSERT INTO orders VALUES
   (3005,5160.45,TO_DATE('03-10-1990','DD-MM-YYYY'),2003,1002);
INSERT INTO orders VALUES
   (3006,1098.16,TO_DATE('03-10-1990','DD-MM-YYYY'),2008,1007);
INSERT INTO orders VALUES
   (3009,1713.23,TO_DATE('04-10-1990','DD-MM-YYYY'),2002,1003);
INSERT INTO orders VALUES
   (3007,75.75,TO_DATE('04-10-1990','DD-MM-YYYY'),2004,1002);
INSERT INTO orders VALUES
   (3008,4723.00,TO_DATE('05-10-1990','DD-MM-YYYY'),2006,1001);
INSERT INTO orders VALUES
   (3010,1309.95,TO_DATE('06-10-1990','DD-MM-YYYY'),2004,1002);
INSERT INTO orders VALUES
   (3011,9891.88,TO_DATE('06-10-1990','DD-MM-YYYY'),2006,1001);

COMMIT;
