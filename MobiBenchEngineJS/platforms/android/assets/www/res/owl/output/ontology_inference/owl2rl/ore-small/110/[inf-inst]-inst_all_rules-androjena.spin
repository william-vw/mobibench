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

# prp-dom-0
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#region> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#physical-region> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#abstract> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#physical-endurant> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#endurant> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .	?x <http://www.w3.org/2002/07/owl#generic-location-of> ?y .	?x <http://www.w3.org/2002/07/owl#mediated-relation-i> ?y .	?x <http://www.w3.org/2002/07/owl#exact-location-of> ?y .	?y <http://www.w3.org/2002/07/owl#physical-location> ?x .} WHERE {
	?x <http://www.w3.org/2002/07/owl#physical-location-of> ?y .
}

# prp-dom-1
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?x <http://www.w3.org/2002/07/owl#immediate-relation> ?y .	?y <http://www.w3.org/2002/07/owl#specifically-constantly-dependent-on> ?x .} WHERE {
	?x <http://www.w3.org/2002/07/owl#specific-constant-dependent> ?y .
}

# prp-dom-2
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?x <http://www.w3.org/2002/07/owl#mediated-relation> ?y .	?y <http://www.w3.org/2002/07/owl#generic-location-of> ?x .} WHERE {
	?x <http://www.w3.org/2002/07/owl#generic-location> ?y .
}

# prp-dom-3
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#abstract> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#region> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#region> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#abstract> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?x <http://www.w3.org/2002/07/owl#immediate-relation-i> ?y .	?y <http://www.w3.org/2002/07/owl#r-location> ?x .} WHERE {
	?x <http://www.w3.org/2002/07/owl#r-location-of> ?y .
}

# prp-dom-4
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#endurant> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#perdurant> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?x <http://www.w3.org/2002/07/owl#immediate-relation-i> ?y .	?y <http://www.w3.org/2002/07/owl#participant> ?x .} WHERE {
	?x <http://www.w3.org/2002/07/owl#participant-in> ?y .
}

# prp-dom-5
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?x <http://www.w3.org/2002/07/owl#part> ?y .	?x <http://www.w3.org/2002/07/owl#immediate-relation> ?y .	?y <http://www.w3.org/2002/07/owl#atomic-part-of> ?x .} WHERE {
	?x <http://www.w3.org/2002/07/owl#atomic-part> ?y .
}

# prp-dom-6
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#perdurant> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#endurant> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .	?x <http://www.w3.org/2002/07/owl#immediate-relation> ?y .	?x <http://www.w3.org/2002/07/owl#temporary-participant> ?y .	?x <http://www.w3.org/2002/07/owl#participant> ?y .	?y <http://www.w3.org/2002/07/owl#total-temporary-participant-in> ?x .} WHERE {
	?x <http://www.w3.org/2002/07/owl#total-temporary-participant> ?y .
}

# prp-dom-7
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#endurant> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#perdurant> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .	?x <http://www.w3.org/2002/07/owl#immediate-relation-i> ?y .	?x <http://www.w3.org/2002/07/owl#participant-in> ?y .	?x <http://www.w3.org/2002/07/owl#constant-participant-in> ?y .	?y <http://www.w3.org/2002/07/owl#life-of> ?x .} WHERE {
	?x <http://www.w3.org/2002/07/owl#life> ?y .
}

# prp-dom-8
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?x <http://www.w3.org/2002/07/owl#immediate-relation-i> ?y .	?y <http://www.w3.org/2002/07/owl#generic-dependent> ?x .} WHERE {
	?x <http://www.w3.org/2002/07/owl#generically-dependent-on> ?y .
}

# prp-dom-9
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?x <http://www.w3.org/2002/07/owl#immediate-relation-i> ?y .	?y <http://www.w3.org/2002/07/owl#part> ?x .} WHERE {
	?x <http://www.w3.org/2002/07/owl#part-of> ?y .
}

# prp-dom-10
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#endurant> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#endurant> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?x <http://www.w3.org/2002/07/owl#partly-compresent> ?y .	?x <http://www.w3.org/2002/07/owl#mediated-relation> ?y .	?x <http://www.w3.org/2002/07/owl#part> ?y .	?x <http://www.w3.org/2002/07/owl#immediate-relation> ?y .	?y <http://www.w3.org/2002/07/owl#temporary-part-of> ?x .} WHERE {
	?x <http://www.w3.org/2002/07/owl#temporary-part> ?y .
}

