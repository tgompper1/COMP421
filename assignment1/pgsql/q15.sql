SELECT t.topicid, (
        SELECT COUNT(*)
        FROM links l
        WHERE t.topicid=l.topicid
) AS numlinks
FROM topics t
ORDER BY topicid
;
