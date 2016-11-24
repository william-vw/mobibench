# cls-oo
CONSTRUCT {
    ?yi a ?c .
}
WHERE {
    ?c <http://www.w3.org/2002/07/owl#oneOf> ?x .
    ?x <http://niche.cs.dal.ca/owl/list#hasMember> ?yi .
}

# scm-cls
CONSTRUCT {
    ?c <http://www.w3.org/2000/01/rdf-schema#subClassOf> ?c .
    ?c <http://www.w3.org/2002/07/owl#equivalentClass> ?c .
    ?c <http://www.w3.org/2000/01/rdf-schema#subClassOf> <http://www.w3.org/2002/07/owl#Thing> .
    <http://www.w3.org/2002/07/owl#Nothing> <http://www.w3.org/2000/01/rdf-schema#subClassOf> ?c .
}
WHERE {
    ?c a <http://www.w3.org/2002/07/owl#Class> .
}

# scm-sco
CONSTRUCT {
    ?c1 <http://www.w3.org/2000/01/rdf-schema#subClassOf> ?c3 .
}
WHERE {
    ?c1 <http://www.w3.org/2000/01/rdf-schema#subClassOf> ?c2 .
    ?c2 <http://www.w3.org/2000/01/rdf-schema#subClassOf> ?c3 .
}

# scm-eqc1
CONSTRUCT {
    ?c1 <http://www.w3.org/2000/01/rdf-schema#subClassOf> ?c2 .
    ?c2 <http://www.w3.org/2000/01/rdf-schema#subClassOf> ?c1 .
}
WHERE {
    ?c1 <http://www.w3.org/2002/07/owl#equivalentClass> ?c2 .
}

# scm-eqc2
CONSTRUCT {
    ?c1 <http://www.w3.org/2002/07/owl#equivalentClass> ?c2 .
}
WHERE {
    ?c1 <http://www.w3.org/2000/01/rdf-schema#subClassOf> ?c2 .
    ?c2 <http://www.w3.org/2000/01/rdf-schema#subClassOf> ?c1 .
}

# scm-op
CONSTRUCT {
    ?p <http://www.w3.org/2000/01/rdf-schema#subPropertyOf> ?p .
    ?p <http://www.w3.org/2002/07/owl#equivalentProperty> ?p .
}
WHERE {
    ?p a <http://www.w3.org/2002/07/owl#ObjectProperty> .
}

# scm-dp
CONSTRUCT {
    ?p <http://www.w3.org/2000/01/rdf-schema#subPropertyOf> ?p .
    ?p <http://www.w3.org/2002/07/owl#equivalentProperty> ?p .
}
WHERE {
    ?p a <http://www.w3.org/2002/07/owl#DatatypeProperty> .
}

# scm-spo
CONSTRUCT {
    ?p1 <http://www.w3.org/2000/01/rdf-schema#subPropertyOf> ?p3 .
}
WHERE {
    ?p1 <http://www.w3.org/2000/01/rdf-schema#subPropertyOf> ?p2 .
    ?p2 <http://www.w3.org/2000/01/rdf-schema#subPropertyOf> ?p3 .
}

# scm-eqp1
CONSTRUCT {
    ?p1 <http://www.w3.org/2000/01/rdf-schema#subPropertyOf> ?p2 .
    ?p2 <http://www.w3.org/2000/01/rdf-schema#subPropertyOf> ?p1 .
}
WHERE {
    ?p1 <http://www.w3.org/2002/07/owl#equivalentProperty> ?p2 .
}

# scm-eqp2
CONSTRUCT {
    ?p1 <http://www.w3.org/2002/07/owl#equivalentProperty> ?p2 .
}
WHERE {
    ?p1 <http://www.w3.org/2000/01/rdf-schema#subPropertyOf> ?p2 .
    ?p2 <http://www.w3.org/2000/01/rdf-schema#subPropertyOf> ?p1 .
}

# scm-dom1
CONSTRUCT {
    ?p <http://www.w3.org/2000/01/rdf-schema#domain> ?c2 .
}
WHERE {
    ?p <http://www.w3.org/2000/01/rdf-schema#domain> ?c1 .
    ?c1 <http://www.w3.org/2000/01/rdf-schema#subClassOf> ?c2 .
}

# scm-dom2
CONSTRUCT {
    ?p1 <http://www.w3.org/2000/01/rdf-schema#domain> ?c .
}
WHERE {
    ?p2 <http://www.w3.org/2000/01/rdf-schema#domain> ?c .
    ?p1 <http://www.w3.org/2000/01/rdf-schema#subPropertyOf> ?p2 .
}