# prp-dom-12
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/2002/07/owl#strong-connection> ?x .	?x <http://www.w3.org/2002/07/owl#mediated-relation> ?y .} WHERE {
	?x <http://www.w3.org/2002/07/owl#strong-connection> ?y .
}

# prp-dom-13
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#endurant> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#endurant> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?x <http://www.w3.org/2002/07/owl#temporary-part> ?y .	?x <http://www.w3.org/2002/07/owl#proper-part> ?y .	?x <http://www.w3.org/2002/07/owl#mediated-relation> ?y .	?x <http://www.w3.org/2002/07/owl#immediate-relation> ?y .	?x <http://www.w3.org/2002/07/owl#part> ?y .	?x <http://www.w3.org/2002/07/owl#partly-compresent> ?y .	?y <http://www.w3.org/2002/07/owl#temporary-proper-part-of> ?x .} WHERE {
	?x <http://www.w3.org/2002/07/owl#temporary-proper-part> ?y .
}

# prp-dom-14
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#perdurant> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#endurant> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?x <http://www.w3.org/2002/07/owl#constant-participant> ?y .	?x <http://www.w3.org/2002/07/owl#participant> ?y .	?x <http://www.w3.org/2002/07/owl#immediate-relation> ?y .	?y <http://www.w3.org/2002/07/owl#total-constant-participant-in> ?x .} WHERE {
	?x <http://www.w3.org/2002/07/owl#total-constant-participant> ?y .
}

# prp-dom-16
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#endurant> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#endurant> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .	?x <http://www.w3.org/2002/07/owl#temporary-proper-part> ?y .	?x <http://www.w3.org/2002/07/owl#part> ?y .	?x <http://www.w3.org/2002/07/owl#immediate-relation> ?y .	?x <http://www.w3.org/2002/07/owl#mediated-relation> ?y .	?x <http://www.w3.org/2002/07/owl#partly-compresent> ?y .	?x <http://www.w3.org/2002/07/owl#proper-part> ?y .	?x <http://www.w3.org/2002/07/owl#temporary-part> ?y .	?y <http://www.w3.org/2002/07/owl#temporary-atomic-part-of> ?x .} WHERE {
	?x <http://www.w3.org/2002/07/owl#temporary-atomic-part> ?y .
}

# prp-dom-17
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#endurant> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#endurant> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .	?x <http://www.w3.org/2002/07/owl#partly-compresent> ?y .	?x <http://www.w3.org/2002/07/owl#temporary-part-of> ?y .	?x <http://www.w3.org/2002/07/owl#immediate-relation-i> ?y .	?x <http://www.w3.org/2002/07/owl#part-of> ?y .	?x <http://www.w3.org/2002/07/owl#proper-part-of> ?y .	?x <http://www.w3.org/2002/07/owl#mediated-relation> ?y .	?y <http://www.w3.org/2002/07/owl#temporary-proper-part> ?x .} WHERE {
	?x <http://www.w3.org/2002/07/owl#temporary-proper-part-of> ?y .
}

# prp-dom-18
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#physical-quality> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#quality> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#time-interval> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#region> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#temporal-region> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#abstract> .	?x <http://www.w3.org/2002/07/owl#mediated-relation> ?y .	?y <http://www.w3.org/2002/07/owl#time-of-q-presence-of> ?x .} WHERE {
	?x <http://www.w3.org/2002/07/owl#q-present-at> ?y .
}

# prp-dom-19
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/2002/07/owl#immediate-relation> ?x .} WHERE {
	?x <http://www.w3.org/2002/07/owl#immediate-relation-i> ?y .
}

# prp-dom-20
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#endurant> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#perdurant> .	?x <http://www.w3.org/2002/07/owl#participant-in> ?y .	?x <http://www.w3.org/2002/07/owl#immediate-relation-i> ?y .	?x <http://www.w3.org/2002/07/owl#constant-participant-in> ?y .	?y <http://www.w3.org/2002/07/owl#total-constant-participant> ?x .} WHERE {
	?x <http://www.w3.org/2002/07/owl#total-constant-participant-in> ?y .
}

