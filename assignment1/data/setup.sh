psql cs421 --echo-all <<-END 2>&1 | tee setup.log

CREATE TABLE Topics
(
   topicid INTEGER NOT NULL
  ,name VARCHAR(30) NOT NULL
  ,parentid INTEGER
  ,PRIMARY KEY(topicid)
);

CREATE TABLE WebPages
(
   url VARCHAR(100) NOT NULL
  ,title VARCHAR(50) NOT NULL
  ,PRIMARY KEY(url)
);

CREATE TABLE Links
(
   topicid INTEGER NOT NULL
  ,url VARCHAR(100) NOT NULL
  ,PRIMARY KEY(topicid, url)
  ,FOREIGN KEY(topicid) REFERENCES Topics(topicid)
  ,FOREIGN KEY(url) REFERENCES WebPages(url)
);

CREATE TABLE Evaluation
(
   url VARCHAR(100) NOT NULL
  ,evaldate DATE NOT NULL
  ,grade VARCHAR(10) NOT NULL
  ,email VARCHAR(50) NOT NULL
  ,PRIMARY KEY(url, evaldate)
  ,FOREIGN KEY(url) REFERENCES WebPages(url)
);

INSERT INTO Topics VALUES(1, 'computer science', NULL);
INSERT INTO Topics VALUES(2, 'database systems', 1);
INSERT INTO Topics VALUES(3, 'Oracle', 2);
INSERT INTO Topics VALUES(4, 'DB2', 2);
INSERT INTO Topics VALUES(5, 'Web Page', NULL);

INSERT INTO WebPages VALUES('www.oracle.com', 'Oracle Corporation');
INSERT INTO WebPages VALUES('www.oracle.com/database', 'Oracle Database');
INSERT INTO WebPages VALUES('www.ibm.com/software/db2', 'IBM DB2 Product Family');
INSERT INTO WebPages VALUES('www.cs.mcgill.ca', 'McGill School of Computer Science');
INSERT INTO WebPages VALUES('www.cs.mcgill.ca/research/areas', 'McGill Computer Science Research');
INSERT INTO WebPages VALUES('en.wikipedia.org/wiki/Computer_science', 'computer science');
INSERT INTO WebPages VALUES('en.wikipedia.org/wiki/List_of_relational_database_management_systems', 'List of RDBMS');
INSERT INTO WebPages VALUES('en.wikipedia.org/wiki/Web_page', 'Web Page');

INSERT INTO Links VALUES(2, 'www.oracle.com/database');
INSERT INTO Links VALUES(3, 'www.oracle.com/database');
INSERT INTO Links VALUES(5, 'www.oracle.com/database');
INSERT INTO Links VALUES(2, 'www.ibm.com/software/db2');
INSERT INTO Links VALUES(5, 'www.ibm.com/software/db2');
INSERT INTO Links VALUES(3, 'www.oracle.com');
INSERT INTO Links VALUES(5, 'www.oracle.com');
INSERT INTO Links VALUES(1, 'www.cs.mcgill.ca');
INSERT INTO Links VALUES(5, 'www.cs.mcgill.ca');
INSERT INTO Links VALUES(1, 'www.cs.mcgill.ca/research/areas');
INSERT INTO Links VALUES(2, 'www.cs.mcgill.ca/research/areas');
INSERT INTO Links VALUES(5, 'www.cs.mcgill.ca/research/areas');
INSERT INTO Links VALUES(1, 'en.wikipedia.org/wiki/Computer_science');
INSERT INTO Links VALUES(5, 'en.wikipedia.org/wiki/Computer_science');
INSERT INTO Links VALUES(1, 'en.wikipedia.org/wiki/List_of_relational_database_management_systems');
INSERT INTO Links VALUES(2, 'en.wikipedia.org/wiki/List_of_relational_database_management_systems');
INSERT INTO Links VALUES(3, 'en.wikipedia.org/wiki/List_of_relational_database_management_systems');
INSERT INTO Links VALUES(5, 'en.wikipedia.org/wiki/List_of_relational_database_management_systems');
INSERT INTO Links VALUES(5, 'en.wikipedia.org/wiki/Web_page');

INSERT INTO Evaluation VALUES('www.oracle.com', '2017-01-01', 'good', 'x@a.ca');
INSERT INTO Evaluation VALUES('www.oracle.com', '2017-01-25', 'good', 'a@x.ca');
INSERT INTO Evaluation VALUES('www.oracle.com', '2015-01-01', 'good', 'x@a.ca');
INSERT INTO Evaluation VALUES('www.oracle.com/database', '2017-02-26', 'bad', 'x@a.ca');
INSERT INTO Evaluation VALUES('www.oracle.com/database', '2017-03-26', 'bad', 'x@a.ca');
INSERT INTO Evaluation VALUES('www.oracle.com/database', '2002-03-06', 'bad', 'k@a.ca');
INSERT INTO Evaluation VALUES('www.cs.mcgill.ca/research/areas', '2013-01-01', 'good', 'm@a.ca');
INSERT INTO Evaluation VALUES('www.cs.mcgill.ca/research/areas', '2003-01-01', 'good', 'm@a.ca');
INSERT INTO Evaluation VALUES('en.wikipedia.org/wiki/Computer_science', '2003-01-01', 'good', 'x@a.ca');

END
