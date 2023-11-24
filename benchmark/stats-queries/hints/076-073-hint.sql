SELECT /*+ FK(pl.PostId, p.Id),FK(pl.RelatedPostId, p.Id),FK(c.PostId, p.Id),FK(ph.PostId, p.Id),FK(v.PostId, p.Id) */  COUNT(*) FROM comments as c, posts as p, postLinks as pl, postHistory as ph, votes as v, badges as b WHERE p.Id = c.PostId AND p.Id = pl.RelatedPostId AND p.Id = ph.PostId AND p.Id = v.PostId AND b.UserId = c.UserId AND c.CreationDate>=CAST('2010-07-22 01:19:43' AS TIMESTAMP) AND p.Score>=-1 AND p.ViewCount>=0 AND p.CommentCount<=9 AND ph.CreationDate>=CAST('2010-09-20 17:45:15' AS TIMESTAMP) AND ph.CreationDate<=CAST('2014-08-07 01:00:45' AS TIMESTAMP) AND v.VoteTypeId=15;