# prp-dom-21
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#physical-region> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#region> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#space-region> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-region> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#abstract> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?x <http://www.w3.org/2002/07/owl#mediated-relation-i> ?y .	?x <http://www.w3.org/2002/07/owl#exact-location-of> ?y .	?x <http://www.w3.org/2002/07/owl#generic-location-of> ?y .	?y <http://www.w3.org/2002/07/owl#spatio-temporally-present-at> ?x .} WHERE {
	?x <http://www.w3.org/2002/07/owl#spatio-temporal-presence-of> ?y .
}

# prp-dom-22
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?x <http://www.w3.org/2002/07/owl#part> ?y .	?x <http://www.w3.org/2002/07/owl#immediate-relation> ?y .	?y <http://www.w3.org/2002/07/owl#proper-part-of> ?x .} WHERE {
	?x <http://www.w3.org/2002/07/owl#proper-part> ?y .
}

# prp-dom-23
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#perdurant> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#endurant> .	?x <http://www.w3.org/2002/07/owl#immediate-relation> ?y .	?y <http://www.w3.org/2002/07/owl#participant-in> ?x .} WHERE {
	?x <http://www.w3.org/2002/07/owl#participant> ?y .
}

# prp-dom-24
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#endurant> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#endurant> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?x <http://www.w3.org/2002/07/owl#partly-compresent> ?y .	?x <http://www.w3.org/2002/07/owl#part-of> ?y .	?x <http://www.w3.org/2002/07/owl#mediated-relation> ?y .	?x <http://www.w3.org/2002/07/owl#immediate-relation-i> ?y .	?y <http://www.w3.org/2002/07/owl#temporary-part> ?x .} WHERE {
	?x <http://www.w3.org/2002/07/owl#temporary-part-of> ?y .
}

# prp-dom-25
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/2002/07/owl#partly-compresent> ?x .	?x <http://www.w3.org/2002/07/owl#mediated-relation> ?y .} WHERE {
	?x <http://www.w3.org/2002/07/owl#partly-compresent> ?y .
}

# prp-dom-27
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#quality> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?x <http://www.w3.org/2002/07/owl#immediate-relation-i> ?y .	?y <http://www.w3.org/2002/07/owl#inherent-in> ?x .} WHERE {
	?x <http://www.w3.org/2002/07/owl#has-quality> ?y .
}

# prp-dom-28
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#quality> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?x <http://www.w3.org/2002/07/owl#immediate-relation> ?y .	?y <http://www.w3.org/2002/07/owl#has-quality> ?x .} WHERE {
	?x <http://www.w3.org/2002/07/owl#inherent-in> ?y .
}

# prp-dom-29
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?x <http://www.w3.org/2002/07/owl#immediate-relation> ?y .	?y <http://www.w3.org/2002/07/owl#weak-connection> ?x .} WHERE {
	?x <http://www.w3.org/2002/07/owl#weak-connection> ?y .
}

# prp-dom-32
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?x <http://www.w3.org/2002/07/owl#immediate-relation> ?y .	?y <http://www.w3.org/2002/07/owl#generic-constituent-of> ?x .} WHERE {
	?x <http://www.w3.org/2002/07/owl#generic-constituent> ?y .
}

# prp-dom-33
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#quality> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#abstract> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#region> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?x <http://www.w3.org/2002/07/owl#immediate-relation> ?y .	?y <http://www.w3.org/2002/07/owl#q-location-of> ?x .} WHERE {
	?x <http://www.w3.org/2002/07/owl#q-location> ?y .
}

# prp-dom-34
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/2002/07/owl#sibling-part> ?x .	?x <http://www.w3.org/2002/07/owl#mediated-relation> ?y .} WHERE {
	?x <http://www.w3.org/2002/07/owl#sibling-part> ?y .
}

# prp-dom-35
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#feature> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#physical-endurant> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#endurant> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#endurant> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#physical-endurant> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?x <http://www.w3.org/2002/07/owl#immediate-relation-i> ?y .	?x <http://www.w3.org/2002/07/owl#specifically-constantly-dependent-on> ?y .	?y <http://www.w3.org/2002/07/owl#host-of> ?x .} WHERE {
	?x <http://www.w3.org/2002/07/owl#host> ?y .
}

