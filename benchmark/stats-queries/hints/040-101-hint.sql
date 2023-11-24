SELECT /*+ FK(c.PostId, p.Id),FK(v.PostId, p.Id),FK(p.OwnerUserId, u.Id),FK(c.UserId, u.Id),FK(v.UserId, u.Id) */  COUNT(*) FROM comments as c, posts as p, votes as v, users as u WHERE u.Id = p.OwnerUserId AND p.Id = v.PostId AND p.Id = c.PostId AND c.Score=0 AND c.CreationDate<=CAST('2014-09-10 02:47:53' AS TIMESTAMP) AND p.Score>=0 AND p.Score<=19 AND p.CommentCount<=10 AND p.CreationDate<=CAST('2014-08-28 13:31:33' AS TIMESTAMP) AND v.CreationDate<=CAST('2014-09-12 00:00:00' AS TIMESTAMP) AND u.DownVotes>=0;