SELECT /*+ FK(ph.PostId, p.Id),FK(p.OwnerUserId, u.Id),FK(ph.UserId, u.Id),FK(b.UserId, u.Id) */  COUNT(*) FROM postHistory as ph, posts as p, users as u, badges as b WHERE b.UserId = u.Id AND p.OwnerUserId = u.Id AND ph.UserId = u.Id AND ph.CreationDate>=CAST('2010-07-27 18:08:19' AS TIMESTAMP) AND ph.CreationDate<=CAST('2014-09-10 08:22:43' AS TIMESTAMP) AND p.PostTypeId=2;