# prp-dom-36
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#endurant> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#perdurant> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?x <http://www.w3.org/2002/07/owl#participant-in> ?y .	?x <http://www.w3.org/2002/07/owl#immediate-relation-i> ?y .	?y <http://www.w3.org/2002/07/owl#constant-participant> ?x .} WHERE {
	?x <http://www.w3.org/2002/07/owl#constant-participant-in> ?y .
}

# prp-dom-37
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?x <http://www.w3.org/2002/07/owl#immediate-relation> ?y .	?y <http://www.w3.org/2002/07/owl#part-of> ?x .} WHERE {
	?x <http://www.w3.org/2002/07/owl#part> ?y .
}

# prp-dom-39
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?x <http://www.w3.org/2002/07/owl#immediate-relation-i> ?y .	?y <http://www.w3.org/2002/07/owl#specific-constant-constituent> ?x .} WHERE {
	?x <http://www.w3.org/2002/07/owl#specific-constant-constituent-of> ?y .
}

# prp-dom-40
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#region> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#abstract> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?x <http://www.w3.org/2002/07/owl#generic-location> ?y .	?x <http://www.w3.org/2002/07/owl#mediated-relation> ?y .	?y <http://www.w3.org/2002/07/owl#exact-location-of> ?x .} WHERE {
	?x <http://www.w3.org/2002/07/owl#exact-location> ?y .
}

# prp-dom-41
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#perdurant> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#endurant> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?x <http://www.w3.org/2002/07/owl#immediate-relation> ?y .	?x <http://www.w3.org/2002/07/owl#participant> ?y .	?y <http://www.w3.org/2002/07/owl#constant-participant-in> ?x .} WHERE {
	?x <http://www.w3.org/2002/07/owl#constant-participant> ?y .
}

# prp-dom-43
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#endurant> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#endurant> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/2002/07/owl#mereologically-coincides> ?x .	?x <http://www.w3.org/2002/07/owl#temporary-part> ?y .	?x <http://www.w3.org/2002/07/owl#immediate-relation> ?y .	?x <http://www.w3.org/2002/07/owl#partly-compresent> ?y .	?x <http://www.w3.org/2002/07/owl#part> ?y .	?x <http://www.w3.org/2002/07/owl#mediated-relation> ?y .} WHERE {
	?x <http://www.w3.org/2002/07/owl#mereologically-coincides> ?y .
}

# prp-dom-44
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#endurant> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#physical-endurant> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#physical-endurant> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#endurant> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#feature> .	?x <http://www.w3.org/2002/07/owl#specific-constant-dependent> ?y .	?x <http://www.w3.org/2002/07/owl#immediate-relation> ?y .	?y <http://www.w3.org/2002/07/owl#host> ?x .} WHERE {
	?x <http://www.w3.org/2002/07/owl#host-of> ?y .
}

# prp-dom-45
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?x <http://www.w3.org/2002/07/owl#immediate-relation> ?y .	?y <http://www.w3.org/2002/07/owl#generically-dependent-on> ?x .} WHERE {
	?x <http://www.w3.org/2002/07/owl#generic-dependent> ?y .
}

# prp-dom-50
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#region> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#time-interval> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#temporal-region> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#abstract> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#physical-quality> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#quality> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .	?x <http://www.w3.org/2002/07/owl#mediated-relation-i> ?y .	?y <http://www.w3.org/2002/07/owl#q-present-at> ?x .} WHERE {
	?x <http://www.w3.org/2002/07/owl#time-of-q-presence-of> ?y .
}

# prp-dom-51
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#quale> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#region> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#abstract> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#quality> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?x <http://www.w3.org/2002/07/owl#q-location-of> ?y .	?x <http://www.w3.org/2002/07/owl#immediate-relation-i> ?y .	?y <http://www.w3.org/2002/07/owl#has-quale> ?x .} WHERE {
	?x <http://www.w3.org/2002/07/owl#quale-of> ?y .
}

# prp-dom-52
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?x <http://www.w3.org/2002/07/owl#mediated-relation-i> ?y .	?y <http://www.w3.org/2002/07/owl#generic-location> ?x .} WHERE {
	?x <http://www.w3.org/2002/07/owl#generic-location-of> ?y .
}

