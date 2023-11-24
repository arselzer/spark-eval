SELECT /*+ FK(v.PostId, p.Id),FK(p.OwnerUserId, u.Id),FK(b.UserId, u.Id),FK(v.UserId, u.Id) */  COUNT(*) FROM votes as v, posts as p, badges as b, users as u WHERE u.Id = b.UserId AND u.Id = p.OwnerUserId AND u.Id = v.UserId AND p.PostTypeId=1 AND p.CommentCount>=0 AND p.CommentCount<=15 AND u.Reputation>=1 AND u.DownVotes>=0 AND u.DownVotes<=1;