SELECT /*+ FK(ph.PostId, p.Id),FK(v.PostId, p.Id),FK(p.OwnerUserId, u.Id),FK(ph.UserId, u.Id),FK(v.UserId, u.Id) */  COUNT(*) FROM postHistory as ph, posts as p, votes as v, users as u WHERE u.Id = p.OwnerUserId AND p.Id = ph.PostId AND p.Id = v.PostId AND ph.CreationDate<=CAST('2014-07-28 13:25:35' AS TIMESTAMP) AND p.PostTypeId=1 AND p.AnswerCount>=0 AND p.AnswerCount<=4 AND v.CreationDate>=CAST('2010-07-20 00:00:00' AS TIMESTAMP) AND v.CreationDate<=CAST('2014-09-03 00:00:00' AS TIMESTAMP) AND u.DownVotes=0 AND u.CreationDate<=CAST('2014-08-08 07:03:29' AS TIMESTAMP);