psql cs421 --echo-all <<-END 2>&1 | tee delNdrop.log

DROP TABLE Links;
DROP TABLE Evaluation;
DROP TABLE Topics;
DROP TABLE WebPages;

END
