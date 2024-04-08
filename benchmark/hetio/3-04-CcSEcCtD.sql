-- Compound–causes–Side Effect–causes–Compound–treats–Disease

SELECT count(*)
FROM compound c1, causes ca1, side_effect se, causes ca2, compound c2, treats t, disease d
WHERE c1.nid = ca1.sid AND ca1.tid = se.nid
AND se.nid = ca2.tid AND ca2.sid = c2.nid
AND c2.nid = t.sid AND t.tid = d.nid