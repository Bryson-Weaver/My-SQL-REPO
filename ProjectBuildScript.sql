-- PURPOSE: Create initial tables and data for course project
-- AUTHOR: Haylee Liska
-- DATE: 10/19/2022
-- NOTES: This script only needs to be run once.


-- *** Section 1: Create initial tables ***


-- UserBase holds data on user information
CREATE TABLE UserBase
(UserID         NUMBER(3),
FirstName       VARCHAR2(50),
LastName        VARCHAR2(50),
UserName        VARCHAR2(25),
Password        VARCHAR2(100),
Email           VARCHAR2(100),
Birthday        DATE,
WalletFunds     NUMBER(8,2),
CONSTRAINT PK_UserBase PRIMARY KEY (UserID)
);

COMMIT;


-- UserLibrary holds data on what products users own
CREATE TABLE UserLibrary
(UserID         NUMBER(3), 
ProductCode     VARCHAR2(5),
HoursPlayed     NUMBER(10),
CONSTRAINT PK_UserLibrary PRIMARY KEY (UserID, ProductCode)
);

COMMIT;


-- ProductList holds data on products the store can sell
CREATE TABLE ProductList
(ProductCode    VARCHAR2(5),
ProductName     VARCHAR2(50),
Publisher       VARCHAR(50),
Genre           VARCHAR2(25),
ReleaseDate     DATE,
CONSTRAINT PK_ProductList PRIMARY KEY (ProductCode)
);


COMMIT;


-- StoreFront holds data on what is currently available for purchase in the store
CREATE TABLE StoreFront
(InventoryID        NUMBER(5),
ProductCode        VARCHAR2(5),
Price                NUMBER(6, 2),
Description        VARCHAR2(250));


COMMIT;


-- Reviews holds data on user comments about products
CREATE TABLE Reviews
(UserID        NUMBER(3),
ProductCode    VARCHAR2(5),
Review         VARCHAR2(250),
Rating         NUMBER(1),
CONSTRAINT PK_Reviews PRIMARY KEY (UserID, ProductCode)
);


COMMIT;


-- Orders holds data on users who purchased products
CREATE TABLE Orders
(OrderID        NUMBER(5),
UserID          NUMBER(3),
ProductCode     VARCHAR2(5),
Price           NUMBER(6, 2),
PurchaseDate    DATE,
CONSTRAINT PK_Orders PRIMARY KEY (OrderID)
);


COMMIT;




-- *** Section 2: Insert starting data into tables ***


-- UserBase 
INSERT INTO UserBase VALUES
(101, 'Ashley', 'Doherty', 'Ash1996', 'Me@Games96'')(', 'Doherty@gmail.com', TO_DATE('05-MAY-1996','DD-MON-YYYY'), 89.90);

INSERT INTO UserBase VALUES
(102, 'Isabel', 'Cooper', 'xCoopX', 'XxIsavg%!', 'Isabel.Cooper@gmail.com', TO_DATE('07-AUG-1986','DD-MON-YYYY'), 126.42);

INSERT INTO UserBase VALUES
(103, 'Gavin', 'Johnston', 'GravyGavy_92', '92Gavman29', '92Gavin@yahoo.com', TO_DATE('02-JAN-1992','DD-MON-YYYY'), 184.35);

INSERT INTO UserBase VALUES
(104, 'Carey', 'Grey', 'WhoCaresCool', 'K1tK@T', 'CoolGuy@gmail.com', TO_DATE('21-MAR-2002','DD-MON-YYYY'), 3.92);

INSERT INTO UserBase VALUES
(105, 'Matthew', 'Wilson', 'Wills_Son', 'i1^6$', 'MattWilson@yahoo.com', TO_DATE('09-OCT-1980','DD-MON-YYYY'), 129.88);

INSERT INTO UserBase VALUES
(106, 'Alex', 'Kingston', 'KingPlayer1034', 'c4z6R', 'AlexanderKingston@gmail.com', TO_DATE('12-JUN-1999','DD-MON-YYYY'), 51.67);

INSERT INTO UserBase VALUES
(107, 'Michael', 'Smith', 'XxSwordSmithXx', '053Z1Y', 'Smith.Smith2@gmail.com', TO_DATE('18-MAR-2005','DD-MON-YYYY'), 127.67);

