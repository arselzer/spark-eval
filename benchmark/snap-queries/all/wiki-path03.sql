select count(*) from wiki p1, wiki p2, wiki p3, wiki p4 where p1.toNode = p2.fromNode AND p2.toNode = p3.fromNode AND p3.toNode = p4.fromNode
