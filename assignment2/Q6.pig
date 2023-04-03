--load the data from HDFS and define the schema
movies = LOAD '/data/movies.csv' USING PigStorage(',') AS (movieid:INT, title:CHARARRAY, year:INT);

grpd = GROUP movies by year;

counts = FOREACH grpd GENERATE group AS year, COUNT($1) AS count;
prev_counts = FOREACH grpd GENERATE group AS year, COUNT($1) AS count;

joined = JOIN counts BY year - 1 LEFT OUTER, prev_counts BY year;

formatted = FOREACH joined GENERATE counts::year AS year, counts::count AS count, prev_counts::count AS previous_count;

filtered_counts = FILTER formatted BY previous_count IS NOT NULL AND count < previous_count;

DUMP filtered_counts;
