-- Compound–palliates–Disease–palliates–Compound–treats–Disease

SELECT count(*)
FROM compound c1, palliates p1, disease d1, palliates p2, compound c2, treats t, disease d2
WHERE c1.nid = p1.sid AND p1.tid = d1.nid
AND d1.nid = p2.tid AND p2.sid = c2.nid
AND c2.nid = t.sid AND t.tid = d2.nid