INSERT INTO UserBase VALUES
(108, 'Sean', 'Smith', 'Mr_Perfect', 'TH3_Sm1thster', 'SSmith@gmail.com', TO_DATE('02-AUG-1990','DD-MON-YYYY'), 17.30);

INSERT INTO UserBase VALUES
(109, 'Ellie', 'Joseph', 'PrincessWarrior52', 'my_prince_charming!!', 'EllieJo@gmail.com', TO_DATE('06-NOV-1991','DD-MON-YYYY'), 42.00);

INSERT INTO UserBase VALUES
(110, 'Marcus', 'Greene', 'MarcustheGreat', 'DJ-Marcus777', 'GreenM@gmail.com', TO_DATE('04-NOV-1980','DD-MON-YYYY'), 30.00);

INSERT INTO UserBase VALUES
(111, 'Brian', 'Kim', 'Soul_Searcher', '1me!m', 'BrianKim1998@gmail.com', TO_DATE('04-SEP-1998','DD-MON-YYYY'), 44.99);

INSERT INTO UserBase VALUES
(112, 'Veronica', 'Brook', 'MadQueen_VB', 'Pr0mQu33n', 'RonyBrooks@gmail.com', TO_DATE('23-DEC-2000','DD-MON-YYYY'), 2.45);

INSERT INTO UserBase VALUES
(113, 'Ronald', 'Hart', 'WardenKeeper', 'MtMa4!', 'RHOffice@gmail.com', TO_DATE('23-DEC-2000','DD-MON-YYYY'), 114.23);

INSERT INTO UserBase VALUES
(114, 'Camila', 'Morales', 'HeroMan9845', '#QT5489', 'C_Hero@gmail.com', TO_DATE('17-JUN-1997','DD-MON-YYYY'), 53.14);

INSERT INTO UserBase VALUES
(115, 'Sarah', 'Brown', 'Howlerwolf', 'Wolves)))', 'SBrown75289@gmail.com', TO_DATE('28-JUL-1985','DD-MON-YYYY'), 5.55);

COMMIT;


-- ProductList 
INSERT INTO ProductList VALUES
('GAME1', 'Understory', 'Ruby Wolf', 'Indie', TO_DATE('16-SEP-2015','DD-MON-YYYY'));


INSERT INTO ProductList VALUES
('GAME2', 'With Us', 'OuterOtter', 'Horror', TO_DATE('15-NOV-2018','DD-MON-YYYY'));


INSERT INTO ProductList VALUES
('GAME3', 'Extra Oxygen', 'Gamertainment', 'Simulation', TO_DATE('30-NOV-2019','DD-MON-YYYY'));


INSERT INTO ProductList VALUES
('GAME4', 'Heist Auto IV', 'StarMoon Games', 'Action-Adventure', TO_DATE('01-APR-2016','DD-MON-YYYY'));


INSERT INTO ProductList VALUES
('GAME5', 'Doorway', 'Outlet Games', 'Strategy', TO_DATE('19-MAY-2011','DD-MON-YYYY'));


INSERT INTO ProductList VALUES
('GAME6', 'Oxidize', 'Kickface Studios', 'Action-Adventure', TO_DATE('01-FEB-2018','DD-MON-YYYY'));


INSERT INTO ProductList VALUES
('GAME7', 'Eldest Loop', 'Forest Software', 'RPG', TO_DATE('24-FEB-2022','DD-MON-YYYY'));


INSERT INTO ProductList VALUES
('GAME8', 'Digital Tabletop', 'Hysteria Games', 'Casual', TO_DATE('05-MAY-2015','DD-MON-YYYY'));


INSERT INTO ProductList VALUES 
('GAME9', 'Enlightenment VI', 'Mayor Bids Games', 'Strategy', TO_DATE('21-DEC-2016','DD-MON-YYYY'));


INSERT INTO ProductList VALUES
('RPG10', 'Final Vision VII', 'PhoenixCube', 'Action-RPG', TO_DATE('17-JUN-2012','DD-MON-YYYY'));


INSERT INTO ProductList VALUES
('PZL11', 'The Time I Lost My Friend in a Dungeon', 'Double Games', 'Puzzle', TO_DATE('16-AUG-2022','DD-MON-YYYY'));


INSERT INTO ProductList VALUES
('GME12', 'The Sheep Beside You', 'WhisperTell', 'Action', TO_DATE('11-OCT-2014','DD-MON-YYYY'));


