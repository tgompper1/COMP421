SELECT topicid, COUNT(url) AS numlinks
FROM
(
        SELECT t.topicid, url
        FROM topics t
                LEFT OUTER JOIN links l
                ON t.topicid=l.topicid
)allids
GROUP BY topicid
ORDER BY topicid
;
