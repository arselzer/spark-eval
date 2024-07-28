#!/bin/bash

curl --header "Content-Type: application/json" \
	--user neo4j:neo4jneo4j   \
	--request POST   \
	--data '{"cypher":"MATCH (n1:Dblp)-[c:CONNECTED]-(n2:Dblp) RETURN n1, c, n2"}'   http://localhost:7474/rdf/neo4j/cypher > dblp.ttl


curl --header "Content-Type: application/json" \
	--user neo4j:neo4jneo4j   \
	--request POST   \
	--data '{"cypher":"MATCH (n1:Google)-[c:CONNECTED]-(n2:Google) RETURN n1, c, n2"}'   http://localhost:7474/rdf/neo4j/cypher > google.ttl
