-- Compound–binds–Gene–interacts–Gene–interacts–Gene–associates–Disease

SELECT count(*)
FROM compound c, binds b, gene g1, participates part1, pathway path, participates part2, gene g2, associates a, disease d
WHERE c.nid = b.sid AND b.tid = g1.nid
AND g1.nid = part1.sid AND part1.tid = path.nid
AND path.nid = part2.tid AND part2.sid = g2.nid
AND g2.nid = a.tid AND a.sid = d.nid