INSERT INTO ProductList VALUES
('GME13', 'Loudest World', 'Roguelike Games', 'Turn-Based', TO_DATE('03-JUL-2015','DD-MON-YYYY'));


INSERT INTO ProductList VALUES
('VNL14', 'Guise 5', 'AGES', 'Visual Novel', TO_DATE('16-MAR-2021','DD-MON-YYYY'));


INSERT INTO ProductList VALUES
('GME15', 'Hollowcreate', 'Jingle Studios', 'Adventure', TO_DATE('22-AUG-2021','DD-MON-YYYY'));


COMMIT;




-- Reviews
INSERT INTO Reviews VALUES
(104, 'GAME7', 'This game is so overrated but incredibly fun. Definitely don''t sleep on it', 4 ); 


INSERT INTO Reviews VALUES
(103, 'GAME6', 'I bought this game thinking I would play it once. I haven''t put it down. Please. Help. Me.', 5 );


INSERT INTO Reviews VALUES
(107, 'GAME4', 'Worst Game Ever.', 1);


INSERT INTO Reviews VALUES
(112, 'GME15', 'If only I could give it a 0.', 1);


INSERT INTO Reviews VALUES
(115, 'GAME3', 'After playing Guise 4 I expected similar systems, but overall I would recommend.', 4);


INSERT INTO Reviews VALUES
(107, 'GME12', 'It''s like someone turned a joke into a game. Did the devs even try?', 2 );


INSERT INTO Reviews VALUES
(101, 'GME15', 'The story was immaculate, the character development unmatched, and the gameplay pure fun. I''ve already played three times and I am starting again.', 5);


INSERT INTO Reviews VALUES
(109, 'GME13', 'I can''t even load the maps without a crash. Stop releasing broken games.', 1);


INSERT INTO Reviews VALUES
(102, 'GAME1', 'I don''t typically care for games like this but it was very enjoyable.', 4);


INSERT INTO Reviews VALUES
(113, 'GAME1', 'It was great until you got rid of the main character! No one wants to play a game where this happens. It''s too complicated and unreasonable.', 2);


INSERT INTO Reviews VALUES
(101, 'GAME6', ': ) sweet', 5);


INSERT INTO Reviews VALUES
(107, 'VNL14', 'Eh, could be better. Could be worse.', 3 );


INSERT INTO Reviews VALUES
(102, 'GAME6', 'Multiplayer usually means being able to actually play with my friends. Fix the servers please!', 3);


INSERT INTO Reviews VALUES
(110, 'RPG10', 'Definitely Game of the Year!!!', 5);


INSERT INTO Reviews VALUES
(104, 'GAME2', 'Overhyped', 2);

COMMIT;


-- UserLibrary
INSERT INTO UserLibrary VALUES
(104, 'GAME7', 65);


INSERT INTO UserLibrary VALUES
(103, 'GAME6', 1888);


INSERT INTO UserLibrary VALUES
(107, 'GAME4', 5);


INSERT INTO UserLibrary VALUES
(112, 'GME15', 10);


INSERT INTO UserLibrary VALUES
(115, 'GAME3', 80);


INSERT INTO UserLibrary VALUES
(107, 'GME12', 3);


INSERT INTO UserLibrary VALUES
(101, 'GME15', 115);


INSERT INTO UserLibrary VALUES
(109, 'GME13', 22);


INSERT INTO UserLibrary VALUES
(102, 'GAME1', 74);


INSERT INTO UserLibrary VALUES
(113, 'GAME1', 49);


INSERT INTO UserLibrary VALUES
(101, 'GAME6', 13);


INSERT INTO UserLibrary VALUES
(107, 'VNL14', 30);


INSERT INTO UserLibrary VALUES
(102, 'GAME6', 36);


INSERT INTO UserLibrary VALUES
(110, 'RPG10', 123);


INSERT INTO UserLibrary VALUES
(104, 'GAME2', 16);

COMMIT;


-- StoreFront
INSERT INTO StoreFront VALUES
(11112, 'GAME1', 22.22, 'The next big indie game of the year!');


INSERT INTO StoreFront VALUES
(11112, 'GAME2', 65.43, 'One of these things is NOT like the other…');


INSERT INTO StoreFront VALUES
(11112, 'GAME3', 18.92, 'Do you like building? Resource Collecting? Civilization Management? This is the game for you!');


