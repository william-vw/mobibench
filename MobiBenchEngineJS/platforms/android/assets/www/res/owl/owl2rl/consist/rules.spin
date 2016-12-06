# eq-diff1
CONSTRUCT {
    <http://spinrdf.org/spin#constraintViolation_differentFrom> a <http://spinrdf.org/spin#ConstraintViolation> .
    <http://spinrdf.org/spin#constraintViolation_differentFrom> <http://spinrdf.org/spin#violationRoot> ?x .
    <http://spinrdf.org/spin#constraintViolation_differentFrom> <http://spinrdf.org/spin#violationPath> <http://www.w3.org/2002/07/owl#sameAs> .
    <http://spinrdf.org/spin#constraintViolation_differentFrom> <http://www.w3.org/2000/01/rdf-schema#label> "Violates <http://www.w3.org/2002/07/owl#differentFrom>" .
}
WHERE {
    ?x <http://www.w3.org/2002/07/owl#sameAs> ?y .
    ?x <http://www.w3.org/2002/07/owl#differentFrom> ?y .
}

# eq-diff2
CONSTRUCT {
    <http://spinrdf.org/spin#constraintViolation_allDifferent> a <http://spinrdf.org/spin#ConstraintViolation> .
    <http://spinrdf.org/spin#constraintViolation_allDifferent> <http://spinrdf.org/spin#violationRoot> ?y1 .
    <http://spinrdf.org/spin#constraintViolation_allDifferent> <http://spinrdf.org/spin#violationPath> <http://www.w3.org/2002/07/owl#members> .
    <http://spinrdf.org/spin#constraintViolation_allDifferent> <http://www.w3.org/2000/01/rdf-schema#label> "Violation of <http://www.w3.org/2002/07/owl#AllDifferent>" .
}
WHERE {
    ?x a <http://www.w3.org/2002/07/owl#AllDifferent> .
    ?x <http://www.w3.org/2002/07/owl#members> ?list .
    ?list <http://niche.cs.dal.ca/owl/list#hasMember> ?y1 .
    ?list <http://niche.cs.dal.ca/owl/list#hasMember> ?y2 .
    FILTER (?y1 != ?y2) .
    ?y1 <http://www.w3.org/2002/07/owl#sameAs> ?y2 .
}

# eq-diff3
CONSTRUCT {
    <http://spinrdf.org/spin#constraintViolation_allDifferent> a <http://spinrdf.org/spin#ConstraintViolation> .
    <http://spinrdf.org/spin#constraintViolation_allDifferent> <http://spinrdf.org/spin#violationRoot> ?y1 .
    <http://spinrdf.org/spin#constraintViolation_allDifferent> <http://spinrdf.org/spin#violationPath> <http://www.w3.org/2002/07/owl#distinctMembers> .
    <http://spinrdf.org/spin#constraintViolation_allDifferent> <http://www.w3.org/2000/01/rdf-schema#label> "Violation of <http://www.w3.org/2002/07/owl#AllDifferent>" .
}
WHERE {
    ?x a <http://www.w3.org/2002/07/owl#AllDifferent> .
    ?x <http://www.w3.org/2002/07/owl#distinctMembers> ?list .
    ?list <http://niche.cs.dal.ca/owl/list#hasMember> ?y1 .
    ?list <http://niche.cs.dal.ca/owl/list#hasMember> ?y2 .
    FILTER (?y1 != ?y2) .
    ?y1 <http://www.w3.org/2002/07/owl#sameAs> ?y2 .
}

# prp-irp
CONSTRUCT {
    <http://spinrdf.org/spin#constraintViolation_irreflexiveProperty> a <http://spinrdf.org/spin#ConstraintViolation> .
    <http://spinrdf.org/spin#constraintViolation_irreflexiveProperty> <http://spinrdf.org/spin#violationRoot> ?x .
    <http://spinrdf.org/spin#constraintViolation_irreflexiveProperty> <http://spinrdf.org/spin#violationPath> ?p .
    <http://spinrdf.org/spin#constraintViolation_irreflexiveProperty> <http://www.w3.org/2000/01/rdf-schema#label> "Irreflexive property" .
}
WHERE {
    ?p a <http://www.w3.org/2002/07/owl#IrreflexiveProperty> .
    ?x ?p ?x .
}

# prp-asyp
CONSTRUCT {
    <http://spinrdf.org/spin#constraintViolation_asymmetricProperty> a <http://spinrdf.org/spin#ConstraintViolation> .
    <http://spinrdf.org/spin#constraintViolation_asymmetricProperty> <http://spinrdf.org/spin#violationRoot> ?x .
    <http://spinrdf.org/spin#constraintViolation_asymmetricProperty> <http://spinrdf.org/spin#violationPath> ?p .
    <http://spinrdf.org/spin#constraintViolation_asymmetricProperty> <http://www.w3.org/2000/01/rdf-schema#label> "Asymmetric property" .
}
WHERE {
    ?p a <http://www.w3.org/2002/07/owl#AsymmetricProperty> .
    ?x ?p ?y .
    ?y ?p ?x .
}

