SELECT /*+ FK(v.PostId, p.Id),FK(p.OwnerUserId, u.Id),FK(v.UserId, u.Id) */  COUNT(*) FROM votes as v, posts as p, users as u WHERE v.UserId = p.OwnerUserId AND p.OwnerUserId = u.Id AND p.CommentCount>=0 AND p.CommentCount<=12 AND u.CreationDate>=CAST('2010-07-22 04:38:06' AS TIMESTAMP) AND u.CreationDate<=CAST('2014-09-08 15:55:02' AS TIMESTAMP);