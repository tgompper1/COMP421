-- Include your INSERT SQL statements in this file.
-- Make sure to terminate each statement with a semicolon (;)

-- LEAVE this statement on. It is required to connect to your database.
CONNECT TO cs421;

-- Remember to put the INSERT statements for the tables with foreign key references
--    ONLY AFTER the parent tables!

INSERT INTO TEAMS (country, nationalAssociation, roundGroup, url) VALUES
        ('USA', 'USA Soccer Assoc', 1, 'usasoccer.com')
        ,('ARG', 'Argentina Soccer Assoc', 1, 'argsoccer.com')
        ,('CRC', 'Costa Rica Soccer Assoc', 1, 'crcsoccer.com')
        ,('GER', 'Germany Soccer Assoc', 1, 'gersoccer.com')
        ,('MAR', 'Morocco Soccer Assoc', 2, 'marsoccer.com')
        ,('SEN', 'Senegal Soccer Assoc', 2, 'sensoccer.com')
        ,('URU', 'Uruguay Soccer Assoc', 2, 'urusoccer.com')
        ,('AUS', 'Australia Soccer Assoc', 2, 'aussoccer.com')
        ,('CRO', 'Croatia Soccer Assoc', 3, 'crosoccer.com')
        ,('GHA', 'Ghana Soccer Assoc', 3, 'ghasoccer.com')
        ,('NED', 'Netherlands Soccer Assoc', 3, 'NEDsoccer.com')
        ,('SRB', 'Serbia Soccer Assoc', 3, 'srbsoccer.com')
        ,('WAL', 'Wales Soccer Assoc', 4, 'walsoccer.com')
        ,('BEL', 'Belgium Soccer Assoc', 4, 'belsoccer.com')
        ,('DEN', 'Denmark Soccer Assoc', 4, 'densoccer.com')
        ,('IRN', 'Iran Soccer Assoc', 4, 'irnsoccer.com')
        ,('POL', 'Poland Soccer Assoc', 5, 'polsoccer.com')
        ,('ESP', 'Spain Soccer Assoc', 5, 'espsoccer.com')
        ,('BRA', 'Brazil Soccer Assoc', 5, 'brasoccer.com')
        ,('ECU', 'Ecuador Soccer Assoc', 5, 'ecusoccer.com')
        ,('JPN', 'Japan Soccer Assoc', 6, 'jpnsoccer.com')
        ,('POR', 'Portugal Soccer Assoc', 6, 'porsoccer.com')
        ,('SUI', 'Switzerland Soccer Assoc', 6, 'suisoccer.com')
        ,('CMR', 'Cameroon Soccer Assoc', 6, 'cmrsoccer.com')
        ,('ENG', 'England Soccer Assoc', 7, 'engsoccer.com')
        ,('KOR', 'Korea Republic Soccer Assoc', 7, 'korsoccer.com')
        ,('QAT', 'Qatar Soccer Assoc', 7, 'qatsoccer.com')
        ,('TUN', 'Tunisia Soccer Assoc', 7, 'tunsoccer.com')
        ,('CAN', 'Canada Soccer Assoc', 8, 'cansoccer.com')
        ,('FRA', 'France Soccer Assoc', 8, 'frasoccer.com')
        ,('MEX', 'Mexico Soccer Assoc', 8, 'mexsoccer.com')
        ,('KSA', 'Saudi Arabia Soccer Assoc', 8, 'ksasoccer.com')
;

