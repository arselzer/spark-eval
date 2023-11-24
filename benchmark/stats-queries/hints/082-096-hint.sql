SELECT /*+ FK(c.PostId, p.Id),FK(ph.PostId, p.Id),FK(v.PostId, p.Id) */  COUNT(*) FROM comments as c, postHistory as ph, votes as v, posts as p WHERE ph.PostId = p.Id AND c.PostId = p.Id AND v.PostId = p.Id AND c.Score=0 AND c.CreationDate>=CAST('2010-08-26 06:55:11' AS TIMESTAMP) AND ph.CreationDate<=CAST('2014-09-05 06:39:25' AS TIMESTAMP) AND v.VoteTypeId=2;