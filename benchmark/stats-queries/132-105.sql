SELECT COUNT(*) FROM comments as c, postHistory as ph, votes as v, users as u WHERE v.UserId = u.Id AND c.UserId = u.Id AND ph.UserId = u.Id AND c.Score=0 AND c.CreationDate>=CAST('2010-07-19 19:56:21' AS TIMESTAMP) AND c.CreationDate<=CAST('2014-09-11 13:36:12' AS TIMESTAMP) AND u.Views<=433 AND u.DownVotes>=0 AND u.CreationDate<=CAST('2014-09-12 21:37:39' AS TIMESTAMP);