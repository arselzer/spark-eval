-- Compound–treats–Disease–localizes–Anatomy–localizes–Disease

SELECT count(*)
FROM compound c1, treats t, disease d1, localizes l1, anatomy a, localizes l2, disease d2
WHERE c1.nid = t.sid AND t.tid = d1.nid
AND d1.nid = l1.sid AND l1.tid = a.nid
AND a.nid = l2.tid AND l2.sid = d2.nid