INSERT INTO PLAYERS (playerId, dOB, name, number, position, country) VALUES
        (1, '2002-08-03', 'player 1', 1, 'striker', 'CAN')
        ,(2, '1984-12-06', 'player 2', 2, 'left wing', 'CAN')
        ,(3, '1983-1-06', 'player 3', 3, 'right wing', 'CAN')
        ,(4, '1983-12-07', 'player 4', 4, 'left mid', 'CAN')
        ,(5, '2001-12-06', 'player 5', 5, 'right mid', 'CAN')
        ,(6, '1993-12-06', 'player 6', 6, 'center mid', 'CAN')
        ,(7, '1983-11-06', 'player 7', 7, 'center back', 'CAN')
        ,(8, '1983-12-07', 'player 8', 8, 'right back', 'CAN')
        ,(9, '1983-03-06', 'player 9', 9, 'left back',  'CAN')
        ,(10, '1983-12-06', 'Christine Sinclair', 10, 'center forward', 'CAN')
        ,(11, '1995-12-06', 'player 11', 11, 'goalie', 'CAN')
        ,(12, '1983-12-06', 'player 12', 1, 'goalie', 'USA')
        ,(13, '1983-12-06', 'player 13', 2, 'left wing', 'USA')
        ,(14, '1983-12-06', 'player 14', 3, 'left mid', 'USA')
        ,(15, '1983-12-06', 'player 15', 4, 'striker', 'USA')
        ,(16, '1983-12-06', 'player 16', 5, 'center back', 'USA')
        ,(17, '1983-12-06', 'player 17', 1, 'goalie', 'FRA')
        ,(18, '1983-12-06', 'player 18', 2, 'left wing', 'FRA')
        ,(19, '1983-12-06', 'player 19', 3, 'left mid', 'FRA')
        ,(20, '1983-12-06', 'player 20', 4, 'striker', 'FRA')
        ,(21, '1983-12-06', 'player 21', 5, 'center back', 'FRA')
        ,(22, '1983-12-06', 'player 22', 1, 'goalie', 'GER')
        ,(23, '1983-12-06', 'player 23', 2, 'left wing', 'GER')
        ,(24, '1983-12-06', 'player 24', 3, 'left mid', 'GER')
        ,(25, '1983-12-06', 'player 25', 4, 'striker', 'GER')
        ,(26, '1983-12-06', 'player 26', 5, 'center back', 'GER')
;

INSERT INTO STADIUMS (sName, location, capacity) VALUES
        ('Lusail Stadium', 'Lusail', 80000)
        ,('Al Bayt Stadium', 'Al Khor', 60000)
        ,('Al Janoub Stadium', 'Al Wakrah', 40000)
        ,('Ahmad Bin Ali Stadium', 'Al Rayyan', 40000)
        ,('Khalifa Inernational Stadium', 'Doha', 40000)
;

INSERT INTO COACHES (coachId, dOB, name, role, country) VALUES
        (1, '1980-09-15', 'Coach 1', 'head coach', 'CAN')
        ,(2, '1980-01-15', 'Coach 2', 'assistant coach', 'CAN')
        ,(3, '1980-01-23', 'Coach 3', 'head coach', 'USA')
        ,(4, '1980-01-16', 'Coach 4', 'goalie coach', 'FRA')
        ,(5, '1980-04-15', 'Coach 5', 'head coach', 'GER')
;

INSERT INTO REFEREES (refId, experience, name, role) VALUES
        (1, 20, 'ref 1', 'head referee')
        ,(2, 15, 'ref 2', 'assistant referee')
        ,(3, 30, 'ref 3', 'video referee')
        ,(4, 18, 'ref 4', 'head referee')
        ,(5, 6, 'ref 5', 'assistant referee')
;

INSERT INTO SEATS (seatNumber, stadiumName) VALUES
        ('lusail1', 'Lusail Stadium')
        ,('lusail2', 'Lusail Stadium')
        ,('lusail3', 'Lusail Stadium')
        ,('lusail4', 'Lusail Stadium')
        ,('lusail5', 'Lusail Stadium')
        ,('lusail6', 'Lusail Stadium')
        ,('lusail7', 'Lusail Stadium')
        ,('lusail8', 'Lusail Stadium')
        ,('lusail9', 'Lusail Stadium')
        ,('lusail10', 'Lusail Stadium')
        ,('albayt1', 'Al Bayt Stadium')
        ,('albayt2', 'Al Bayt Stadium')
        ,('albayt3', 'Al Bayt Stadium')
        ,('albayt4', 'Al Bayt Stadium')
        ,('albayt5', 'Al Bayt Stadium')
        ,('albayt6', 'Al Bayt Stadium')
        ,('albayt7', 'Al Bayt Stadium')
        ,('aljanoub1', 'Al Janoub Stadium')
        ,('aljanoub2', 'Al Janoub Stadium')
        ,('aljanoub3', 'Al Janoub Stadium')
        ,('aljanoub4', 'Al Janoub Stadium')
        ,('aljanoub5', 'Al Janoub Stadium')
        ,('aljanoub6', 'Al Janoub Stadium')
        ,('aljanoub7', 'Al Janoub Stadium')
        ,('aljanoub8', 'Al Janoub Stadium')
        ,('aljanoub9', 'Al Janoub Stadium')
;

