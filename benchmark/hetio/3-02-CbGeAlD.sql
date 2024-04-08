-- Compound–binds–>Gene<–expresses–Anatomy<–localizes–Disease

SELECT count(*)
FROM compound c1, binds b1, gene g, expresses e, anatomy a, localizes l, disease d
WHERE c1.nid = b1.sid AND b1.tid = g.nid
AND g.nid = e.tid AND e.sid = a.nid
AND a.nid = l.tid AND l.sid = d.nid