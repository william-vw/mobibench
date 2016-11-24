@prefix afn:   <http://jena.hpl.hp.com/ARQ/function#> .
@prefix rdfs:  <http://www.w3.org/2000/01/rdf-schema#> .
@prefix kennedys: <http://topbraid.org/examples/kennedys#> .
@prefix sp:    <http://spinrdf.org/sp#> .
@prefix spl:   <http://spinrdf.org/spl#> .
@prefix kspin: <http://topbraid.org/examples/kennedysSPIN#> .
@prefix smf:   <http://topbraid.org/sparqlmotionfunctions#> .
@prefix owl:   <http://www.w3.org/2002/07/owl#> .
@prefix xsd:   <http://www.w3.org/2001/XMLSchema#> .
@prefix rdf:   <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix spin:  <http://spinrdf.org/spin#> .
@prefix fn:    <http://www.w3.org/2005/xpath-functions#> .

kennedys:Person
	spin:rule
		[ a             sp:Construct ;
		  sp:templates  ( [ sp:object     kennedys:gay ;
		                    sp:predicate  kennedys:sexualOrientation ;
		                    sp:subject    [ sp:varName  "p"^^xsd:string ]
		                  ] ) ;
		  sp:where      ( [ sp:object     [ sp:varName  "h"^^xsd:string ] ;
		                    sp:predicate  impact:hasSystolicBloodPressure ;
		                    sp:subject    [ sp:varName  "p"^^xsd:string ]
		                  ] [ sp:object     [ sp:varName  "v"^^xsd:string ] ;
		                      sp:predicate  impact:hasValue ;
		                      sp:subject    [ sp:varName  "h"^^xsd:string ]
		                    ] [ a              sp:Filter ;
		                        sp:expression  [ a        impact:latest2 ;
		                                         sp:arg1  [ sp:varName  "h"^^xsd:string ]
		                                       ]
		                      ] [ a              sp:Filter ;
		                          sp:expression  [ a        sp:ge ;
		                                           sp:arg1  [ sp:varName  "v"^^xsd:string ] ;
		                                           sp:arg2  135
		                                         ]
		                        ] )
		] .

kspin:getOppositeSex  a  spin:Function ;
        rdfs:label       "get opposite sex"^^xsd:string ;
        rdfs:subClassOf  spin:Functions ;
        spin:body        [ a                   sp:Select ;
                           sp:resultVariables  ( _:b11 ) ;
                           sp:where            ( [ sp:object     kennedys:Gender ;
                                                   sp:predicate  rdf:type ;
                                                   sp:subject    _:b11
                                                 ] [ a              sp:Filter ;
                                                     sp:expression  [ a        sp:ne ;
                                                                      sp:arg1  _:b11 ;
                                                                      sp:arg2  [ sp:varName  "gender"^^xsd:string ]
                                                                    ]
                                                   ] )
                         ] ;
        spin:constraint  [ a              spl:Argument ;
                           spl:predicate  kennedys:gender ;
                           spl:valueType  kennedys:Gender
                         ] .
                         
<http://topbraid.org/examples/kennedysSPIN>
        a                owl:Ontology ;
        owl:imports      <http://topbraid.org/examples/kennedys> , <http://spinrdf.org/spin> ;
        owl:versionInfo  "Created with TopBraid Composer"^^xsd:string .