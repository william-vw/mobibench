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

# prp-inv2
CONSTRUCT {
    ?y ?p1 ?x .
}
WHERE {
    ?p1 <http://www.w3.org/2002/07/owl#inverseOf> ?p2 .
    ?x ?p2 ?y .
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

# cax-dw
CONSTRUCT {
    <http://spinrdf.org/spin#constraintViolation_disjointClass> a <http://spinrdf.org/spin#ConstraintViolation> .
    <http://spinrdf.org/spin#constraintViolation_disjointClass> <http://spinrdf.org/spin#violationRoot> ?x .
    <http://spinrdf.org/spin#constraintViolation_disjointClass> <http://spinrdf.org/spin#violationPath> <http://www.w3.org/2002/07/owl#disjointWith> .
    <http://spinrdf.org/spin#constraintViolation_disjointClass> <http://www.w3.org/2000/01/rdf-schema#label> "Resource is instance of two disjoint classes" .
}
WHERE {
    ?c1 <http://www.w3.org/2002/07/owl#disjointWith> ?c2 .
    ?x a ?c1 .
    ?x a ?c2 .
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