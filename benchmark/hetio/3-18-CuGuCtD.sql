-- Compound–upregulates–Gene–upregulates–Compound–treats–Disease

SELECT count(*)
FROM compound c1, upregulates up1, gene g, upregulates up2, compound c2, treats treats, disease d
WHERE c1.nid = up1.sid AND up1.tid = g.nid
AND g.nid = up2.tid AND up2.sid = c2.nid
AND c2.nid = treats.sid AND treats.tid = d.nid