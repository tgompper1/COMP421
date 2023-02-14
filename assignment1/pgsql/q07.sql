SELECT DISTINCT w1.url, w1.title
FROM webpages w1, webpages w2, evaluation e1, evaluation e2
WHERE (w1.url = e1.url AND e1.email = 'x@a.ca') AND (w2.url = e2.url AND e2.email = 'a@x.ca')
ORDER BY url;
