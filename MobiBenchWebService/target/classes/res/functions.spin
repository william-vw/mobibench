@prefix impact: <http://www.dal.ca/nichegroup/impactaf#>.
@prefix spin: <http://spinrdf.org/spin#>.
@prefix sp: <http://spinrdf.org/sp#>.
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>. 
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>.
@prefix xsd: <http://www.w3.org/2001/XMLSchema#>.
@prefix spl: <http://spinrdf.org/spl#>.
@prefix owlrl: <http://topbraid.org/spin/owlrl> .
@prefix list: <http://jena.hpl.hp.com/ARQ/list#> .

impact:latest
	a spin:Function ;
    rdfs:subClassOf spin:Functions ;
    rdfs:comment "Checks whether the given resource is the 'latest' of its type"^^xsd:string ;
    rdfs:label "latest"^^xsd:string ;
    spin:constraint
    [ 	a spl:Argument ;
		rdfs:comment "The resource to check for latestness." ;
		spl:predicate sp:arg1
    ] ;
    spin:body
    [ 	a sp:Ask ;
		sp:where ([ sp:object "true"^^xsd:boolean ;
					sp:predicate impact:hasLatestDate ;
					sp:subject spin:_arg1
					])
    ] .
	

# owl2rl functions

owlrl:listContainsExtraType
	a spin:Function ;
    rdfs:subClassOf spin:Functions ;
	rdfs:label "list contains extra object"^^xsd:string ;
    rdfs:comment "Walks a given rdf:List (?arg2) and returns true if the given subject (?arg1) does not have a list element as rdf:type. This can be used to check whether the subject has all objects from a given list, by simply negating the result with the ! operator."^^xsd:string ;
	spin:returnType xsd:boolean ;
	spin:private "true"^^xsd:string ;
    spin:constraint
		[ 	a spl:Argument ;
			rdfs:comment "The rdf:List to walk through."^^xsd:string ;
            spl:predicate sp:arg2 ;
			spl:valueType rdf:List ;	
		] ;	
	spin:constraint
		[ 	a spl:Argument ;
            rdfs:comment "The subject that is checked."^^xsd:string ;
            spl:predicate sp:arg1 ;
			spl:valueType rdfs:Resource ;
		] ;
	spin:body
	[ 	a sp:Ask ;
		sp:where  ( [ 	sp:object     [ sp:varName  "object"^^xsd:string ] ;
						sp:predicate  list:member ;
						sp:subject    spin:_arg2
					] [ a sp:NotExists ;
						sp:elements ( [ 	sp:object     [ sp:varName  "object"^^xsd:string ] ;
											sp:predicate  rdf:type ;
											sp:subject    spin:_arg1
									] )
					] )
	] .

owlrl:keyViolationExists
	a spin:Function ;
    rdfs:subClassOf spin:Functions ;
	rdfs:label "key violation exists"^^xsd:string ;
    rdfs:comment "A helper function of the prp-key axiom."^^xsd:string ;
	spin:returnType xsd:boolean ;
	spin:private "true"^^xsd:string ;
    spin:constraint
		[ 	a spl:Argument ;
			rdfs:comment "The second instance"^^xsd:string ;
            spl:predicate sp:arg3 ;
			spl:valueType rdfs:Resource ;	
		] ;	
    spin:constraint
		[ 	a spl:Argument ;
			rdfs:comment "The first instance"^^xsd:string ;
            spl:predicate sp:arg2 ;
			spl:valueType rdfs:Resource ;	
		] ;	
	spin:constraint
		[ 	a spl:Argument ;
			rdfs:comment "The list of key properties."^^xsd:string ;
            spl:predicate sp:arg1 ;
			spl:valueType rdf:List ;	
		] ;	
	spin:body
		[ 	a sp:Ask ;
			sp:where  ( [ 	sp:object     [ sp:varName  "p"^^xsd:string ] ;
							sp:predicate  list:member ;
							sp:subject    spin:_arg1
						  ] [ a            sp:Optional ;
							  sp:elements  ( [ sp:object     [ sp:varName  "z1"^^xsd:string ] ;
											   sp:predicate  [ sp:varName  "p"^^xsd:string ] ;
											   sp:subject    spin:_arg2
											 ] )
							] [ a            sp:Optional ;
								sp:elements  ( [ sp:object     [ sp:varName  "z2"^^xsd:string ] ;
												 sp:predicate  [ sp:varName  "p"^^xsd:string ] ;
												 sp:subject    spin:_arg3
											   ] )
							  ] [ a              sp:Filter ;
								  sp:expression  [ a        sp:or ;
												   sp:arg1  [ a        sp:or ;
															  sp:arg1  [ a        sp:not ;
																		 sp:arg1  [ a        sp:bound ;
																					sp:arg1  [ sp:varName  "z1"^^xsd:string ]
																				  ]
																	   ] ;
															  sp:arg2  [ a        sp:not ;
																		 sp:arg1  [ a        sp:bound ;
																					sp:arg1  [ sp:varName  "z2"^^xsd:string ]
																				  ]
																	   ]
															] ;
												   sp:arg2  [ a        sp:ne ;
															  sp:arg1  [ sp:varName  "z1"^^xsd:string ] ;
															  sp:arg2  [ sp:varName  "z2"^^xsd:string ]
															]
												 ]
								] )
		] .