# prp-pdw
CONSTRUCT {
    <http://spinrdf.org/spin#constraintViolation_propertyDisjointWith> a <http://spinrdf.org/spin#ConstraintViolation> .
    <http://spinrdf.org/spin#constraintViolation_propertyDisjointWith> <http://spinrdf.org/spin#violationRoot> ?x .
    <http://spinrdf.org/spin#constraintViolation_propertyDisjointWith> <http://spinrdf.org/spin#violationPath> ?p1 .
    <http://spinrdf.org/spin#constraintViolation_propertyDisjointWith> <http://www.w3.org/2000/01/rdf-schema#label> "Property declared disjoint with" .
}
WHERE {
    ?p1 <http://www.w3.org/2002/07/owl#propertyDisjointWith> ?p2 .
    ?x ?p1 ?y .
    ?x ?p2 ?y .
}

# prp-adp
CONSTRUCT {
    <http://spinrdf.org/spin#constraintViolation_allDisjointProperties> a <http://spinrdf.org/spin#ConstraintViolation> .
    <http://spinrdf.org/spin#constraintViolation_allDisjointProperties> <http://spinrdf.org/spin#violationRoot> ?x .
    <http://spinrdf.org/spin#constraintViolation_allDisjointProperties> <http://spinrdf.org/spin#violationPath> ?p1 .
    <http://spinrdf.org/spin#constraintViolation_allDisjointProperties> <http://www.w3.org/2000/01/rdf-schema#label> "Violation of <http://www.w3.org/2002/07/owl#AllDisjointProperties>" .
}
WHERE {
    ?z a <http://www.w3.org/2002/07/owl#AllDisjointProperties> .
    ?z <http://www.w3.org/2002/07/owl#members> ?members .
    ?members <http://niche.cs.dal.ca/owl/list#hasMember> ?p1 .
    ?members <http://niche.cs.dal.ca/owl/list#hasMember> ?p2 .
    FILTER (?p1 != ?p2) .
    ?x ?p1 ?y .
    ?x ?p2 ?y .
}

# prp-npa1
CONSTRUCT {
    <http://spinrdf.org/spin#constraintViolation_negativePropertyAssertion> a <http://spinrdf.org/spin#ConstraintViolation> .
    <http://spinrdf.org/spin#constraintViolation_negativePropertyAssertion> <http://spinrdf.org/spin#violationRoot> ?i1 .
    <http://spinrdf.org/spin#constraintViolation_negativePropertyAssertion> <http://spinrdf.org/spin#violationPath> ?p .
    <http://spinrdf.org/spin#constraintViolation_negativePropertyAssertion> <http://www.w3.org/2000/01/rdf-schema#label> "Negative Property Assertion" .
}
WHERE {
    ?x <http://www.w3.org/2002/07/owl#sourceIndividual> ?i1 .
    ?x <http://www.w3.org/2002/07/owl#assertionProperty> ?p .
    ?x <http://www.w3.org/2002/07/owl#targetIndividual> ?i2 .
    ?i1 ?p ?i2 .
}

# prp-npa2
CONSTRUCT {
    <http://spinrdf.org/spin#constraintViolation_negativePropertyAssertion> a <http://spinrdf.org/spin#ConstraintViolation> .
    <http://spinrdf.org/spin#constraintViolation_negativePropertyAssertion> <http://spinrdf.org/spin#violationRoot> ?i .
    <http://spinrdf.org/spin#constraintViolation_negativePropertyAssertion> <http://spinrdf.org/spin#violationPath> ?p .
    <http://spinrdf.org/spin#constraintViolation_negativePropertyAssertion> <http://www.w3.org/2000/01/rdf-schema#label> "Negative Property Assertion" .
}
WHERE {
    ?x <http://www.w3.org/2002/07/owl#sourceIndividual> ?i .
    ?x <http://www.w3.org/2002/07/owl#assertionProperty> ?p .
    ?x <http://www.w3.org/2002/07/owl#targetValue> ?lt .
    ?i ?p ?lt .
}

# cls-nothing2
CONSTRUCT {
	<http://spinrdf.org/spin#constraintViolation_nothingType> a <http://spinrdf.org/spin#ConstraintViolation> .
    <http://spinrdf.org/spin#constraintViolation_nothingType> <http://spinrdf.org/spin#violationRoot> ?x .
    <http://spinrdf.org/spin#constraintViolation_nothingType> <http://www.w3.org/2000/01/rdf-schema#label> "Resource with type Nothing" .
}
WHERE {
	?x a <http://www.w3.org/2002/07/owl#Nothing> .
}

