-- Compound–binds–Gene–associates–Disease

SELECT count(*)
FROM compound c, binds b, gene g, associates a, disease d
WHERE c.nid = b.sid AND b.tid = g.nid
AND g.nid = a.tid AND a.sid = d.nid