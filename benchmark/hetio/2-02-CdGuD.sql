-- Compound–downregulates–Gene–upregulates–Disease

SELECT count(*)
FROM compound c, downregulates down, gene g, upregulates up, disease d
WHERE c.nid = down.sid AND down.tid = g.nid
AND g.nid = up.tid AND up.sid = d.nid