# prp-dom-57
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?x <http://www.w3.org/2002/07/owl#part-of> ?y .	?x <http://www.w3.org/2002/07/owl#immediate-relation-i> ?y .	?y <http://www.w3.org/2002/07/owl#atomic-part> ?x .} WHERE {
	?x <http://www.w3.org/2002/07/owl#atomic-part-of> ?y .
}

# prp-dom-61
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#perdurant> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#endurant> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .	?x <http://www.w3.org/2002/07/owl#immediate-relation> ?y .	?x <http://www.w3.org/2002/07/owl#participant> ?y .	?x <http://www.w3.org/2002/07/owl#constant-participant> ?y .	?y <http://www.w3.org/2002/07/owl#life> ?x .} WHERE {
	?x <http://www.w3.org/2002/07/owl#life-of> ?y .
}

# prp-dom-64
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/2002/07/owl#identity-c> ?x .	?x <http://www.w3.org/2002/07/owl#immediate-relation> ?y .} WHERE {
	?x <http://www.w3.org/2002/07/owl#identity-c> ?y .
}

# prp-dom-66
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#region> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#abstract> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#abstract> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#region> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?x <http://www.w3.org/2002/07/owl#immediate-relation> ?y .	?y <http://www.w3.org/2002/07/owl#r-location-of> ?x .} WHERE {
	?x <http://www.w3.org/2002/07/owl#r-location> ?y .
}

# prp-dom-67
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#endurant> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#perdurant> .	?x <http://www.w3.org/2002/07/owl#temporary-participant-in> ?y .	?x <http://www.w3.org/2002/07/owl#immediate-relation-i> ?y .	?x <http://www.w3.org/2002/07/owl#participant-in> ?y .	?y <http://www.w3.org/2002/07/owl#total-temporary-participant> ?x .} WHERE {
	?x <http://www.w3.org/2002/07/owl#total-temporary-participant-in> ?y .
}

# prp-dom-68
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#endurant> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#physical-endurant> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#physical-region> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#region> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#abstract> .	?x <http://www.w3.org/2002/07/owl#exact-location> ?y .	?x <http://www.w3.org/2002/07/owl#mediated-relation> ?y .	?x <http://www.w3.org/2002/07/owl#generic-location> ?y .	?y <http://www.w3.org/2002/07/owl#physical-location-of> ?x .} WHERE {
	?x <http://www.w3.org/2002/07/owl#physical-location> ?y .
}

# prp-dom-69
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?x <http://www.w3.org/2002/07/owl#part-of> ?y .	?x <http://www.w3.org/2002/07/owl#immediate-relation-i> ?y .	?y <http://www.w3.org/2002/07/owl#proper-part> ?x .} WHERE {
	?x <http://www.w3.org/2002/07/owl#proper-part-of> ?y .
}

# prp-dom-72
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?x <http://www.w3.org/2002/07/owl#immediate-relation> ?y .	?y <http://www.w3.org/2002/07/owl#specific-constant-constituent-of> ?x .} WHERE {
	?x <http://www.w3.org/2002/07/owl#specific-constant-constituent> ?y .
}

# prp-dom-76
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/2002/07/owl#immediate-relation-i> ?x .} WHERE {
	?x <http://www.w3.org/2002/07/owl#immediate-relation> ?y .
}

# prp-dom-77
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/2002/07/owl#overlaps> ?x .	?x <http://www.w3.org/2002/07/owl#mediated-relation> ?y .} WHERE {
	?x <http://www.w3.org/2002/07/owl#overlaps> ?y .
}

# prp-dom-78
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#endurant> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#perdurant> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .	?x <http://www.w3.org/2002/07/owl#immediate-relation-i> ?y .	?x <http://www.w3.org/2002/07/owl#participant-in> ?y .	?y <http://www.w3.org/2002/07/owl#temporary-participant> ?x .} WHERE {
	?x <http://www.w3.org/2002/07/owl#temporary-participant-in> ?y .
}

# prp-dom-79
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?x <http://www.w3.org/2002/07/owl#proper-part-of> ?y .	?x <http://www.w3.org/2002/07/owl#immediate-relation-i> ?y .	?x <http://www.w3.org/2002/07/owl#part-of> ?y .	?y <http://www.w3.org/2002/07/owl#boundary> ?x .} WHERE {
	?x <http://www.w3.org/2002/07/owl#boundary-of> ?y .
}

