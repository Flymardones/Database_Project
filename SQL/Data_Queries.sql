USE Newspaper_Database;

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



