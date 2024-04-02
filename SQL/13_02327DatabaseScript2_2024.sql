USE Newspaper_Database;

-- Delete/Update statements section 5

-- Table before modifications
SELECT * FROM Journalist;

-- Insert new value
INSERT Journalist VALUES
('1107950533', 'Test', 'Person', 'Strandvejen', 13, 'København', 2900, 'Denmark', 88888888, 'testperson@gmail.com');

SELECT * FROM Journalist;

-- Update existing value
UPDATE Journalist
SET FirstName = 'TestUpdate', LastName = 'PersonUpdate'
WHERE CPR = '1107950533';

SELECT * FROM Journalist;

-- Delete value from table
DELETE FROM Journalist WHERE CPR = '1107950533';

SELECT * FROM Journalist;


-- Before modification
SELECT * FROM Photo;

-- Inserting data into the Photo table
INSERT Photo
VALUES ('Example Picture', '2023-12-19', '1403018933');

SELECT * FROM Photo;

-- Show photos before 2024-01-01
SELECT * FROM Photo WHERE DateTaken < '2024-01-01';

-- Update value 
UPDATE Photo
SET PhotoTitle = 'newTitle'
WHERE PhotoTitle = 'Example Picture';

SELECT * FROM Photo;

DELETE FROM Photo WHERE CPR = '1403018933';

SELECT * FROM Photo;



-- -------------------------------------------------
-- -------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------
-- Queries for section 6

-- For each topic, show the most read news article
SELECT a.ArticleTitle, a.Topic, a.ReadCount
FROM Article a
JOIN (
    SELECT Topic, MAX(ReadCount) AS max_view_count
    FROM Article
    GROUP BY Topic
) b ON a.Topic = b.Topic AND a.ReadCount = b.max_view_count;

-- Show the top 10 journalists whose articles, overall, attracted the highest number of reads
SELECT r.RoleType, r.CPR, SUM(a.ReadCount) AS TotalReads
FROM Role r
JOIN Article a ON r.ArticleTitle = a.ArticleTitle
GROUP BY r.CPR
ORDER BY TotalReads DESC;

SELECT r.CPR, a.ReadCount AS TotalReads
FROM Role r
JOIN Article a ON r.ArticleTitle = a.ArticleTitle AND r.RoleType = 'Writer'
GROUP BY r.CPR
ORDER BY TotalReads DESC;

SELECT r.CPR, a.ReadCount AS TotalReads
FROM Role r
JOIN Article a ON r.ArticleTitle = a.ArticleTitle AND r.RoleType = 'Leader'
GROUP BY r.CPR
ORDER BY TotalReads DESC;

SELECT r.CPR, a.ReadCount AS TotalReads
FROM Role r
JOIN Article a ON r.ArticleTitle = a.ArticleTitle AND r.RoleType = 'Advisor'
GROUP BY r.CPR
ORDER BY TotalReads DESC;

-- Show photographers whose photos were never used more than once
SELECT p.CPR, COUNT(i.PhotoTitle) AS photo_count
FROM Photographer p
LEFT JOIN Illustrates i ON p.PhotoTitle = i.PhotoTitle
GROUP BY p.CPR
HAVING photo_count <= 1;

-- Add new journalist to show example of query working
INSERT Journalist VALUE
('1309001234', 'Test', 'Photographer', 'TestStreetName', 123, 'TestCity', 2620, 'TestCountry', 42335466, 'testmail@test.dk');
INSERT Photo VALUE
('TestPhotoTitle', '2023-04-03', '1309001234');
INSERT Photographer VALUE
('TestPhotoTitle', '1309001234');
INSERT Illustrates VALUE
('TestPhotoTitle', 'Grueling Course comes with horrific conditions');



-- Identify which topics, overall, attracted less reads than the average
SELECT AVG(ReadCount) AS AvgReadCount
FROM Article;

