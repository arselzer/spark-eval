-- Compound–binds–Gene–interacts–Gene–interacts–Gene–associates–Disease

SELECT count(*)
FROM compound c, binds b, gene g1, interacts int1, gene g2, interacts int2, gene g3, associates a, disease d
WHERE c.nid = b.sid AND b.tid = g1.nid
AND g1.nid = int1.sid AND int1.tid = g2.nid
AND g2.nid = int2.tid AND int2.sid = g3.nid
AND g3.nid = a.tid AND a.sid = d.nid