SELECT /*+ FK(pl.PostId, p.Id),FK(pl.RelatedPostId, p.Id),FK(c.PostId, p.Id),FK(ph.PostId, p.Id),FK(v.PostId, p.Id),FK(p.OwnerUserId, u.Id),FK(c.UserId, u.Id),FK(ph.UserId, u.Id),FK(v.UserId, u.Id) */  COUNT(*) FROM comments as c, posts as p, postLinks as pl, postHistory as ph, votes as v, users as u WHERE p.Id = pl.PostId AND p.Id = ph.PostId AND p.Id = c.PostId AND u.Id = c.UserId AND u.Id = v.UserId AND c.CreationDate<=CAST('2014-09-11 13:24:22' AS TIMESTAMP) AND p.PostTypeId=1 AND p.Score=2 AND p.FavoriteCount<=12 AND pl.CreationDate>=CAST('2010-08-13 11:42:08' AS TIMESTAMP) AND pl.CreationDate<=CAST('2014-08-29 00:27:05' AS TIMESTAMP) AND ph.CreationDate>=CAST('2011-01-03 23:47:35' AS TIMESTAMP) AND ph.CreationDate<=CAST('2014-09-08 12:48:36' AS TIMESTAMP) AND v.CreationDate>=CAST('2010-07-27 00:00:00' AS TIMESTAMP) AND u.Reputation>=1 AND u.DownVotes>=0;