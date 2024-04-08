-- Compound–upregulates–Gene–downregulates–Disease

SELECT count(*)
FROM compound c, upregulates up, gene g, downregulates down, disease d
WHERE c.nid = up.sid AND up.tid = g.nid
AND g.nid = down.tid AND down.sid = d.nid