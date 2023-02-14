SELECT DISTINCT url
FROM webpages
WHERE webpages.url IN (SELECT url
        FROM links
        WHERE links.topicid IN (SELECT topicid
                FROM topics
                WHERE topics.name='computer science'))
;
