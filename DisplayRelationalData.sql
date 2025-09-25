--Display every username and the lowest rating they have given
SELECT USERNAME, MIN(rating) AS Lowest_Rating
FROM userbase
LEFT JOIN reviews ON userbase.userid = reviews.userid
GROUP BY USERNAME;

--Display every user's email, question, and answer
SELECT email, question, answer
FROM userbase
LEFT JOIN security_questions ON userbase.userid = securityquestions.userid;

--Display the FIRSTNAME, EMAIL, and WALLETFUNDS of every user that does not have a WISHLIST.
SELECT FIRSTNAME, EMAIL, WALLETFUNDS
FROM userbase
FULL OUTER JOIN wishlist ON userbase.userid = wishlist.userid
WHERE wishlist.userid IS NULL;

--Display every USERNAME and number of products they have ordered
SELECT USERNAME, COUNT(ORDERID) AS 'Products Ordered'
FROM userbase
INNER JOIN orders ON userbase.userid = orders.userid
GROUP BY USERNAME;

--Display the age of any user who has ordered a product within the last 6 months.
SELECT to_char(sysdate, 'YYYY') - to_char(Birthday, 'YYYY') AS Age
FROM userbase
INNER JOIN orders ON userbase.userid = orders.userid
WHERE PURCHASEDATE >= ADD_MONTHS(sysdate, -6);

--Display the username and birthday of the user that has the highest friend count
SELECT USERNAME, BIRTHDAY
FROM userbase
WHERE USERID IN (SELECT USERID FROM friendslist
GROUP BY USERID
HAVING COUNT(FRIENDID) >= (SELECT MAX(FriendCount) as highest_friend_count
FROM (SELECT USERID, COUNT(FRIENDID) AS FriendCount
FROM friendslist
GROUP BY USERID )));

--PRODUCTNAME, RELEASEDATE, PRICE, and DESCRIPTION for any product found in the WISHLIST table.
SELECT PRODUCTNAME, RELEASEDATE, PRICE, DESCRIPTION
FROM productlist
INNER JOIN wishlist ON productlist.productcode = wishlist.productcode;

--Display the PRODUCTNAME, highest RATING, and number of reviews for each product in the REVIEWS table
SELECT PRODUCTNAME, MAX(RATING) AS Highest_Rating, COUNT(USERID) AS Number_of_Reviews
FROM productlist
INNER JOIN reviews ON productlist.productcode = reviews.productcode
GROUP BY PRODUCTNAME;
ORDER BY MAX(RATING) DESC;

--displays the PRODUCTNAME, GENRE, and RATING for every product with a 5 or a 1 RATING
CREATE OR REPLACE VIEW ExtremeRatings AS
SELECT PRODUCTNAME, GENRE, RATING
FROM productlist
INNER JOIN reviews ON productlist.productcode = reviews.productcode
WHERE RATING = 5 OR RATING = 1;

--Display the count of products ordered, grouped by GENRE
SELECT COUNT(ORDERID) AS "Number of Orders", GENRE
FROM productlist
INNER JOIN orders ON productlist.productcode = orders.productcode
GROUP BY GENRE
ORDER BY GENRE ASC;

--Create a view that displays each PUBLISHER, the average PRICE, and the sum of HOURSPLAYED for their products.
CREATE OR REPLACE VIEW PublisherStats AS
SELECT PUBLISHER, AVG(PRICE) AS "Average Price", SUM(HOURSPLAYED) AS "Total Hours Played"
FROM productlist
INNER JOIN userlibrary ON productlist.productcode = userlibrary.productcode
GROUP BY PUBLISHER;

--Display the sum of money spent on products and their corresponding PUBLISHER, from the ORDERS table 
SELECT Publisher, SUM(PRICE) AS "Total Money Spent"
FROM productlist
INNER JOIN orders ON productlist.productcode = orders.productcode
GROUP BY PUBLISHER
ORDER BY SUM(ORDER.PRICE) DESC;

--Display the TICKETID, USERNAME, EMAIL, and ISSUE only for tickets with a STATUS of ‘NEW’ or ‘IN PROGRESS’, sorted by the latest DATEUPDATED.
SELECT TICKETID, USERNAME, UserBase.EMAIL, ISSUE
FROM USERSUPPORT
INNER JOIN USERBASE ON USERSUPPORT.EMAIL = USERBASE.EMAIL
WHERE STATUS IN ('NEW', 'IN PROGRESS')
ORDER BY DATEUPDATED DESC;

--Display the USERNAME and count of TICKETID that users have submitted for user support.
SELECT USERNAME, COUNT(TICKETID) AS "Number of Tickets"
FROM USERSUPPORT
INNER JOIN USERBASE ON USERSUPPORT.EMAIL = USERBASE.EMAIL
GROUP BY USERNAME

--Display the USERID and EMAIL of any user who has submitted a support ticket that used their FIRSTNAME, LASTNAME, or combination of the two in their EMAIL address.
SELECT USERID, UserSupport.EMAIL
FROM UserSupport
INNER JOIN UserBase ON UserSupport.EMAIL = UserBase.EMAIL
WHERE UPPER(UserSupport.EMAIL) LIKE UPPER('%' || FIRSTNAME || '%')
OR UPPER(UserSupport.EMAIL) LIKE UPPER('%' || LASTNAME || '%')

--Display the EMAIL address of any user who has a ‘NEW’ or ‘IN PROGRESS’ support ticket STATUS, where the EMAIL is not currently saved in the USERBASE table.
SELECT UserSupport.EMAIL
FROM UserSupport
LEFT JOIN UserBase ON UserSupport.EMAIL = UserBase.EMAIL
WHERE UserBase.EMAIL IS NULL
AND STATUS IN ('NEW', 'IN PROGRESS');

--Q17: Display the TICKETID, FIRSTNAME, LASTNAME, and USERNAME of any user whose USERNAME is mentioned in the ISSUE of a support ticket.
SELECT TICKETID, FIRSTNAME, LASTNAME, USERNAME
FROM UserSupport
INNER JOIN UserBase ON UserSupport.EMAIL = UserBase.EMAIL
WHERE UPPER(ISSUE) LIKE UPPER('%' || USERNAME || '%');

--Display the USERNAME and PASSWORD associated with the EMAIL address provided in the support tickets.
SELECT USERNAME, PASSWORD
FROM UserBase
INNER JOIN UserSupport ON UserBase.EMAIL = UserSupport.EMAIL;

--Create a view that displays the USERNAME, DATEASSIGNED, and PENALTY for any user whose PENALTY is not null and the infraction was assigned within the last month.
CREATE OR REPLACE VIEW PenaltyView AS
SELECT USERNAME, DATEASSIGNED, PENALTY
FROM UserBase
INNER JOIN Infractions ON UserBase.USERID = Infractions.USERID
WHERE PENALTY IS NOT NULL
AND DATEASSIGNED >= SYSDATE - 30;

--Display the USERNAME and EMAIL of any user who is at least 18 years old and has not received an infraction within the last 4 months.
SELECT USERNAME, UserBase.EMAIL
FROM UserBase
OUTER JOIN Infractions ON UserBase.USERID = Infractions.USERID
WHERE Birthday <= ADD_MONTHS(SYSDATE, -216)
AND (DATEASSIGNED IS NULL OR DATEASSIGNED <= ADD_MONTHS(SYSDATE, -4));