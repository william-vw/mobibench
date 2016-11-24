# cax-sco
CONSTRUCT {
    ?x a ?c2 .
}
WHERE {
    ?c1 <http://www.w3.org/2000/01/rdf-schema#subClassOf> ?c2 .
    ?x a ?c1 .
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