SELECT /*+ FK(v.PostId, p.Id),FK(p.OwnerUserId, u.Id),FK(b.UserId, u.Id),FK(v.UserId, u.Id) */  COUNT(*) FROM votes as v, posts as p, badges as b, users as u WHERE u.Id = v.UserId AND u.Id = p.OwnerUserId AND u.Id = b.UserId AND v.CreationDate<=CAST('2014-09-06 00:00:00' AS TIMESTAMP) AND p.Score<=48 AND p.AnswerCount<=8 AND b.Date>=CAST('2011-01-03 20:50:19' AS TIMESTAMP) AND b.Date<=CAST('2014-09-02 15:35:07' AS TIMESTAMP) AND u.CreationDate>=CAST('2010-11-16 06:03:04' AS TIMESTAMP);