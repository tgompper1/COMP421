-- Include your create table DDL statements in this file.
-- Make sure to terminate each statement with a semicolon (;)

-- LEAVE this statement on. It is required to connect to your database.
CONNECT TO cs421;

-- Remember to put the create table ddls for the tables with foreign key references
--    ONLY AFTER the parent tables has already been created.

-- This is only an example of how you add create table ddls to this file.
--   You may remove it.

CREATE TABLE STADIUMS
(
    sName VARCHAR(50) NOT NULL,
    location VARCHAR(100),
    capacity INTEGER,
    PRIMARY KEY(sName)
);

CREATE TABLE MATCHES
(
    matchId INTEGER NOT NULL,
    mDate DATE,
    mTime TIME,
    duration INTEGER,
    round INTEGER,
    sName VARCHAR(50),
    FOREIGN KEY (sName)
        REFERENCES STADIUMS,
    PRIMARY KEY(matchId)
);

CREATE TABLE TEAMS
(
    country VARCHAR(50) NOT NULL,
    nationalAssociation VARCHAR(100),
    roundGroup CHAR(1),
    url VARCHAR(100),
    PRIMARY KEY(country)
);

CREATE TABLE PLAYERS
(
    playerId INTEGER NOT NULL,
    dOB DATE,
    name VARCHAR(50),
    number INTEGER,
    position VARCHAR(30),
    country VARCHAR(50) NOT NULL,
    PRIMARY KEY (playerId),
    FOREIGN KEY (country)
        REFERENCES TEAMS
);

CREATE TABLE PLAYS_IN
(
    playerId INTEGER NOT NULL,
    matchId INTEGER NOT NULL,
    inTime TIME,
    outTime TIME,
    yellowCard BOOLEAN,
    redCard BOOLEAN,
    position VARCHAR(30),
    PRIMARY KEY (playerId, matchId),
    FOREIGN KEY (playerId)
        REFERENCES PLAYERS,
    FOREIGN KEY (matchId)
        REFERENCES MATCHES
);

CREATE TABLE COACHES
(
    coachId INTEGER NOT NULL,
    dOB DATE,
    name VARCHAR(30),
    role VARCHAR(30),
    country VARCHAR(50) NOT NULL,
    PRIMARY KEY (coachId),
    FOREIGN KEY (country)
        REFERENCES TEAMS
);

CREATE TABLE REFEREES
(
    refId INTEGER NOT NULL,
    experience INTEGER NOT NULL,
    name VARCHAR(30),
    role VARCHAR(30),
    PRIMARY KEY(refId)
);

CREATE TABLE OVERSEES
(
    refId INTEGER NOT NULL,
    matchId INTEGER NOT NULL,
    PRIMARY KEY(refId, matchId),
    FOREIGN KEY (refId)
        REFERENCES REFEREES,
    FOREIGN KEY (matchId)
        REFERENCES MATCHES
);

CREATE TABLE GOALS
(
    matchId INTEGER NOT NULL,
    occurrence INTEGER NOT NULL,
    minute TIME,
    penalty BOOLEAN,
    playerId INTEGER NOT NULL,
    country VARCHAR(50) NOT NULL,
    PRIMARY KEY(matchId, occurrence),
    FOREIGN KEY (playerId)
        REFERENCES PLAYERS,
    FOREIGN KEY (country)
        REFERENCES TEAMS,
    FOREIGN KEY (matchId)
        REFERENCES MATCHES
);

CREATE TABLE SEATS
(
    seatNumber VARCHAR(20) NOT NULL,
    stadiumName VARCHAR(100) NOT NULL,
    PRIMARY KEY(seatNumber),
    FOREIGN KEY (stadiumName)
        REFERENCES STADIUMS
);

CREATE TABLE TICKETS
(
    ticketId INTEGER NOT NULL,
    seatNumber VARCHAR(20) NOT NULL,
    matchId INTEGER NOT NULL,
    sold BOOLEAN,
    PRIMARY KEY(ticketId),
    FOREIGN KEY (matchId)
        REFERENCES MATCHES,
    FOREIGN KEY (seatNumber)
        REFERENCES SEATS
);

CREATE TABLE CUSTOMERS
(
    emailAddress VARCHAR(100) NOT NULL,
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    address VARCHAR(100),
    password VARCHAR(100),
    PRIMARY KEY (emailAddress)
);

CREATE TABLE CREDIT_CARDS
(
    number INTEGER NOT NULL,
    emailAddress VARCHAR(100) NOT NULL,
    billingAddress VARCHAR(100),
    nameOnCard VARCHAR(50),
    cvc INTEGER,
    expiryDate DATE,
    PRIMARY KEY (number),
    FOREIGN KEY (emailAddress)
        REFERENCES CUSTOMERS
);

CREATE TABLE PURCHASED
(
    emailAddress VARCHAR(100) NOT NULL,
    ticketId INTEGER NOT NULL,
    price DECIMAL (10, 2) NOT NULL,
    PRIMARY KEY (emailAddress, ticketId),
    FOREIGN KEY (emailAddress)
        REFERENCES CUSTOMERS,
    FOREIGN KEY (ticketId)
        REFERENCES TICKETS
);

CREATE TABLE TEAM_PLAYS
(
    matchId INTEGER NOT NULL,
    country VARCHAR(50) NOT NULL,
    PRIMARY KEY (matchId, country),
    FOREIGN KEY (matchId) REFERENCES MATCHES,
    FOREIGN KEY (country) REFERENCES TEAMS
);
