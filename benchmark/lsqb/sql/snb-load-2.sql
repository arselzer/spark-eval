COPY Company                   FROM 'PATHVAR/Company.csv'                   (DELIMITER '|', HEADER, FORMAT csv);
COPY University                FROM 'PATHVAR/University.csv'                (DELIMITER '|', HEADER, FORMAT csv);
COPY Continent                 FROM 'PATHVAR/Continent.csv'                 (DELIMITER '|', HEADER, FORMAT csv);
COPY Country                   FROM 'PATHVAR/Country.csv'                   (DELIMITER '|', HEADER, FORMAT csv);
COPY City                      FROM 'PATHVAR/City.csv'                      (DELIMITER '|', HEADER, FORMAT csv);
COPY Forum                     FROM 'PATHVAR/Forum.csv'                     (DELIMITER '|', HEADER, FORMAT csv);
COPY Comment                   FROM 'PATHVAR/Comment.csv'                   (DELIMITER '|', HEADER, FORMAT csv);
COPY Post                      FROM 'PATHVAR/Post.csv'                      (DELIMITER '|', HEADER, FORMAT csv);
COPY Person                    FROM 'PATHVAR/Person.csv'                    (DELIMITER '|', HEADER, FORMAT csv);
COPY Tag                       FROM 'PATHVAR/Tag.csv'                       (DELIMITER '|', HEADER, FORMAT csv);
COPY TagClass                  FROM 'PATHVAR/TagClass.csv'                  (DELIMITER '|', HEADER, FORMAT csv);
COPY Comment_hasTag_Tag        FROM 'PATHVAR/Comment_hasTag_Tag.csv'        (DELIMITER '|', HEADER, FORMAT csv);
COPY Post_hasTag_Tag           FROM 'PATHVAR/Post_hasTag_Tag.csv'           (DELIMITER '|', HEADER, FORMAT csv);
COPY Forum_hasMember_Person    FROM 'PATHVAR/Forum_hasMember_Person.csv'    (DELIMITER '|', HEADER, FORMAT csv);
COPY Forum_hasTag_Tag          FROM 'PATHVAR/Forum_hasTag_Tag.csv'          (DELIMITER '|', HEADER, FORMAT csv);
COPY Person_hasInterest_Tag    FROM 'PATHVAR/Person_hasInterest_Tag.csv'    (DELIMITER '|', HEADER, FORMAT csv);
COPY Person_likes_Comment      FROM 'PATHVAR/Person_likes_Comment.csv'      (DELIMITER '|', HEADER, FORMAT csv);
COPY Person_likes_Post         FROM 'PATHVAR/Person_likes_Post.csv'         (DELIMITER '|', HEADER, FORMAT csv);
COPY Person_studyAt_University FROM 'PATHVAR/Person_studyAt_University.csv' (DELIMITER '|', HEADER, FORMAT csv);
COPY Person_workAt_Company     FROM 'PATHVAR/Person_workAt_Company.csv'     (DELIMITER '|', HEADER, FORMAT csv);
COPY Person_knows_Person (Person1id, Person2id) FROM 'PATHVAR/Person_knows_Person.csv'       (DELIMITER '|', HEADER, FORMAT csv);
COPY Person_knows_Person (Person2id, Person1id) FROM 'PATHVAR/Person_knows_Person.csv'       (DELIMITER '|', HEADER, FORMAT csv);