INSERT INTO StoreFront VALUES
(11112, 'GAME4', 27.25, 'The greatest follow-up to Heist Auto III.');


INSERT INTO StoreFront VALUES
(11112, 'GAME5', 55.99, 'A little bit of puzzle, a lot of momentum. Don''t be left behind and make your way through the Doorway.');


INSERT INTO StoreFront VALUES
(11112, 'GAME6', 75.00, 'Gather a group of friends and secure the strongest bunker on the server.');


INSERT INTO StoreFront VALUES
(11112, 'GAME7', 5.98, 'There can only be one lord. Will it be you?');


INSERT INTO StoreFront VALUES
(11112, 'GAME8', 118.56, 'Take the table to the internet! Now experience a virtual playspace for you and your buddies.');


INSERT INTO StoreFront VALUES
(11112, 'GAME9', 33.48, 'Will this series ever end? Of course not! Play the next big town management game here!');


INSERT INTO StoreFront VALUES
(11112, 'RPG10', 12.25, 'The greatest musical composers came together to make this not only visually appealing, but an auditory masterpiece.');


INSERT INTO StoreFront VALUES
(11112, 'PZL11', 190.11, 'Platformers? No Way! Puzzles are the way to go.');


INSERT INTO StoreFront VALUES
(11112, 'GME12', 35.27, 'A beautiful stylized game that takes you on through a mysterious adventure.');


INSERT INTO StoreFront VALUES
(11112, 'GME13', 49.97, 'Take turns between you and the enemy! Fight offline and online in Loudest World!');


INSERT INTO StoreFront VALUES
(11112, 'VNL14', 72.26, 'Click your way through this visual novel where your choice ultimately matter!');


INSERT INTO StoreFront VALUES
(11112, 'GME15', 50.01, 'A solid choice every time. Every game is like stepping into a whole new world.');

COMMIT;


-- Orders
INSERT INTO Orders VALUES
(12345, 104, 'GAME7', 75.80, TO_DATE('24-FEB-2022','DD-MON-YYYY'));


INSERT INTO Orders VALUES
(12346, 103, 'GAME6', 22.25, TO_DATE('04-MAR-2022','DD-MON-YYYY'));


INSERT INTO Orders VALUES
(12347, 107, 'GAME4', 15.90, TO_DATE('25-FEB-2022','DD-MON-YYYY'));


INSERT INTO Orders VALUES
(12348, 112, 'GME15', 65.99, TO_DATE('20-FEB-2022','DD-MON-YYYY'));


INSERT INTO Orders VALUES
(12349, 115, 'GAME3', 45.15, TO_DATE('07-JUL-2022','DD-MON-YYYY'));


INSERT INTO Orders VALUES
(12350, 107, 'GME12', 55.70, TO_DATE('07-AUG-2022','DD-MON-YYYY'));


INSERT INTO Orders VALUES
(12351, 101, 'GME15', 90.15, TO_DATE('01-AUG-2022','DD-MON-YYYY'));


INSERT INTO Orders VALUES
(12352, 109, 'GME13', 32.98, TO_DATE('03-AUG-2022','DD-MON-YYYY'));


INSERT INTO Orders VALUES
(12353, 102, 'GAME1', 44.44, TO_DATE('06-APR-2022','DD-MON-YYYY'));


INSERT INTO Orders VALUES
(12354, 101, 'GAME6', 56.32, TO_DATE('19-APR-2022','DD-MON-YYYY'));


INSERT INTO Orders VALUES
(12355, 107, 'VNL14', 19.99, TO_DATE('05-MAY-2022','DD-MON-YYYY'));


INSERT INTO Orders VALUES
(12356, 102, 'GAME6', 19.99, TO_DATE('16-MAY-2022','DD-MON-YYYY'));


INSERT INTO Orders VALUES
(12357, 110, 'RPG10', 24.79, TO_DATE('06-MAR-2022','DD-MON-YYYY'));


INSERT INTO Orders VALUES
(12358, 104, 'GAME2', 81.27, TO_DATE('22-AUG-2022','DD-MON-YYYY'));


INSERT INTO Orders VALUES
(12359, 113, 'GAME1', 17.81, TO_DATE('22-AUG-2022','DD-MON-YYYY'));

COMMIT;