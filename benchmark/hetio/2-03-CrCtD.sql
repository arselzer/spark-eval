-- Compound–resembles–Compound–treats–Disease

SELECT count(*)
FROM compound c1, resembles r, compound c2, treats t, disease d
WHERE c1.nid = r.sid AND r.tid = c2.nid
AND c2.nid = t.sid AND t.tid = d.nid