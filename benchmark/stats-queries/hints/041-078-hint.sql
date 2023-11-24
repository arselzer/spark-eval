SELECT /*+ FK(c.PostId, p.Id),FK(ph.PostId, p.Id),FK(v.PostId, p.Id),FK(p.OwnerUserId, u.Id),FK(c.UserId, u.Id),FK(ph.UserId, u.Id),FK(b.UserId, u.Id),FK(v.UserId, u.Id) */  COUNT(*) FROM comments as c, posts as p, postHistory as ph, votes as v, badges as b, users as u WHERE u.Id = p.OwnerUserId AND u.Id = b.UserId AND p.Id = c.PostId AND p.Id = ph.PostId AND p.Id = v.PostId AND p.PostTypeId=1 AND p.CommentCount>=0 AND p.CommentCount<=12 AND p.FavoriteCount>=0 AND v.BountyAmount<=50;