-- Include your drop table DDL statements in this file.
-- Make sure to terminate each statement with a semicolon (;)

-- LEAVE this statement on. It is required to connect to your database.
CONNECT TO cs421;

-- Remember to put the drop table ddls for the tables with foreign key references
--    ONLY AFTER the parent tables has already been dropped (reverse of the creation order).

-- This is only an example of how you add drop table ddls to this file.
--   You may remove it.

DROP TABLE STADIUMS;

DROP TABLE MATCHES;

DROP TABLE TEAMS;

DROP TABLE PLAYERS;

DROP TABLE PLAYS_IN;

DROP TABLE COACHES;

DROP TABLE REFEREES;

DROP TABLE OVERSEES;

DROP TABLE GOALS;

DROP TABLE SEATS;

DROP TABLE TICKETS;

DROP TABLE CUSTOMERS;

DROP TABLE CREDIT_CARDS;

DROP TABLE PURCHASED;

DROP TABLE TEAM_PLAYS;
