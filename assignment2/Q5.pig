moviegenres = LOAD '/data/moviegenres.csv' USING PigStorage(',') AS (movieid:INT, genre:CHARARRAY);

movies = LOAD '/data/movies.csv' USING PigStorage(',') AS (movieid:INT, title:CHARARRAY, year:INT);

moviesdated = FILTER movies BY year >= 2015 and year <= 2016 ;

jnd = join moviegenres by movieid, moviesdated by movieid;

prjct = foreach jnd generate moviegenres::genre, moviesdated::year;

grpd = group prjct by (moviegenres::genre, moviesdated::year);

smmd = foreach grpd generate flatten(group) as (genre, year), COUNT(prjct) as count;

ord1 = order smmd by year desc;

ord2 = order ord1 by genre asc;

top10 = limit ord2 10;

dump top10;
