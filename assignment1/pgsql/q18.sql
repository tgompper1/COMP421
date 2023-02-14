WITH temp(url, numevaluations) AS
(
        SELECT url, COUNT(*)
        FROM evaluation
        GROUP BY url
)
SELECT url, numevaluations
FROM temp
WHERE numevaluations = (
        SELECT MAX(numevaluations)
        FROM temp
)
ORDER BY url
;
