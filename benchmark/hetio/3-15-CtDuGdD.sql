-- Compound–treats–Disease–upregulates–Gene–downregulates–Disease

SELECT count(*)
FROM compound c1, treats t, disease d1, upregulates up1, gene g, downregulates down, disease d2
WHERE c1.nid = t.sid AND t.tid = d1.nid
AND d1.nid = up1.sid AND up1.tid = g.nid
AND g.nid = down.sid AND down.tid = d2.nid