INSERT INTO CUSTOMERS (emailAddress, firstName, LastName, address, password) VALUES
        ('tgomp9@gmail.com', 'Tess', 'Gompper', 'montreal', 'password123')
        ,('signe.hoel@gmail.com', 'Signe', 'Hoel', 'montreal', 'password1234')
        ,('customer1@gmail.com', 'cust', 'omer', '123 mtl ave', 'password125')
        ,('customer2@gmail.com', 'cust', 'omer', '123 mtl ave', 'password126')
        ,('customer3@gmail.com', 'cust', 'omer', '123 mtl ave', 'password127')
        ,('customer4@gmail.com', 'cust', 'omer', '123 mtl ave', 'password128')
        ,('customer5@gmail.com', 'cust', 'omer', '123 mtl ave', 'password129')
        ,('customer6@gmail.com', 'cust', 'omer', '123 mtl ave', 'password130')
        ,('customer7@gmail.com', 'cust', 'omer', '123 mtl ave', 'password131')
;

INSERT INTO CREDIT_CARDS (number, emailAddress, billingAddress, nameOnCard, cvc, expiryDate) VALUES
        (12743985, 'tgomp9@gmail.com', '123 mtl ave', 'Tess Gompper', 123, '2023-01-12')
        ,(12874960, 'signe.hoel@gmail.com', '123 mtl ave', 'SigneHoel', 134, '2023-01-12')
        ,(51220345, 'customer1@gmail.com', '123 mtl ave', 'Cust Omer', 157, '2023-01-12')
        ,(30942309, 'customer2@gmail.com', '123 mtl ave', 'Cust Omer', 345, '2023-01-12')
        ,(85609238, 'customer3@gmail.com', '123 mtl ave', 'Cust Omer', 789, '2023-01-12')
        ,(23981245, 'customer4@gmail.com', '123 mtl ave', 'Cust Omer', 331, '2023-01-12')
        ,(47125126, 'customer5@gmail.com', '123 mtl ave', 'Cust Omer', 656, '2023-01-12')
        ,(12481505, 'customer6@gmail.com', '123 mtl ave', 'Cust Omer', 909, '2023-01-12')
        ,(24845634, 'customer7@gmail.com', '123 mtl ave', 'Cust Omer', 111, '2023-01-12')
;

INSERT INTO MATCHES (matchId, mDate, mTime, duration, round, sName) VALUES
        (1111, '2023-07-20', '13:00:00', 60, 1, 'Lusail Stadium')
        ,(1112, '2023-08-06', '15:00:00', 60, 2, 'Al Bayt Stadium')
        ,(1113, '2023-08-09', '16:30:00', 60, 3, 'Al Janoub Stadium')
        ,(2222, '2023-08-06', '09:00:00', 60, 2, 'Lusail Stadium')
        ,(2223, '2023-08-13', '15:30:00', 60, 1, 'Al Bayt Stadium')
        ,(2224, '2023-08-17', '14:00:00', 70, 3, 'Al Janoub Stadium')
;

INSERT INTO OVERSEES (refId, matchId) VALUES
        (1, 1111)
        ,(2, 1111)
        ,(3, 1111)
        ,(3, 1112)
        ,(4, 1112)
        ,(5, 1112)
        ,(1, 1113)
        ,(2, 1113)
        ,(3, 1113)
        ,(3, 2222)
        ,(4, 2222)
        ,(5, 2222)
        ,(1, 2224)
        ,(2, 2224)
        ,(3, 2224)
        ,(3, 2223)
        ,(4, 2223)
        ,(5, 2223)
;

INSERT INTO GOALS (matchId, occurrence, minute, penalty, playerId, country) VALUES
(1111, 1, '00:17:00', FALSE, 10, 'CAN')
        ,(1111, 3, '00:32:00', FALSE, 10, 'CAN')
        ,(1111, 4, '00:41:00', FALSE, 1, 'CAN')
        ,(1111, 6, '00:55:00', FALSE, 1, 'CAN')
        ,(1111, 2, '00:34:00', FALSE, 15, 'USA')
        ,(1111, 5, '00:45:00', FALSE, 15, 'USA')
        ,(1111, 7, '00:58:00', FALSE, 14, 'USA')
        ,(1112, 1, '00:03:00', FALSE, 10, 'CAN')
        ,(1112, 3, '00:45:00', FALSE, 2, 'CAN')
        ,(1112, 2, '00:23:00', FALSE, 23, 'GER')
        ,(1113, 1, '00:32:00', FALSE, 1, 'CAN')
        ,(1113, 2, '00:46:00', FALSE, 2, 'CAN')
        ,(2222, 1, '00:11:00', FALSE, 13, 'USA')
        ,(2222, 3, '00:17:00', FALSE, 14, 'USA')
        ,(2222, 4, '00:34:00', FALSE, 13, 'USA')
        ,(2222, 5, '00:38:00', FALSE, 14, 'USA')
        ,(2222, 8, '00:58:00', FALSE, 14, 'USA')
        ,(2222, 2, '00:13:00', FALSE, 25, 'GER')
        ,(2222, 6, '00:44:00', FALSE, 25, 'GER')
        ,(2222, 7, '00:51:00', FALSE, 23, 'GER')
        ,(2223, 1, '00:13:00', FALSE, 25, 'GER')
        ,(2223, 2, '00:43:00', FALSE, 25, 'GER')
        ,(2223, 4, '00:56:00', FALSE, 23, 'GER')
        ,(2223, 3, '00:49:00', FALSE, 20, 'FRA')
        ,(2224, 1, '01:02:00', TRUE, 16, 'USA')
