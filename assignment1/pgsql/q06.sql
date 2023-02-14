SELECT DISTINCT w.url, title
FROM webpages w, evaluation e
WHERE w.url = e.url AND (evaldate >= '2006-01-01' OR evaldate IS NULL)
ORDER BY w.url;
