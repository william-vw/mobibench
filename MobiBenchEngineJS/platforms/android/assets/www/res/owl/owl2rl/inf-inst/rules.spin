# eq-ref
CONSTRUCT {
    ?s <http://www.w3.org/2002/07/owl#sameAs> ?s .
    ?p <http://www.w3.org/2002/07/owl#sameAs> ?p .
    ?o <http://www.w3.org/2002/07/owl#sameAs> ?o .
}
WHERE {
    ?s ?p ?o .
}

# eq-sym
CONSTRUCT {
    ?y <http://www.w3.org/2002/07/owl#sameAs> ?x .
}
WHERE {
    ?x <http://www.w3.org/2002/07/owl#sameAs> ?y .
}

# eq-trans
CONSTRUCT {
    ?x <http://www.w3.org/2002/07/owl#sameAs> ?z .
}
WHERE {
    ?x <http://www.w3.org/2002/07/owl#sameAs> ?y .
    ?y <http://www.w3.org/2002/07/owl#sameAs> ?z .
}

# eq-rep-s
CONSTRUCT {
    ?s2 ?p ?o .
}
WHERE {
    ?s <http://www.w3.org/2002/07/owl#sameAs> ?s2 .
    ?s ?p ?o .
}

# eq-rep-p
CONSTRUCT {
    ?s ?p2 ?o .
}
WHERE {
    ?p <http://www.w3.org/2002/07/owl#sameAs> ?p2 .
    ?s ?p ?o .
}

# eq-rep-o
CONSTRUCT {
    ?s ?p ?o2 .
}
WHERE {
    ?o <http://www.w3.org/2002/07/owl#sameAs> ?o2 .
    ?s ?p ?o .
}

# prp-dom
CONSTRUCT {
    ?x a ?c .
}
WHERE {
    ?p <http://www.w3.org/2000/01/rdf-schema#domain> ?c .
    ?x ?p ?y .
}

# prp-rng
CONSTRUCT {
    ?y a ?c .
}
WHERE {
    ?p <http://www.w3.org/2000/01/rdf-schema#range> ?c .
    ?x ?p ?y .
}

# prp-fp
CONSTRUCT {
    ?y1 <http://www.w3.org/2002/07/owl#sameAs> ?y2 .
}
WHERE {
    ?p a <http://www.w3.org/2002/07/owl#FunctionalProperty> .
    ?x ?p ?y1 .
    ?x ?p ?y2 .
    FILTER (?y1 != ?y2) .
}

# prp-ifp
CONSTRUCT {
    ?x1 <http://www.w3.org/2002/07/owl#sameAs> ?x2 .
}
WHERE {
    ?p a <http://www.w3.org/2002/07/owl#InverseFunctionalProperty> .
    ?x1 ?p ?y .
    ?x2 ?p ?y .
    FILTER (?x1 != ?x2) .
}

# prp-symp
CONSTRUCT {
    ?y ?p ?x .
}
WHERE {
    ?p a <http://www.w3.org/2002/07/owl#SymmetricProperty> .
    ?x ?p ?y .
}

# prp-trp
CONSTRUCT {
    ?x ?p ?z .
}
WHERE {
    ?p a <http://www.w3.org/2002/07/owl#TransitiveProperty> .
    ?x ?p ?y .
    ?y ?p ?z .
}

# prp-spo1
CONSTRUCT {
    ?x ?p2 ?y .
}
WHERE {
    ?p1 <http://www.w3.org/2000/01/rdf-schema#subPropertyOf> ?p2 .
    ?x ?p1 ?y .
}

# prp-eqp1
CONSTRUCT {
    ?x ?p2 ?y .
}
WHERE {
    ?p1 <http://www.w3.org/2002/07/owl#equivalentProperty> ?p2 .
    ?x ?p1 ?y .
}

# prp-eqp2
CONSTRUCT {
    ?x ?p1 ?y .
}
WHERE {
    ?p1 <http://www.w3.org/2002/07/owl#equivalentProperty> ?p2 .
    ?x ?p2 ?y .
}

# prp-inv1
CONSTRUCT {
    ?y ?p2 ?x .
}
WHERE {
    ?p1 <http://www.w3.org/2002/07/owl#inverseOf> ?p2 .
    ?x ?p1 ?y .
}

# prp-inv2
CONSTRUCT {
    ?y ?p1 ?x .
}
WHERE {
    ?p1 <http://www.w3.org/2002/07/owl#inverseOf> ?p2 .
    ?x ?p2 ?y .
}

# cls-int2
CONSTRUCT {
    ?y a ?ci .
}
WHERE {
    ?c <http://www.w3.org/2002/07/owl#intersectionOf> ?x .
    ?x <http://niche.cs.dal.ca/owl/list#hasMember> ?ci .
    ?y a ?c .
}

