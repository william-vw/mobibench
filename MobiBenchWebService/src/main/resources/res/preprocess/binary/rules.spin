# cls-int1
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ?c .
} WHERE { 
	?c <http://www.w3.org/2002/07/owl#intersectionOf> ?l1 .
	?l1 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> ?c1 .
	?l1 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> ?l2 .
	?l2 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> ?c2 .
	?l2 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> <http://www.w3.org/1999/02/22-rdf-syntax-ns#nil> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ?c1 .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> ?c2 .
}

# prp-spo2
CONSTRUCT { 
	?u1 ?p ?u3 .
} WHERE { 
	?p <http://www.w3.org/2002/07/owl#propertyChainAxiom> ?l1 .
	?l1 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> ?p1 .
	?l1 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> ?l2 .
	?l2 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> ?p2 .
	?l2 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> <http://www.w3.org/1999/02/22-rdf-syntax-ns#nil> .
	?u1 ?p1 ?u2 .
	?u2 ?p2 ?u3 .
}