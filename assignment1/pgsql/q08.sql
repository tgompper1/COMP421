SELECT DISTINCT w.url
FROM webpages w, evaluation e
WHERE w.url = e.url AND e.email = 'x@a.ca'
EXCEPT
SELECT w.url
FROM webpages w, evaluation e
WHERE w.url = e.url AND e.email <> 'x@a.ca'
ORDER BY url;