;

INSERT INTO TICKETS (ticketid, seatnumber, matchid, sold) VALUES
        (000, 'lusail1', 1111, True),
        (001, 'lusail2', 1111, True),
        (002, 'lusail3', 1111, False),
        (003, 'lusail4', 1111, True),
        (004, 'lusail5', 1111, False),
        (005, 'lusail6', 1111, False),
        (006, 'lusail7', 1111, False),
        (007, 'lusail8', 1111, False),
        (008, 'lusail9', 1111, False),
        (009, 'lusail10', 1111, False),
        (010, 'albayt1', 1112, True),
        (011, 'albayt2', 1112, True),
        (012, 'albayt3', 1112, False),
        (013, 'albayt4', 1112, False),
        (014, 'albayt5', 1112, False),
        (015, 'albayt6', 1112, False),
        (016, 'albayt7', 1112, False),
        (017, 'aljanoub1', 1113, False),
        (018, 'aljanoub2', 1113, False),
        (019, 'aljanoub3', 1113, False),
        (020, 'aljanoub4', 1113, False),
        (021, 'aljanoub5', 1113, True),
        (022, 'aljanoub6', 1113, True),
        (023, 'aljanoub7', 1113, False),
        (024, 'aljanoub8', 1113, False),
        (025, 'aljanoub9', 1113, False)
;

INSERT INTO PURCHASED (emailaddress, ticketid, price) VALUES
        ('tgomp9@gmail.com', 000, 120.50),
        ('signe.hoel@gmail.com', 001, 120.50),
        ('customer1@gmail.com', 003, 120.50),
        ('customer2@gmail.com', 010, 120.50),
        ('customer3@gmail.com', 011, 120.50),
        ('customer4@gmail.com', 021, 120.50),
        ('customer5@gmail.com', 022, 120.50)
;

