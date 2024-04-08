-- Compound–downregulates–Gene–downregulates–Compound–treats–Disease

SELECT count(*)
FROM compound c1, downregulates d1, gene g, downregulates d2, compound c2, treats t, disease d
WHERE c1.nid = d1.sid AND d1.tid = g.nid
AND g.nid = d2.tid AND d2.sid = c2.nid
AND c2.nid = t.sid AND t.tid = d.nid