# prp-dom-84
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#quality> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?x <http://www.w3.org/2002/07/owl#inherent-in> ?y .	?x <http://www.w3.org/2002/07/owl#immediate-relation> ?y .	?y <http://www.w3.org/2002/07/owl#has-t-quality> ?x .} WHERE {
	?x <http://www.w3.org/2002/07/owl#t-inherent-in> ?y .
}

# prp-dom-93
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#abstract> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#region> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#abstract-region> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#non-physical-endurant> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#endurant> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?x <http://www.w3.org/2002/07/owl#generic-location-of> ?y .	?x <http://www.w3.org/2002/07/owl#mediated-relation-i> ?y .	?x <http://www.w3.org/2002/07/owl#exact-location-of> ?y .	?y <http://www.w3.org/2002/07/owl#abstract-location> ?x .} WHERE {
	?x <http://www.w3.org/2002/07/owl#abstract-location-of> ?y .
}

# prp-dom-94
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#non-physical-endurant> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#endurant> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#abstract-region> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#region> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#abstract> .	?x <http://www.w3.org/2002/07/owl#generic-location> ?y .	?x <http://www.w3.org/2002/07/owl#exact-location> ?y .	?x <http://www.w3.org/2002/07/owl#mediated-relation> ?y .	?y <http://www.w3.org/2002/07/owl#abstract-location-of> ?x .} WHERE {
	?x <http://www.w3.org/2002/07/owl#abstract-location> ?y .
}

# prp-dom-97
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#endurant> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#endurant> .	?x <http://www.w3.org/2002/07/owl#part-of> ?y .	?x <http://www.w3.org/2002/07/owl#proper-part-of> ?y .	?x <http://www.w3.org/2002/07/owl#temporary-proper-part-of> ?y .	?x <http://www.w3.org/2002/07/owl#partly-compresent> ?y .	?x <http://www.w3.org/2002/07/owl#temporary-part-of> ?y .	?x <http://www.w3.org/2002/07/owl#immediate-relation-i> ?y .	?x <http://www.w3.org/2002/07/owl#mediated-relation> ?y .	?y <http://www.w3.org/2002/07/owl#temporary-atomic-part> ?x .} WHERE {
	?x <http://www.w3.org/2002/07/owl#temporary-atomic-part-of> ?y .
}

# prp-dom-98
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/2002/07/owl#identity-n> ?x .	?x <http://www.w3.org/2002/07/owl#immediate-relation> ?y .} WHERE {
	?x <http://www.w3.org/2002/07/owl#identity-n> ?y .
}

# prp-dom-102
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#quality> .	?x <http://www.w3.org/2002/07/owl#immediate-relation-i> ?y .	?x <http://www.w3.org/2002/07/owl#has-quality> ?y .	?y <http://www.w3.org/2002/07/owl#t-inherent-in> ?x .} WHERE {
	?x <http://www.w3.org/2002/07/owl#has-t-quality> ?y .
}

# prp-dom-114
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#perdurant> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#endurant> .	?x <http://www.w3.org/2002/07/owl#immediate-relation> ?y .	?x <http://www.w3.org/2002/07/owl#participant> ?y .	?y <http://www.w3.org/2002/07/owl#temporary-participant-in> ?x .} WHERE {
	?x <http://www.w3.org/2002/07/owl#temporary-participant> ?y .
}

# prp-dom-121
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#abstract> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#region> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?x <http://www.w3.org/2002/07/owl#generic-location-of> ?y .	?x <http://www.w3.org/2002/07/owl#mediated-relation-i> ?y .	?y <http://www.w3.org/2002/07/owl#exact-location> ?x .} WHERE {
	?x <http://www.w3.org/2002/07/owl#exact-location-of> ?y .
}

# prp-dom-123
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?x <http://www.w3.org/2002/07/owl#immediate-relation-i> ?y .	?y <http://www.w3.org/2002/07/owl#specific-constant-dependent> ?x .} WHERE {
	?x <http://www.w3.org/2002/07/owl#specifically-constantly-dependent-on> ?y .
}

