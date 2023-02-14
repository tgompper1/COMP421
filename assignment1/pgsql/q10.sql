SELECT DISTINCT l1.url, w.title
FROM webpages w, links l1, links l2
WHERE (l1.url=l2.url AND l1.topicid<>l2.topicid) AND l1.url=w.url
ORDER BY l1.url
;
