SELECT DISTINCT w.url
FROM webpages w, evaluation e
WHERE w.url=e.url AND email='x@a.ca' AND w.url NOT IN (
        SELECT w.url
        FROM webpages w, evaluation e
        WHERE w.url=e.url AND e.email <> 'x@a.ca');