# prp-dom-125
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?x <http://www.w3.org/2002/07/owl#immediate-relation> ?y .	?x <http://www.w3.org/2002/07/owl#proper-part> ?y .	?x <http://www.w3.org/2002/07/owl#part> ?y .	?y <http://www.w3.org/2002/07/owl#boundary-of> ?x .} WHERE {
	?x <http://www.w3.org/2002/07/owl#boundary> ?y .
}

# prp-dom-129
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/2002/07/owl#mediated-relation-i> ?x .} WHERE {
	?x <http://www.w3.org/2002/07/owl#mediated-relation> ?y .
}

# prp-dom-135
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-region> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#region> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#abstract> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#space-region> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#physical-region> .	?x <http://www.w3.org/2002/07/owl#generic-location> ?y .	?x <http://www.w3.org/2002/07/owl#mediated-relation> ?y .	?x <http://www.w3.org/2002/07/owl#exact-location> ?y .	?y <http://www.w3.org/2002/07/owl#spatio-temporal-presence-of> ?x .} WHERE {
	?x <http://www.w3.org/2002/07/owl#spatio-temporally-present-at> ?y .
}

# prp-dom-140
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/2002/07/owl#mediated-relation> ?x .} WHERE {
	?x <http://www.w3.org/2002/07/owl#mediated-relation-i> ?y .
}

# prp-dom-151
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?x <http://www.w3.org/2002/07/owl#immediate-relation-i> ?y .	?y <http://www.w3.org/2002/07/owl#generic-constituent> ?x .} WHERE {
	?x <http://www.w3.org/2002/07/owl#generic-constituent-of> ?y .
}

# prp-dom-154
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#quality> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#quale> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#abstract> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#region> .	?x <http://www.w3.org/2002/07/owl#immediate-relation> ?y .	?x <http://www.w3.org/2002/07/owl#q-location> ?y .	?y <http://www.w3.org/2002/07/owl#quale-of> ?x .} WHERE {
	?x <http://www.w3.org/2002/07/owl#has-quale> ?y .
}

# prp-dom-164
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#region> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#abstract> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#quality> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?y <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?x <http://www.w3.org/2002/07/owl#immediate-relation-i> ?y .	?y <http://www.w3.org/2002/07/owl#q-location> ?x .} WHERE {
	?x <http://www.w3.org/2002/07/owl#q-location-of> ?y .
}

# prp-trp-0
CONSTRUCT {
	?x <http://www.w3.org/2002/07/owl#part> ?z .
} WHERE {
	?x <http://www.w3.org/2002/07/owl#part> ?y .
	?y <http://www.w3.org/2002/07/owl#part> ?z .
}

# prp-trp-1
CONSTRUCT {
	?x <http://www.w3.org/2002/07/owl#proper-part> ?z .
} WHERE {
	?x <http://www.w3.org/2002/07/owl#proper-part> ?y .
	?y <http://www.w3.org/2002/07/owl#proper-part> ?z .
}

# prp-trp-2
CONSTRUCT {
	?x <http://www.w3.org/2002/07/owl#proper-part-of> ?z .
} WHERE {
	?x <http://www.w3.org/2002/07/owl#proper-part-of> ?y .
	?y <http://www.w3.org/2002/07/owl#proper-part-of> ?z .
}

# prp-trp-3
CONSTRUCT {
	?x <http://www.w3.org/2002/07/owl#part-of> ?z .
} WHERE {
	?x <http://www.w3.org/2002/07/owl#part-of> ?y .
	?y <http://www.w3.org/2002/07/owl#part-of> ?z .
}

# prp-trp-4
CONSTRUCT {
	?x <http://www.w3.org/2002/07/owl#identity-n> ?z .
} WHERE {
	?x <http://www.w3.org/2002/07/owl#identity-n> ?y .
	?y <http://www.w3.org/2002/07/owl#identity-n> ?z .
}

# prp-trp-5
CONSTRUCT {
	?x <http://www.w3.org/2002/07/owl#identity-c> ?z .
} WHERE {
	?x <http://www.w3.org/2002/07/owl#identity-c> ?y .
	?y <http://www.w3.org/2002/07/owl#identity-c> ?z .
}

# cax-sco-0
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#physical-endurant> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#feature> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#endurant> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .} WHERE {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#dependent-place> .
}

# cax-sco-1
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .
} WHERE {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .
}

