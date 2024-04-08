-- Compound–upregulates–Gene–downregulates–Compound–treats–Disease

SELECT count(*)
FROM compound c1, upregulates up1, gene g, downregulates down, compound c2, treats treats, disease d
WHERE c1.nid = up1.sid AND up1.tid = g.nid
AND g.nid = down.tid AND down.sid = c2.nid
AND c2.nid = treats.sid AND treats.tid = d.nid