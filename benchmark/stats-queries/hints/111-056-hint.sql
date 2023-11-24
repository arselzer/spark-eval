SELECT /*+ FK(t.ExcerptPostId, p.Id),FK(v.PostId, p.Id),FK(p.OwnerUserId, u.Id),FK(b.UserId, u.Id),FK(v.UserId, u.Id) */  COUNT(*) FROM tags as t, posts as p, users as u, votes as v, badges as b WHERE p.Id = t.ExcerptPostId AND u.Id = v.UserId AND u.Id = b.UserId AND u.Id = p.OwnerUserId AND u.DownVotes>=0;