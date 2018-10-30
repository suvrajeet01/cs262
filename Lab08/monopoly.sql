--
-- This SQL script builds a monopoly database, deleting any pre-existing version.
--
-- @author kvlinden
-- @version Summer, 2015
--

-- Drop previous versions of the tables if they they exist, in reverse order of foreign keys.
DROP TABLE IF EXISTS PlayerGame;
DROP TABLE IF EXISTS Game;
DROP TABLE IF EXISTS Player;
DROP TABLE IF EXISTS Hotel;
DROP TABLE IF EXISTS House;

-- Create the schema.
CREATE TABLE Game (
	ID integer PRIMARY KEY, 
	time timestamp
	);

CREATE TABLE Player (
	ID integer PRIMARY KEY, 
	emailAddress varchar(50) NOT NULL,
	name varchar(50)
	);

CREATE TABLE PlayerGame (
	gameID integer REFERENCES Game(ID), 
	playerID integer REFERENCES Player(ID),
	position integer,
	score integer,
	cash integer
	);

CREATE TABLE Hotel (
	gameID integer REFERENCES Game(ID), 
	playerID integer REFERENCES Player(ID),
	position integer
);

CREATE TABLE House (
	gameID integer REFERENCES Game(ID), 
	playerID integer REFERENCES Player(ID),
	position integer
);

-- Allow users to select data from the tables.
GRANT SELECT ON Game TO PUBLIC;
GRANT SELECT ON Player TO PUBLIC;
GRANT SELECT ON PlayerGame TO PUBLIC;
GRANT SELECT ON Hotel TO PUBLIC;
GRANT SELECT ON House TO PUBLIC;

-- Add sample records.
INSERT INTO Game VALUES (1, '2006-06-27 08:00:00');
INSERT INTO Game VALUES (2, '2006-06-28 13:20:00');
INSERT INTO Game VALUES (3, '2006-06-29 18:41:00');

INSERT INTO Player(ID, emailAddress) VALUES (1, 'me@calvin.edu');
INSERT INTO Player VALUES (2, 'king@gmail.edu', 'The King');
INSERT INTO Player VALUES (3, 'dog@gmail.edu', 'Dogbreath');

INSERT INTO PlayerGame VALUES (1, 1, 1, 0.00, 0);
INSERT INTO PlayerGame VALUES (1, 2, 2, 0.00, 0);
INSERT INTO PlayerGame VALUES (1, 3, 3, 2350.00, 2000);
INSERT INTO PlayerGame VALUES (2, 1, 4, 1000.00, 1000);
INSERT INTO PlayerGame VALUES (2, 2, 5, 0.00, 0);
INSERT INTO PlayerGame VALUES (2, 3, 6, 500.00, 500);
INSERT INTO PlayerGame VALUES (3, 2, 10, 0.00, 0);
INSERT INTO PlayerGame VALUES (3, 3, 12, 5500.00, 5000);

INSERT INTO Hotel VALUES (3,2,16);

INSERT INTO House VALUES (2, 2, 12);