# cls-com
CONSTRUCT {
    <http://spinrdf.org/spin#constraintViolation_disjointClass> a <http://spinrdf.org/spin#ConstraintViolation> .
    <http://spinrdf.org/spin#constraintViolation_disjointClass> <http://spinrdf.org/spin#violationRoot> ?x .
    <http://spinrdf.org/spin#constraintViolation_disjointClass> <http://spinrdf.org/spin#violationPath> <http://www.w3.org/2002/07/owl#complementOf> .
    <http://spinrdf.org/spin#constraintViolation_disjointClass> <http://www.w3.org/2000/01/rdf-schema#label> "Resource is instance of two disjoint classes" .
}
WHERE {
    ?c1 <http://www.w3.org/2002/07/owl#complementOf> ?c2 .
    ?x a ?c1 .
    ?x a ?c2 .
}

# cls-maxc1
CONSTRUCT {
    <http://spinrdf.org/spin#constraintViolation_maxCardinality0> a <http://spinrdf.org/spin#ConstraintViolation> .
    <http://spinrdf.org/spin#constraintViolation_maxCardinality0> <http://spinrdf.org/spin#violationRoot> ?x .
    <http://spinrdf.org/spin#constraintViolation_maxCardinality0> <http://spinrdf.org/spin#violationPath> ?p .
    <http://spinrdf.org/spin#constraintViolation_maxCardinality0> <http://www.w3.org/2000/01/rdf-schema#label> "<http://www.w3.org/2002/07/owl#maxCardinality> of 0" .
}
WHERE {
    ?x <http://www.w3.org/2002/07/owl#maxCardinality> "0"^^<http://www.w3.org/2001/XMLSchema#nonNegativeInteger> .
    ?x <http://www.w3.org/2002/07/owl#onProperty> ?p .
    ?u a ?x .
    ?u ?p ?y .
}

# cls-maxqc1
CONSTRUCT {
    <http://spinrdf.org/spin#constraintViolation_maxQualifiedCardinality0> a <http://spinrdf.org/spin#ConstraintViolation> .
    <http://spinrdf.org/spin#constraintViolation_maxQualifiedCardinality0> <http://spinrdf.org/spin#violationRoot> ?x .
    <http://spinrdf.org/spin#constraintViolation_maxQualifiedCardinality0> <http://spinrdf.org/spin#violationPath> ?p .
    <http://spinrdf.org/spin#constraintViolation_maxQualifiedCardinality0> <http://www.w3.org/2000/01/rdf-schema#label> "Maximum qualified cardinality of 0" .
}
WHERE {
    ?x <http://www.w3.org/2002/07/owl#maxQualifiedCardinality> "0"^^<http://www.w3.org/2001/XMLSchema#nonNegativeInteger> .
    ?x <http://www.w3.org/2002/07/owl#onProperty> ?p .
    ?x <http://www.w3.org/2002/07/owl#onClass> ?c .
    ?u a ?x .
    ?u ?p ?y .
    ?y a ?c .
}

# cls-maxqc2
CONSTRUCT {
    <http://spinrdf.org/spin#constraintViolation_maxQualifiedCardinality0Thing> a <http://spinrdf.org/spin#ConstraintViolation> .
    <http://spinrdf.org/spin#constraintViolation_maxQualifiedCardinality0Thing> <http://spinrdf.org/spin#violationRoot> ?u .
    <http://spinrdf.org/spin#constraintViolation_maxQualifiedCardinality0Thing> <http://spinrdf.org/spin#violationPath> ?p .
    <http://spinrdf.org/spin#constraintViolation_maxQualifiedCardinality0Thing> <http://www.w3.org/2000/01/rdf-schema#label> "Qualified max cardinality 0" .
}
WHERE {
    ?x <http://www.w3.org/2002/07/owl#maxQualifiedCardinality> "0"^^<http://www.w3.org/2001/XMLSchema#nonNegativeInteger> .
    ?x <http://www.w3.org/2002/07/owl#onProperty> ?p .
    ?x <http://www.w3.org/2002/07/owl#onClass> <http://www.w3.org/2002/07/owl#Thing> .
    ?u a ?x .
    ?u ?p ?y .
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

# cax-adc
CONSTRUCT {
    <http://spinrdf.org/spin#constraintViolation_allDisjointClasses> a <http://spinrdf.org/spin#ConstraintViolation> .
    <http://spinrdf.org/spin#constraintViolation_allDisjointClasses> <http://spinrdf.org/spin#violationRoot> ?x .
    <http://spinrdf.org/spin#constraintViolation_allDisjointClasses> <http://www.w3.org/2000/01/rdf-schema#label> "Shared instance of classes from an AllDisjointClasses block" .
}
WHERE {
    ?y a <http://www.w3.org/2002/07/owl#AllDisjointClasses> .
    ?y <http://www.w3.org/2002/07/owl#members> ?members .
    ?members <http://niche.cs.dal.ca/owl/list#hasMember> ?c1 .
    ?members <http://niche.cs.dal.ca/owl/list#hasMember> ?c2 .
    FILTER (?c1 != ?c2) .
    ?x a ?c1 .
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