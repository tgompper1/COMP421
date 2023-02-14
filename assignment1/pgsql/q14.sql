SELECT topicid, COUNT(*) AS numlinks
FROM links
GROUP BY topicid
ORDER BY topicid
;