# cls-uni
CONSTRUCT {
    ?y a ?c .
}
WHERE {
    ?c <http://www.w3.org/2002/07/owl#unionOf> ?x .
    ?x <http://niche.cs.dal.ca/owl/list#hasMember> ?ci .
    ?y a ?ci .
}

# cls-svf1
CONSTRUCT {
    ?u a ?x .
}
WHERE {
    ?x <http://www.w3.org/2002/07/owl#someValuesFrom> ?y .
    ?x <http://www.w3.org/2002/07/owl#onProperty> ?p .
    ?u ?p ?v .
    ?v a ?y .
}

# cls-svf2
CONSTRUCT {
    ?u a ?x .
}
WHERE {
    ?x <http://www.w3.org/2002/07/owl#someValuesFrom> <http://www.w3.org/2002/07/owl#Thing> .
    ?x <http://www.w3.org/2002/07/owl#onProperty> ?p .
    ?u ?p ?v .
}

# cls-avf
CONSTRUCT {
    ?v a ?y .
}
WHERE {
    ?x <http://www.w3.org/2002/07/owl#allValuesFrom> ?y .
    ?x <http://www.w3.org/2002/07/owl#onProperty> ?p .
    ?u a ?x .
    ?u ?p ?v .
}

# cls-hv1
CONSTRUCT {
    ?u ?p ?y .
}
WHERE {
    ?x <http://www.w3.org/2002/07/owl#hasValue> ?y .
    ?x <http://www.w3.org/2002/07/owl#onProperty> ?p .
    ?u a ?x .
}

# cls-hv2
CONSTRUCT {
    ?u a ?x .
}
WHERE {
    ?x <http://www.w3.org/2002/07/owl#hasValue> ?y .
    ?x <http://www.w3.org/2002/07/owl#onProperty> ?p .
    ?u ?p ?y .
}

# cls-maxc2
CONSTRUCT {
    ?y1 <http://www.w3.org/2002/07/owl#sameAs> ?y2 .
}
WHERE {
    ?x <http://www.w3.org/2002/07/owl#maxCardinality> "1"^^<http://www.w3.org/2001/XMLSchema#nonNegativeInteger> .
    ?x <http://www.w3.org/2002/07/owl#onProperty> ?p .
    ?u a ?x .
    ?u ?p ?y1 .
    ?u ?p ?y2 .
    FILTER(?y1 != ?y2)
}

# cls-maxqc3
CONSTRUCT {
    ?y1 <http://www.w3.org/2002/07/owl#sameAs> ?y2 .
}
WHERE {
    ?x <http://www.w3.org/2002/07/owl#maxQualifiedCardinality> "1"^^<http://www.w3.org/2001/XMLSchema#nonNegativeInteger> .
    ?x <http://www.w3.org/2002/07/owl#onProperty> ?p .
    ?x <http://www.w3.org/2002/07/owl#onClass> ?c .
    ?u a ?x .
    ?u ?p ?y1 .
    ?u ?p ?y2 .
    FILTER(?y1 != ?y2)
    ?y1 a ?c .
    ?y2 a ?c .
}

# cls-maxqc4
CONSTRUCT {
    ?y1 <http://www.w3.org/2002/07/owl#sameAs> ?y2 .
}
WHERE {
    ?x <http://www.w3.org/2002/07/owl#maxQualifiedCardinality> "1"^^<http://www.w3.org/2001/XMLSchema#nonNegativeInteger> .
    ?x <http://www.w3.org/2002/07/owl#onProperty> ?p .
    ?x <http://www.w3.org/2002/07/owl#onClass> <http://www.w3.org/2002/07/owl#Thing> .
    ?u a ?x .
    ?u ?p ?y1 .
    ?u ?p ?y2 .
    FILTER(?y1 != ?y2)
}

# cax-sco
CONSTRUCT {
    ?x a ?c2 .
}
WHERE {
    ?c1 <http://www.w3.org/2000/01/rdf-schema#subClassOf> ?c2 .
    ?x a ?c1 .
}

# cax-eqc1
CONSTRUCT {
    ?x a ?c2 .
}
WHERE {
    ?c1 <http://www.w3.org/2002/07/owl#equivalentClass> ?c2 .
    ?x a ?c1 .
}

# cax-eqc2
CONSTRUCT {
    ?x a ?c1 .
}
WHERE {
    ?c1 <http://www.w3.org/2002/07/owl#equivalentClass> ?c2 .
    ?x a ?c2 .
}

# li-mem1
CONSTRUCT {
	?l <http://niche.cs.dal.ca/owl/list#hasMember> ?m .
} WHERE {
	?l <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> ?m .
}

# li-mem2
CONSTRUCT {
	?l1 <http://niche.cs.dal.ca/owl/list#hasMember> ?m .
} 
WHERE {
	?l1 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> ?l2 .
	?l2 <http://niche.cs.dal.ca/owl/list#hasMember> ?m .
}