INSERT INTO PLAYS_IN (playerId, matchId, inTime, outTime, yellowCard, redCard, position) VALUES
(1, 1111, '00:00:00', '01:00:00', True,  False, 'striker')
                                                                                              ,(1, 1112, '00:00:00', '01:00:00', False,  False, 'striker')
                                                                                              ,(1, 1113, '00:00:00', '01:00:00', True,  True, 'striker')
                                                                                              ,(2, 1111, '00:00:00', '01:00:00', False,  False, 'left wing')
                                                                                              ,(3, 1111, '00:00:00', '01:00:00', True,  False, 'right wing')
                                                                                              ,(3, 1112, '00:00:00', '01:00:00', False,  False, 'right wing')
                                                                                              ,(3, 1113, '00:00:00', '01:00:00', True,  True, 'left mid')
                                                                                              ,(4, 1111, '00:00:00', '01:00:00', False,  False, 'left mid')
                                                                                              ,(4, 1113, '00:00:00', '01:00:00', True,  True, 'left mid')
                                                                                              ,(5, 1112, '00:00:00', '01:00:00', False,  False, 'right mid')
                                                                                              ,(6, 1111, '00:00:00', '01:00:00', False,  False, 'center mid')
                                                                                              ,(6, 1113, '00:00:00', '01:00:00', True,  True, 'center mid')
                                                                                              ,(7, 1112, '00:00:00', '01:00:00', False,  False, 'center back')
                                                                                              ,(7, 1113, '00:00:00', '01:00:00', True,  True, 'center back')
                                                                                              ,(8, 1113, '00:00:00', '01:00:00', True,  True, 'right back')
                                                                                              ,(9, 1111, '00:00:00', '01:00:00', True,  False, 'left back')
                                                                                              ,(9, 1112, '00:00:00', '01:00:00', False,  False, 'left back')
                                                                                              ,(10, 1111, '00:00:00', '01:00:00', True,  False, 'center forward')
                                                                                              ,(10, 1112, '00:00:00', '01:00:00', False,  False, 'center forward')
                                                                                              ,(10, 1113, '00:00:00', '01:00:00', True,  True, 'center forward')
                                                                                              ,(11, 1111, '00:00:00', '01:00:00', True,  False, 'goalie')
                                                                                              ,(11, 1112, '00:00:00', '01:00:00', False,  False, 'goalie')
                                                                                              ,(11, 1113, '00:00:00', '01:00:00', True,  True, 'goalie')
                                                                                              ,(12, 1111, '00:00:00', '01:00:00', True,  False, 'goalie')
                                                                                              ,(12, 2222, '00:00:00', '01:00:00', False,  False, 'goalie')
                                                                                              ,(12, 2224, '00:00:00', '01:00:00', True,  True, 'goalie')
                                                                                              ,(13, 2222, '00:00:00', '01:00:00', False,  False, 'left wing')
                                                                                              ,(13, 2224, '00:00:00', '01:00:00', True,  True, 'left wing')
                                                                                              ,(14, 1111, '00:00:00', '01:00:00', True,  False, 'left mid')
                                                                                              ,(15, 1111, '00:00:00', '01:00:00', True,  False,'striker')
                                                                                              ,(15, 2222, '00:00:00', '01:00:00', False,  False, 'striker')
                                                                                              ,(15, 2224, '00:00:00', '01:00:00', True,  True, 'striker')
                                                                                              ,(16, 1111, '00:00:00', '01:00:00', True,  False, 'center back')
                                                                                              ,(16, 2224, '00:00:00', '01:00:00', True,  True, 'center back')
                                                                                              ,(17, 1113, '00:00:00', '01:00:00', True,  False, 'goalie')
                                                                                              ,(17, 2223, '00:00:00', '01:00:00', False,  False, 'goalie')
                                                                                              ,(17, 2224, '00:00:00', '01:00:00', True,  True, 'goalie')
                                                                                              ,(18, 1113, '00:00:00', '01:00:00', True,  False, 'left wing')
                                                                                              ,(18, 2223, '00:00:00', '01:00:00', False,  False,'left wing')
                                                                                              ,(18, 2224, '00:00:00', '01:00:00', True,  True, 'left wing')
                                                                                              ,(19, 2223, '00:00:00', '01:00:00', False,  False,'left mid')
                                                                                              ,(20, 1113, '00:00:00', '01:00:00', True,  False,'striker')
                                                                                              ,(20, 2224, '00:00:00', '01:00:00', True,  True, 'striker')
                                                                                              ,(21, 2222, '00:00:00', '01:00:00', False,  False, 'center back')
                                                                                              ,(21, 2223, '00:00:00', '01:00:00', True,  True, 'center back')
                                                                                              ,(22, 1112, '00:00:00', '01:00:00', True,  False, 'goalie')
                                                                                              ,(22, 2222, '00:00:00', '01:00:00', False,  False, 'goalie')
                                                                                              ,(22, 2223, '00:00:00', '01:00:00', True,  True, 'goalie')
                                                                                              ,(23, 1112, '00:00:00', '01:00:00', True,  False, 'left wing')
                                                                                              ,(23, 2222, '00:00:00', '01:00:00', False,  False, 'left wing')
                                                                                              ,(23, 2223, '00:00:00', '01:00:00', True,  True, 'left wing')
                                                                                              ,(24, 2222, '00:00:00', '01:00:00', False,  False, 'left mid')
                                                                                              ,(25, 1112, '00:00:00', '01:00:00', True,  False, 'striker')
                                                                                              ,(25, 2223, '00:00:00', '01:00:00', True,  True, 'striker')
                                                                                              ,(26, 2222, '00:00:00', '01:00:00', False,  False, 'center back')
                                                                                              ,(26, 2223, '00:00:00', '01:00:00', True,  True, 'center back')

;

INSERT INTO TEAM_PLAYS (matchId, country) VALUES
(1111, 'CAN')
                                               ,(1112, 'CAN')
                                               ,(1111, 'USA')
                                               ,(1112, 'GER')
                                               ,(1113, 'CAN')
                                               ,(1113, 'FRA')
                                               ,(2222, 'USA')
                                               ,(2222, 'GER')
                                               ,(2223, 'GER')
                                               ,(2223, 'FRA')
                                               ,(2224, 'USA')
                                               ,(2224, 'FRA')
;
