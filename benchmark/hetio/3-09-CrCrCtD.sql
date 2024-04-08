-- Compound–resembles–Compound–resembles–Compound–treats–Disease

SELECT count(*)
FROM compound c1, resembles r1, compound c2, resembles r2, compound c3, treats t, disease d
WHERE c1.nid = r1.sid AND r1.tid = c2.nid
AND c2.nid = r2.sid AND r2.tid = c3.nid
AND c3.nid = t.sid AND t.tid = d.nid