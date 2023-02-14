SELECT w.url, w.title
FROM webpages w
WHERE w.url in (
        SELECT l.url
        FROM links l
        GROUP BY l.url
        HAVING COUNT(*) >= 2)
ORDER BY w.url
;
