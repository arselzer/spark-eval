-- Compound–treats–Disease–downregulates–Gene–downregulates–Disease

SELECT count(*)
FROM compound c1, treats t, disease d1, downregulates down1, gene g, downregulates down2, disease d2
WHERE c1.nid = t.sid AND t.tid = d1.nid
AND d1.nid = down1.sid AND down1.tid = g.nid
AND g.nid = down2.sid AND down2.tid = d2.nid