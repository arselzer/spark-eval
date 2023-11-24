SELECT /*+ FK(pl.PostId, p.Id),FK(pl.RelatedPostId, p.Id),FK(p.OwnerUserId, u.Id),FK(b.UserId, u.Id) */  COUNT(*) FROM postLinks as pl, posts as p, users as u, badges as b WHERE p.Id = pl.RelatedPostId AND u.Id = p.OwnerUserId AND u.Id = b.UserId AND pl.CreationDate<=CAST('2014-08-17 01:23:50' AS TIMESTAMP) AND p.Score>=-1 AND p.Score<=10 AND p.AnswerCount<=5 AND p.CommentCount=2 AND p.FavoriteCount>=0 AND p.FavoriteCount<=6 AND u.Views<=33 AND u.DownVotes>=0 AND u.CreationDate>=CAST('2010-08-19 17:31:36' AS TIMESTAMP) AND u.CreationDate<=CAST('2014-08-06 07:23:12' AS TIMESTAMP) AND b.Date<=CAST('2014-09-10 22:50:06' AS TIMESTAMP);