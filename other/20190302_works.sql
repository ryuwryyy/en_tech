/* Database作成 */
CREATE DATABASE Step;

/* table作成 */
CREATE TABLE UserInfo (
    UserId INT NOT NULL 
,   UserName VARCHAR(20) NOT NULL
,   Sex INT NOT NULL
,   LastLoginDate DATETIME NOT NULL
,   PRIMARY KEY (UserId)
);

CREATE TABLE UserInfoDummy (
    UserId INT NOT NULL 
,   UserName VARCHAR(20) NOT NULL
,   Sex INT NOT NULL
,   LastLoginDate DATETIME NOT NULL
,   PRIMARY KEY (UserId)
);


CREATE TABLE UserGift (
 UserId	INT	NOT NULL
, GiftIdentityId	INT	NOT NULL AUTO_INCREMENT
,GiftMessageId	INT	NOT NULL
,GiftItemId	INT	NOT NULL
,GiftItemNum	INT	NOT NULL
,GiftAddDate	DATETIME	NOT NULL
,PRIMARY KEY (GiftIdentityId, UserId)
);

/* Dummy */
SELECT 'aaaa' as `UserName`, 1111 as `UserId`, 5555 as `UserNo`

SELECT
   UserId
,  UserName
,  Sex as `せいべつ`
,  LastLoginDate as `Login`
FROM UserInfo

SELECT
    UserName
,   COUNT(*) AS `COUNTER`
,   SUM(Point) AS `PointSummary`
,   AVG(Point) AS `AVG`
FROM (
    SELECT
        'aaaa' as `UserName`
    ,   1111 as `UserId`
    ,   5555 as `Point`
    UNION ALL
    SELECT
        'bbb'
    ,   12345
    ,   9909
    UNION ALL
    SELECT
        'aaaa'
    ,   1111
    ,   5555
    ) as tbl
GROUP BY UserName

/* データ作成 */
INSERT INTO UserInfo (UserId,UserName, Sex, LastLoginDate) VALUES (111, 'Alice', 1, '2019-1-26 12:00:00.000');
INSERT INTO UserInfo VALUES (222, 'Bob', 2, '2019-1-25 11:00:00.000');

SELECT * FROM UserInfo;
INSERT INTO UserInfo (UserId,UserName, Sex, LastLoginDate) SELECT 333, 'Mando', 1, '2019-1-27 15:00:00.000';
SELECT * FROM UserInfo;

SELECT * FROM UserInfoDummy;
INSERT INTO UserInfoDummy (UserId,UserName, Sex, LastLoginDate) SELECT UserId,UserName, Sex, LastLoginDate FROM UserInfo;
SELECT * FROM UserInfoDummy;

SELECT * FROM UserInfoDummy;
INSERT INTO UserInfoDummy SELECT * FROM UserInfo;
SELECT * FROM UserInfoDummy;

SELECT * FROM UserInfoDummy;
DELETE FROM UserInfoDummy WHERE UserId = 333;
SELECT * FROM UserInfoDummy;

SELECT * FROM UserInfoDummy;
DELETE FROM UserInfoDummy;
SELECT * FROM UserInfoDummy;

SELECT * FROM UserInfoDummy;
UPDATE UserInfoDummy SET UserName = 'Jesica' WHERE UserId = 111;
SELECT * FROM UserInfoDummy;

SELECT * FROM UserInfoDummy;
UPDATE UserInfoDummy SET UserName = 'Jesica';
SELECT * FROM UserInfoDummy;

SELECT * FROM UserInfoDummy WHERE UserId IN (111,222);
UPDATE UserInfoDummy SET UserName = 'Jesica' WHERE UserId = 111;
UPDATE UserInfoDummy SET UserName = 'Bob' WHERE UserId = 222;
UPDATE UserInfoDummy SET UserName = 'Mando' WHERE UserId = 333;
SELECT * FROM UserInfoDummy WHERE UserId IN (111,222);

SELECT * FROM UserInfoDummy WHERE UserId = 111;
UPDATE UserInfoDummy SET UserName = 'Alice' WHERE UserId = 111;
SELECT * FROM UserInfoDummy WHERE UserId = 111;

SELECT * FROM UserInfoDummy WHERE UserName = 'Bob';
DELETE FROM UserInfoDummy WHERE UserName = 'Bob';
SELECT * FROM UserInfoDummy WHERE UserName = 'Bob';

/**/
BEGIN;

SELECT * FROM UserInfoDummy;

UPDATE UserInfoDummy SET UserName = 'Jesica' WHERE UserId = 111;
UPDATE UserInfoDummy SET UserName = 'Mando' WHERE UserId = 333;

SELECT * FROM UserInfoDummy;

/* COMMIT */
ROLLBACK;

SELECT * FROM UserInfoDummy;
/**/

SELECT * FROM UserGift; 
INSERT INTO UserGift SELECT 111,2,0,1001,1,'2019/1/26 13:00';
INSERT INTO UserGift SELECT 111,3,0,1002,1,'2019/1/26 13:00';
INSERT INTO UserGift SELECT 111,5,0,1002,1,'2019/1/26 15:00';
INSERT INTO UserGift SELECT 222,1,0,1001,1,'2019/1/26 13:00';
INSERT INTO UserGift SELECT 333,4,0,1001,1,'2019/1/26 14:00';
SELECT * FROM UserGift;


SELECT
  *
FROM UserInfo
  LEFT JOIN UserInfoDummy
  ON UserInfo.UserId = UserInfoDummy.UserId
ORDER BY
  UserInfo.UserId ASC;


