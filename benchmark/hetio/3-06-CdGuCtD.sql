-- Compound–downregulates–Gene–upregulates–Compound–treats–Disease

SELECT count(*)
FROM compound c1, downregulates d1, gene g, upregulates u2, compound c2, treats t, disease d
WHERE c1.nid = d1.sid AND d1.tid = g.nid
AND g.nid = u2.tid AND u2.sid = c2.nid
AND c2.nid = t.sid AND t.tid = d.nid