# cax-sco-2
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#abstract> .} WHERE {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#set> .
}

# cax-sco-3
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#perdurant> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .} WHERE {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#stative> .
}

# cax-sco-4
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#achievement> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#perdurant> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#physical-quality> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#non-physical-object> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#temporal-quality> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#endurant> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#feature> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#amount-of-matter> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#space-region> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#physical-endurant> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#abstract> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#dependent-place> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#abstract-quality> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#time-interval> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#event> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatial-location_q> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#proposition> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#state> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#temporal-region> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#relevant-part> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#region> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#non-physical-endurant> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#accomplishment> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#temporal-location_q> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#quale> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#stative> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#process> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#arbitrary-sum> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#physical-object> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#quality> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#quality-space> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#physical-region> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-region> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#abstract-region> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#set> .} WHERE {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Nothing> .
}

# cax-sco-5
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#state> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#perdurant> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#stative> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .} WHERE {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#state> .
}

# cax-sco-6
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#perdurant> .} WHERE {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#event> .
}

# cax-sco-7
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#abstract> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .} WHERE {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#region> .
}

# cax-sco-10
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#physical-endurant> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#endurant> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .} WHERE {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#feature> .
}

# cax-sco-11
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#temporal-location_q> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#quality> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#temporal-quality> .} WHERE {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#temporal-location_q> .
}

# cax-sco-12
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#endurant> .} WHERE {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#arbitrary-sum> .
}

# cax-sco-14
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#temporal-quality> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#quality> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .} WHERE {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#temporal-quality> .
}

# cax-sco-15
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#quality> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .} WHERE {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#quality> .
}

# cax-sco-16
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#endurant> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#physical-endurant> .} WHERE {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#physical-object> .
}

# cax-sco-17
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#event> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#perdurant> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .} WHERE {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#achievement> .
}

# cax-sco-18
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#region> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#abstract> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .} WHERE {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#quality-space> .
}

# cax-sco-20
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#abstract> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .} WHERE {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#quale> .
}

# cax-sco-25
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#perdurant> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#event> .} WHERE {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#accomplishment> .
}

# cax-sco-26
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#region> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#abstract> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .} WHERE {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#temporal-region> .
}

# cax-sco-27
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#feature> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#endurant> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#physical-endurant> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .} WHERE {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#relevant-part> .
}

# cax-sco-28
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#non-physical-object> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#endurant> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#non-physical-endurant> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .} WHERE {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#non-physical-object> .
}

# cax-sco-30
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#proposition> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#abstract> .} WHERE {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#proposition> .
}

# cax-sco-31
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#endurant> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .} WHERE {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#physical-endurant> .
}

# cax-sco-33
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#stative> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#perdurant> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .} WHERE {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#process> .
}

# cax-sco-37
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#region> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#physical-region> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#abstract> .} WHERE {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#space-region> .
}

# cax-sco-38
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#abstract-quality> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#quality> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .} WHERE {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#abstract-quality> .
}

# cax-sco-41
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .} WHERE {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#perdurant> .
}

# cax-sco-49
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .} WHERE {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#endurant> .
}

# cax-sco-50
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#abstract> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#region> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .} WHERE {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#physical-region> .
}

# cax-sco-52
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#region> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#physical-region> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#space-region> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#abstract> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .} WHERE {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-region> .
}

# cax-sco-58
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .
} WHERE {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .
}

# cax-sco-59
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#endurant> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .} WHERE {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#non-physical-endurant> .
}

# cax-sco-63
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#physical-quality> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#quality> .} WHERE {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatial-location_q> .
}

# cax-sco-65
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#abstract-region> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#abstract> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#region> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .} WHERE {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#abstract-region> .
}

# cax-sco-74
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#temporal-region> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#region> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#abstract> .} WHERE {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#time-interval> .
}

# cax-sco-81
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#physical-endurant> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#endurant> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .} WHERE {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#amount-of-matter> .
}

# cax-sco-112
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#quality> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .} WHERE {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#physical-quality> .
}

# cax-sco-149
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .} WHERE {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#spatio-temporal-particular> .
}

# cax-sco-178
CONSTRUCT {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#Thing> .
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#particular> .} WHERE {
	?x <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://www.w3.org/2002/07/owl#abstract> .
}

