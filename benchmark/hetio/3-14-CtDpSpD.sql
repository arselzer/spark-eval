-- Compound–treats–Disease–presents–Symptom–presents–Disease

SELECT count(*)
FROM compound c1, treats t, disease d1, presents p1, symptom s, presents p2, disease d2
WHERE c1.nid = t.sid AND t.tid = d1.nid
AND d1.nid = p1.sid AND p1.tid = s.nid
AND s.nid = p2.tid AND p2.sid = d2.nid