SELECT /*+ FK(v.PostId, p.Id),FK(p.OwnerUserId, u.Id),FK(v.UserId, u.Id) */  COUNT(*) FROM votes as v, posts as p, users as u WHERE v.UserId = u.Id AND p.OwnerUserId = u.Id AND p.PostTypeId=2 AND p.CreationDate<=CAST('2014-08-26 22:40:26' AS TIMESTAMP) AND u.Views>=0;