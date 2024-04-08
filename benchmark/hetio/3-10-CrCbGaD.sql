-- Compound–resembles–Compound–binds–Gene–associates–Disease

SELECT count(*)
FROM compound c1, resembles r1, compound c2, binds b, gene g, associates a, disease d
WHERE c1.nid = r1.sid AND r1.tid = c2.nid
AND c2.nid = b.sid AND b.tid = g.nid
AND g.nid = a.tid AND a.sid = d.nid