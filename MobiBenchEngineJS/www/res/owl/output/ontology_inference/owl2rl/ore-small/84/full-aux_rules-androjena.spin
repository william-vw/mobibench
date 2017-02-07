# cls-int1_1
CONSTRUCT {
	?y <http://niche.cs.dal.ca/owl/reasoning/inIntersection> ?l .
} WHERE {
	?l <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> ?c .
	?l <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> <http://www.w3.org/1999/02/22-rdf-syntax-ns#nil> .
	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ?c .
}

# cls-int1_2
CONSTRUCT {
	?y <http://niche.cs.dal.ca/owl/reasoning/inIntersection> ?l .
} WHERE {
	?l <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> ?c .
	?l <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> ?l2 .
	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ?c .
	?y <http://niche.cs.dal.ca/owl/reasoning/inIntersection> ?l2 .
}

# cls-int1_3
CONSTRUCT {
	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ?x .
} WHERE {
	?x <http://www.w3.org/2002/07/owl#intersectionOf> ?l .
	?y <http://niche.cs.dal.ca/owl/reasoning/inIntersection> ?l .
}

# prp-key_1
CONSTRUCT {
	?x <http://niche.cs.dal.ca/owl/reasoning/inKeyList> ?l .
	?y <http://niche.cs.dal.ca/owl/reasoning/inKeyList> ?l .
} WHERE {
	?l <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> ?p .
	?l <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> <http://www.w3.org/1999/02/22-rdf-syntax-ns#nil> .
	?x ?p ?z .
	?y ?p ?z .
}

# prp-key_2
CONSTRUCT {
	?x <http://niche.cs.dal.ca/owl/reasoning/inKeyList> ?l .
	?y <http://niche.cs.dal.ca/owl/reasoning/inKeyList> ?l .
} WHERE {
	?l <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> ?p .
	?l <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> ?l2 .
	?x ?p ?z .
	?y ?p ?z .
	?x <http://niche.cs.dal.ca/owl/reasoning/inKeyList> ?l2 .
	?y <http://niche.cs.dal.ca/owl/reasoning/inKeyList> ?l2 .
}

# prp-key_3
CONSTRUCT {
	?x <http://www.w3.org/2002/07/owl#sameAs> ?y .
} WHERE {
	?c <http://www.w3.org/2002/07/owl#hasKey> ?l .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ?c .
	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ?c .
	?x <http://niche.cs.dal.ca/owl/reasoning/inKeyList> ?l .
	?y <http://niche.cs.dal.ca/owl/reasoning/inKeyList> ?l .
}

# prp-spo2_1
CONSTRUCT {
	?u1 <http://niche.cs.dal.ca/owl/reasoning/inPropertyChain> ?l .
	?u1 <http://niche.cs.dal.ca/owl/reasoning/lastChained> ?u2 .
} WHERE {
	?l <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> ?p .
	?l <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> <http://www.w3.org/1999/02/22-rdf-syntax-ns#nil> .
	?u1 ?p ?u2 .
}

# prp-spo2_2
CONSTRUCT {
	?u1 <http://niche.cs.dal.ca/owl/reasoning/inPropertyChain> ?l .
	?u1 <http://niche.cs.dal.ca/owl/reasoning/lastChained> ?ul .
} WHERE {
	?l <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> ?p .
	?l <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> ?l2 .
	?u1 ?p ?u2 .
	?u2 <http://niche.cs.dal.ca/owl/reasoning/inPropertyChain> ?l2 .
	?u2 <http://niche.cs.dal.ca/owl/reasoning/lastChained> ?ul .
}

# prp-spo2_3
CONSTRUCT {
	?uf ?p ?ul .
} WHERE {
	?p <http://www.w3.org/2002/07/owl#propertyChainAxiom> ?l .
	?uf <http://niche.cs.dal.ca/owl/reasoning/inPropertyChain> ?l .
	?uf <http://niche.cs.dal.ca/owl/reasoning/lastChained> ?ul .
}