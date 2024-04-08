-- Compound–treats–Disease–upregulates–Gene–upregulates–Disease

SELECT count(*)
FROM compound c1, treats t, disease d1, upregulates up1, gene g, upregulates up2, disease d2
WHERE c1.nid = t.sid AND t.tid = d1.nid
AND d1.nid = up1.sid AND up1.tid = g.nid
AND g.nid = up2.sid AND up2.tid = d2.nid