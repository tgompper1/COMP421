SELECT AVG(count) AS avgnumlinks
FROM
(
        SELECT COUNT(url)
        FROM links
        GROUP BY topicid
        ORDER BY topicid
)
AS count;