SELECT Topic, SUM(ReadCount) AS TotalReadCount
FROM Article
GROUP BY Topic
HAVING SUM(ReadCount) < (SELECT AVG(ReadCount) FROM Article);

-- Identify which journalists were both writers and reporters, having shot at least a photo that was used for a news article they wrote
SELECT p.CPR
FROM Photographer p
NATURAL JOIN Role r
WHERE r.RoleType = 'Writer' 
  AND p.CPR = r.CPR 
  AND p.PhotoTitle IN (
    SELECT i.PhotoTitle
    FROM Illustrates i
    JOIN Article a ON i.ArticleTitle = a.ArticleTitle
  )
GROUP BY p.CPR;

-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------
-- --------------------------------------------------
-- Functions, procedures, triggers

DROP FUNCTION IF EXISTS AddJournalist;
DROP PROCEDURE IF EXISTS UpdateJournalistAddress;
DROP TRIGGER IF EXISTS AfterArticleInsert;



DELIMITER $$
CREATE FUNCTION AddJournalist(
	 nCPR         CHAR(10),
     nFirstName      VARCHAR(25),
     nLastName       VARCHAR(50),
     nStreetName     VARCHAR(100),
     nCivicNumber     INT,
     nCity        VARCHAR(30),
     nZipCode         INT,
     nCountry         VARCHAR(30),
     nTelephone     INT,
     nEmail            VARCHAR(50))
RETURNS VARCHAR(100)
BEGIN
    DECLARE Error_handle BOOLEAN DEFAULT FALSE;
    
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        SET Error_handle = TRUE;
    END;

    INSERT INTO Journalist (CPR, FirstName, LastName, StreetName, CivicNumber, City, ZipCode, Country, Telephone, Email)
    VALUES (nCPR, nFirstName, nLastName, nStreetName, nCivicNumber, nCity, nZipCode, nCountry, nTelephone, nEmail);
    
    IF Error_handle THEN
        RETURN 'Error: Failed to add journalist.';
    ELSE
        RETURN 'Journalist added successfully.';
    END IF;
END$$


SELECT AddJournalist('0911970890', 'John', 'Goblin', 'Main Street', 123, 'New York', 10001, 'USA', 45448261, 'johngoblin@gmail.com')$$

CREATE PROCEDURE UpdateJournalistAddress(
     IN nCPR         CHAR(10),
     IN nStreetName     VARCHAR(100),
     IN nCivicNumber     INT,
     IN nCity        VARCHAR(30),
     IN nZipCode         INT,
     IN nCountry         VARCHAR(30)
)
BEGIN
    UPDATE Journalist
    SET StreetName = nStreetName,
        CivicNumber = nCivicNumber,
        City = nCity,
        ZipCode = nZipCode,
        Country = nCountry
    WHERE CPR = nCPR;
    
    SELECT 'Journalist address updated successfully.' AS Result;
END$$

CALL UpdateJournalistAddress('0911970890', 'Avenue Street', 69, 'Paris', 10001, 'USA')$$

DROP TABLE IF EXISTS TriggerLog;

CREATE TABLE TriggerLog (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    message VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)$$

CREATE TRIGGER AfterArticleInsert
AFTER INSERT ON Article
FOR EACH ROW
BEGIN
    DECLARE maxReadCount INT;
    DECLARE maxReadArticleTitle VARCHAR(255);

    SELECT MAX(ReadCount), ArticleTitle INTO maxReadCount, maxReadArticleTitle FROM Article;
    
    IF NEW.ReadCount = maxReadCount THEN
        INSERT INTO TriggerLog (message) VALUES (CONCAT('New article with title "', NEW.ArticleTitle, '" has the highest ReadCount.'));
    END IF;
END$$
DELIMITER ;

INSERT Article VALUES
('This article is a tes123t', 'This is still just a te123st', 'Science', 123123);


SELECT * FROM TriggerLog;

