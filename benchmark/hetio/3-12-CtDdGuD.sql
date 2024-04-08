-- Compound–treats–Disease–downregulates–Gene–downregulates–Disease

SELECT count(*)
FROM compound c1, treats t, disease d1, downregulates down, gene g, upregulates up, disease d2
WHERE c1.nid = t.sid AND t.tid = d1.nid
AND d1.nid = down.sid AND down.tid = g.nid
AND g.nid = up.sid AND up.tid = d2.nid