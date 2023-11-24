SELECT /*+ FK(c.UserId, u.Id),FK(b.UserId, u.Id),FK(v.UserId, u.Id) */  COUNT(*) FROM comments as c, votes as v, badges as b, users as u WHERE u.Id = c.UserId AND u.Id = v.UserId AND u.Id = b.UserId AND c.Score=1 AND c.CreationDate>=CAST('2010-07-20 23:17:28' AS TIMESTAMP) AND u.CreationDate>=CAST('2010-07-20 01:27:29' AS TIMESTAMP);