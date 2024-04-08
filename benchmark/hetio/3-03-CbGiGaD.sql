-- Compound–binds–Gene–interacts–Gene–associates–Disease

SELECT count(*)
FROM compound c1, binds b1, gene g1, interacts i, gene g2, associates a, disease d
WHERE c1.nid = b1.sid AND b1.tid = g1.nid
AND g1.nid = i.sid AND i.tid = g2.nid
AND g2.nid = a.tid AND a.sid = d.nid