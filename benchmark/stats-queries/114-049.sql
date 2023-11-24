SELECT COUNT(*) FROM comments as c, posts as p, votes as v, badges as b, users as u WHERE u.Id =c.UserId AND c.UserId = p.OwnerUserId AND p.OwnerUserId = v.UserId AND v.UserId = b.UserId AND c.Score=1 AND p.Score>=-1 AND p.Score<=29 AND p.CreationDate>=CAST('2010-07-19 20:40:36' AS TIMESTAMP) AND p.CreationDate<=CAST('2014-09-10 20:52:30' AS TIMESTAMP) AND v.BountyAmount<=50 AND b.Date<=CAST('2014-08-25 19:05:46' AS TIMESTAMP) AND u.DownVotes<=11 AND u.CreationDate>=CAST('2010-07-31 17:32:56' AS TIMESTAMP) AND u.CreationDate<=CAST('2014-09-07 16:06:26' AS TIMESTAMP);