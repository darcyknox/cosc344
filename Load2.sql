DROP TABLE coach;
DROP TABLE team;
DROP TABLE player;
DROP TABLE fo_staff;
DROP TABLE game;
DROP TABLE plays_in;

CREATE TABLE coach
  (name VARCHAR(20) PRIMARY KEY,
  salary NUMBER(8,2) UNIQUE
);

CREATE TABLE team
  (name VARCHAR(20) PRIMARY KEY,
  location VARCHAR2(20) NOT NULL UNIQUE,
  coach_name VARCHAR2(20) CONSTRAINT cchname_fk REFERENCES coach(name) DISABLE,
  coach_salary NUMBER(6,2) CONSTRAINT cchsal_fk REFERENCES coach(salary) DISABLE
);

CREATE TABLE player
  (name VARCHAR2(20) PRIMARY KEY,
  dob DATE NOT NULL,
  salary NUMBER(8,2),
  position VARCHAR2(10) CONSTRAINT check_pos CHECK (position IN('guard', 'forward', 'center')),
  jersey_num INT CONSTRAINT check_jersey CHECK (jersey_num BETWEEN 0 AND 99),
  points NUMBER(3,1),
  rebs NUMBER(3,1),
  asts NUMBER(3,1),
  team_name VARCHAR2(20) CONSTRAINT player_team_fk REFERENCES team(name) DISABLE
);

CREATE TABLE fo_staff
  (name VARCHAR2(20) PRIMARY KEY,
  salary NUMBER(8,2),
  role VARCHAR2(20),
  team_name VARCHAR2(20) CONSTRAINT fo_team_fk REFERENCES team(name) DISABLE
);

CREATE TABLE game
  (dt TIMESTAMP PRIMARY KEY,
  location VARCHAR2(20),
  home_team VARCHAR2(20),
  away_team VARCHAR2(20),
  home_score INT CONSTRAINT home_score_cnst CHECK (home_score BETWEEN 0 AND 200),
  away_score INT CONSTRAINT away_score_cnst CHECK (away_score BETWEEN 0 AND 200)
);

CREATE TABLE plays_in
  (name VARCHAR2(20) CONSTRAINT playsin_name_fk REFERENCES player(name) DISABLE,
  dt TIMESTAMP CONSTRAINT playsin_dt_fk REFERENCES game(dt) DISABLE
);

COMMIT;

INSERT INTO team VALUES ('Bulls','Franklin','Liam Simmons',1000);
INSERT INTO team VALUES ('Nuggets','Otago','Brent Matehaere',1000);
INSERT INTO team VALUES ('Jets','Manawatu','Tim McTamney',1000);
INSERT INTO team VALUES ('Rams','Canterbury','Mick Downer',1000);
INSERT INTO team VALUES ('Giants','Nelson','Mike Fitchett',1000);
INSERT INTO team VALUES ('Huskies','Auckland','Kevin Braswell',1000);
INSERT INTO team VALUES ('Airs','Taranaki','Doug Courtney',1000);

COMMIT;

INSERT INTO player VALUES ('Jarrod Kenny',TO_DATE('20-08-1985', 'dd-mm-yyyy'), 6000.00, 'guard', 6, NULL, NULL, NULL, 'Nuggets');
INSERT INTO player VALUES ('Jordan Ngatai',TO_DATE('20-08-1993', 'dd-mm-yyyy'), 7000.00, 'forward', 11, NULL, NULL, NULL, 'Nuggets');
INSERT INTO player VALUES ('Matthew Bardsley',TO_DATE('08-08-1995', 'dd-mm-yyyy'), 0.00, 'guard', 7, NULL, NULL, NULL, 'Nuggets');
INSERT INTO player VALUES ('Josh Aitcheson',TO_DATE('25-05-1998', 'dd-mm-yyyy'), 3500.00, 'forward', 13, NULL, NULL, NULL, 'Nuggets');
INSERT INTO player VALUES ('Jordan Hunt',TO_DATE('20-08-1998', 'dd-mm-yyyy'), 6000.00, 'guard', 6, NULL, NULL, NULL, 'Nuggets');

INSERT INTO player VALUES ('Jayden Bezzant',TO_DATE('20-08-1996', 'dd-mm-yyyy'), 6000.00, 'guard', 6, NULL, NULL, NULL, 'Jets');
INSERT INTO player VALUES ('Tom Vodanovich',TO_DATE('20-08-1994', 'dd-mm-yyyy'), 7000.00, 'forward', 32, NULL, NULL, NULL, 'Jets');
INSERT INTO player VALUES ('Ashton McQueen',TO_DATE('20-08-1995', 'dd-mm-yyyy'), 0.00, 'guard', 95, NULL, NULL, NULL, 'Jets');
INSERT INTO player VALUES ('Taane Samuels',TO_DATE('20-08-1998', 'dd-mm-yyyy'), 5000.00, 'forward', 20, NULL, NULL, NULL, 'Jets');

