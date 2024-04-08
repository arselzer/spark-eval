-- Compound–treats–Disease–resembles–Disease

SELECT count(*)
FROM compound c, treats t, disease d1, resembles r, disease d2
WHERE c.nid = t.sid AND t.tid = d1.nid
AND d1.nid = r.sid AND r.tid = d2.nid