# scm-rng1
CONSTRUCT {
    ?p <http://www.w3.org/2000/01/rdf-schema#range> ?c2 .
}
WHERE {
    ?p <http://www.w3.org/2000/01/rdf-schema#range> ?c1 .
    ?c1 <http://www.w3.org/2000/01/rdf-schema#subClassOf> ?c2 .
}

# scm-rng2
CONSTRUCT {
    ?p1 <http://www.w3.org/2000/01/rdf-schema#range> ?c .
}
WHERE {
    ?p2 <http://www.w3.org/2000/01/rdf-schema#range> ?c .
    ?p1 <http://www.w3.org/2000/01/rdf-schema#subPropertyOf> ?p2 .
}

# scm-hv
CONSTRUCT {
    ?c1 <http://www.w3.org/2000/01/rdf-schema#subClassOf> ?c2 .
}
WHERE {
    ?c1 <http://www.w3.org/2002/07/owl#hasValue> ?i .
    ?c1 <http://www.w3.org/2002/07/owl#onProperty> ?p1 .
    ?c2 <http://www.w3.org/2002/07/owl#hasValue> ?i .
    ?c2 <http://www.w3.org/2002/07/owl#onProperty> ?p2 .
    ?p1 <http://www.w3.org/2000/01/rdf-schema#subPropertyOf> ?p2 .
}

# scm-svf1
CONSTRUCT {
    ?c1 <http://www.w3.org/2000/01/rdf-schema#subClassOf> ?c2 .
}
WHERE {
    ?c1 <http://www.w3.org/2002/07/owl#someValuesFrom> ?y1 .
    ?c1 <http://www.w3.org/2002/07/owl#onProperty> ?p .
    ?c2 <http://www.w3.org/2002/07/owl#someValuesFrom> ?y2 .
    ?c2 <http://www.w3.org/2002/07/owl#onProperty> ?p .
    ?y1 <http://www.w3.org/2000/01/rdf-schema#subClassOf> ?y2 .
}

# scm-svf2
CONSTRUCT {
    ?c1 <http://www.w3.org/2000/01/rdf-schema#subClassOf> ?c2 .
}
WHERE {
    ?c1 <http://www.w3.org/2002/07/owl#someValuesFrom> ?y .
    ?c1 <http://www.w3.org/2002/07/owl#onProperty> ?p1 .
    ?c2 <http://www.w3.org/2002/07/owl#someValuesFrom> ?y .
    ?c2 <http://www.w3.org/2002/07/owl#onProperty> ?p2 .
    ?p1 <http://www.w3.org/2000/01/rdf-schema#subPropertyOf> ?p2 .
}

# scm-avf1
CONSTRUCT {
    ?c1 <http://www.w3.org/2000/01/rdf-schema#subClassOf> ?c2 .
}
WHERE {
    ?c1 <http://www.w3.org/2002/07/owl#allValuesFrom> ?y1 .
    ?c1 <http://www.w3.org/2002/07/owl#onProperty> ?p .
    ?c2 <http://www.w3.org/2002/07/owl#allValuesFrom> ?y2 .
    ?c2 <http://www.w3.org/2002/07/owl#onProperty> ?p .
    ?y1 <http://www.w3.org/2000/01/rdf-schema#subClassOf> ?y2 .
}

# scm-avf2
CONSTRUCT {
    ?c2 <http://www.w3.org/2000/01/rdf-schema#subClassOf> ?c1 .
}
WHERE {
    ?c1 <http://www.w3.org/2002/07/owl#allValuesFrom> ?y .
    ?c1 <http://www.w3.org/2002/07/owl#onProperty> ?p1 .
    ?c2 <http://www.w3.org/2002/07/owl#allValuesFrom> ?y .
    ?c2 <http://www.w3.org/2002/07/owl#onProperty> ?p2 .
    ?p1 <http://www.w3.org/2000/01/rdf-schema#subPropertyOf> ?p2 .
}

# scm-int
CONSTRUCT {
    ?c <http://www.w3.org/2000/01/rdf-schema#subClassOf> ?cl .
}
WHERE {
    ?c <http://www.w3.org/2002/07/owl#intersectionOf> ?x .
    ?x <http://niche.cs.dal.ca/owl/list#hasMember> ?cl .
}

# scm-uni
CONSTRUCT {
    ?cl <http://www.w3.org/2000/01/rdf-schema#subClassOf> ?c .
}
WHERE {
    ?c <http://www.w3.org/2002/07/owl#unionOf> ?x .
    ?x <http://niche.cs.dal.ca/owl/list#hasMember> ?cl .
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