INSERT INTO player VALUES ('Derone Raukawa',TO_DATE('20-08-1994', 'dd-mm-yyyy'), 6000.00, 'guard', 8, NULL, NULL, NULL, 'Airs');
INSERT INTO player VALUES ('Marcel Jones',TO_DATE('20-08-1988', 'dd-mm-yyyy'), 7000.00, 'forward', 76, NULL, NULL, NULL, 'Airs');

INSERT INTO player VALUES ('Taylor Britt',TO_DATE('20-08-1996', 'dd-mm-yyyy'), 6000.00, 'guard', 5, NULL, NULL, NULL, 'Rams');
INSERT INTO player VALUES ('Reuben Te Rangi',TO_DATE('20-08-1994', 'dd-mm-yyyy'), 7000.00, 'forward', 7, NULL, NULL, NULL, 'Rams');

INSERT INTO player VALUES ('Mike Karena',TO_DATE('20-08-1993', 'dd-mm-yyyy'), 6000.00, 'guard', 35, NULL, NULL, NULL, 'Giants');
INSERT INTO player VALUES ('Mika Vukona',TO_DATE('20-08-1982', 'dd-mm-yyyy'), 7000.00, 'forward', 8, NULL, NULL, NULL, 'Giants');

INSERT INTO player VALUES ('Sam Timmins',TO_DATE('20-08-1997', 'dd-mm-yyyy'), 6000.00, 'guard', 4, NULL, NULL, NULL, 'Bulls');
INSERT INTO player VALUES ('Dom Kelman-Poto',TO_DATE('20-08-1994', 'dd-mm-yyyy'), 7000.00, 'forward', 10, NULL, NULL, NULL, 'Bulls');

INSERT INTO player VALUES ('Izayah Mauriohooho-Leafa',TO_DATE('20-08-1996', 'dd-mm-yyyy'), 6000.00, 'guard', 4, NULL, NULL, NULL, 'Huskies');
INSERT INTO player VALUES ('Tohi Smith-Milner',TO_DATE('20-08-1995', 'dd-mm-yyyy'), 7000.00, 'forward', 14, NULL, NULL, NULL, 'Huskies');

COMMIT;

INSERT INTO coach VALUES ('Brent Matehaere', 1000);
INSERT INTO coach VALUES ('Mick Downer', 1000);
INSERT INTO coach VALUES ('Mike Fitchett', 1000);
INSERT INTO coach VALUES ('Kevin Braswell', 1000);
INSERT INTO coach VALUES ('Liam Simmons', 1000);
INSERT INTO coach VALUES ('Doug Courtney', 1000);
INSERT INTO coach VALUES ('Tim McTamney', 1000);

COMMIT;

INSERT INTO fo_staff ('Angela Ruske',1000,'General Manager','Nuggets');
INSERT INTO fo_staff ('Matt Lacey',1000,'General Manager','Huskies');
INSERT INTO fo_staff ('Caleb Harrison',1000,'General Manager','Rams');
INSERT INTO fo_staff ('Jamie Reddish',1000,'General Manager','Bulls');
INSERT INTO fo_staff ('Paul Jones',1000,'General Manager','Giants');
INSERT INTO fo_staff ('Mitchell Langton',1000,'General Manager','Airs');
INSERT INTO fo_staff ('Josiah Clancy',1000,'General Manager','Jets');

COMMIT;

INSERT INTO game VALUES (TIMESTAMP'2020-06-08 17:30:00','Otago','Nuggets','Jets',104,100);
INSERT INTO game VALUES (TIMESTAMP'2020-06-10 19:30:00','Nelson','Giants','Rams',88,90);
INSERT INTO game VALUES (TIMESTAMP'2020-06-12 17:30:00','Taranaki','Airs','Huskies',92,81);
INSERT INTO game VALUES (TIMESTAMP'2020-06-14 19:00:00','Canterbury','Rams','Nuggets',77,76);
INSERT INTO game VALUES (TIMESTAMP'2020-06-15 19:00:00','Manawatu','Jets','Nuggets',102,110);
INSERT INTO game VALUES (TIMESTAMP'2020-06-16 17:00:00','Nelson','Giants','Huskies',80,86);
INSERT INTO game VALUES (TIMESTAMP'2020-06-17 19:00:00','Otago','Nuggets','Airs',80,81);
INSERT INTO game VALUES (TIMESTAMP'2020-06-18 17:00:00','Canterbury','Rams','Nuggets',90,95);

COMMIT;
