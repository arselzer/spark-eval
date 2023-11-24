SELECT /*+ FK(b.UserId, u.Id),FK(v.UserId, u.Id) */  COUNT(*) FROM votes as v, badges as b, users as u WHERE u.Id = v.UserId AND v.UserId = b.UserId AND v.BountyAmount>=0 AND v.BountyAmount<=50 AND u.DownVotes=0;