-- Compound–binds–Gene–binds–Compound–treats–Disease

SELECT count(*)
FROM compound c1, binds b1, gene g, binds b2, compound c2, treats t, disease d
WHERE c1.nid = b1.sid AND b1.tid = g.nid
AND g.nid = b2.tid AND b2.sid = c2.nid
AND c2.nid = t.sid AND t.tid = d.nid