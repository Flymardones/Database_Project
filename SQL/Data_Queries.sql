USE Newspaper_Database;

-- For each topic, show the most read news article
SELECT a.*
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
SELECT DISTINCT P.CPR
FROM Photographer P
LEFT JOIN Illustrates I ON P.PhotoTitle = I.PhotoTitle
GROUP BY P.CPR
HAVING COUNT(I.PhotoTitle) = COUNT(DISTINCT I.ArticleTitle) OR COUNT(I.ArticleTitle) IS NULL;




-- Identify which topics, overall, attracted less reads than the average
SELECT AVG(ReadCount) AS AvgReadCount
FROM Article;

SELECT Topic, AVG(ReadCount) AS AvgReadCount
FROM Article
GROUP BY Topic
HAVING AVG(ReadCount) < (SELECT AVG(ReadCount) FROM Article);

-- Identify which journalists were both writers and reporters, having shot at least a photo that was used for a news article they wrote
