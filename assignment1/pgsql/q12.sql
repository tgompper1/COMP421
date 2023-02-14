SELECT topicid, name
FROM topics t
WHERE NOT EXISTS ((SELECT w.url
                        FROM webpages w)
                EXCEPT
                (SELECT l.url
                        FROM links l
                        WHERE l.topicid=t.topicid))
ORDER BY topicid
;
