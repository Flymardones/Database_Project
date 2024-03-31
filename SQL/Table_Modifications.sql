USE Newspaper_Database;

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