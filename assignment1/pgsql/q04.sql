SELECT DISTINCT w.url, w.title
FROM topics t, webpages w, links l
WHERE l.topicid=t.topicid AND l.url=w.url AND t.name='computer science'
ORDER BY url
;
