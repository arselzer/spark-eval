-- Compound–includes–Pharmacologic Class–includes–Compound–treats–Disease

SELECT count(*)
FROM compound c1, includes i1, pharmacologic_class pc, includes i2, compound c2, treats t, disease d
WHERE c1.nid = i1.tid AND i2.sid = pc.nid
AND pc.nid = i2.sid AND i2.tid = c2.nid
AND c2.nid = t.sid AND t.tid = d.nid