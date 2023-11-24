SELECT /*+ FK(ph.PostId, p.Id),FK(p.OwnerUserId, u.Id),FK(ph.UserId, u.Id),FK(b.UserId, u.Id) */  COUNT(*) FROM postHistory as ph, posts as p, users as u, badges as b WHERE b.UserId = u.Id AND p.OwnerUserId = u.Id AND ph.UserId = u.Id AND ph.PostHistoryTypeId=2 AND ph.CreationDate>=CAST('2011-01-08 03:03:48' AS TIMESTAMP) AND ph.CreationDate<=CAST('2014-08-25 14:04:43' AS TIMESTAMP) AND p.AnswerCount<=4 AND p.CommentCount>=0 AND p.CommentCount<=12 AND p.FavoriteCount>=0 AND p.FavoriteCount<=89 AND p.CreationDate<=CAST('2014-09-02 10:21:04' AS TIMESTAMP) AND u.Reputation<=705 AND u.CreationDate>=CAST('2010-07-28 23:56:00' AS TIMESTAMP) AND u.CreationDate<=CAST('2014-09-02 10:04:41' AS TIMESTAMP) AND b.Date>=CAST('2010-07-20 20:47:27' AS TIMESTAMP) AND b.Date<=CAST('2014-09-09 13:24:28' AS TIMESTAMP);