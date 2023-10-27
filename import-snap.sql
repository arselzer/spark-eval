DROP TABLE IF EXISTS patents;
CREATE TABLE patents (fromNode integer, toNode integer);
-- COPY patents (fromNode, toNode) FROM 'snap/noheader/cit-Patents.txt';
\copy patents FROM 'snap/noheader/cit-Patents.txt' with (header false);
