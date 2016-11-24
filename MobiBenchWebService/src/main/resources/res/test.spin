@prefix rdfs:  <http://www.w3.org/2000/01/rdf-schema#> .
@prefix sp:    <http://spinrdf.org/sp#> .
@prefix spl:   <http://spinrdf.org/spl#> .
@prefix xsd:   <http://www.w3.org/2001/XMLSchema#> .
@prefix spin:  <http://spinrdf.org/spin#> .
@prefix rdf:   <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix impact: <http://www.dal.ca/nichegroup/impactaf#> .
@prefix owl: <http://www.w3.org/2002/07/owl#> .

impact:PatientProfileChart0 impact:hasSystolicBloodPressure impact:SystolicBloodPressure41 .

impact:hasLatestDate rdf:type rdf:Property .

impact:SystolicBloodPressure
	spin:rule
		[ a             sp:Construct ;
		  sp:templates  ( [ sp:object     impact:HighSystolicBloodPressure ;
		                    sp:predicate  impact:hasDSSFinding ;
		                    sp:subject    [ sp:varName  "p"^^xsd:string ]
		                  ] [ sp:object     "DiaryHighSystolicBloodPressure" ;
		                      sp:predicate  impact:hasTriggeredRule ;
		                      sp:subject    impact:HighSystolicBloodPressure
		                    ] [ sp:object     "Patient's systolic bloodpressure is uncontrolled" ;
		                        sp:predicate  impact:hasLabel ;
		                        sp:subject    impact:HighSystolicBloodPressure
		                      ] [ sp:object     impact:DSSFinding ;
		                          sp:predicate  rdf:type ;
		                          sp:subject    impact:HighSystolicBloodPressure
		                        ] ) ;
		  sp:where      ( [ sp:object     [ sp:varName  "h"^^xsd:string ] ;
		                    sp:predicate  impact:hasSystolicBloodPressure ;
		                    sp:subject    [ sp:varName  "p"^^xsd:string ]
		                  ] [ sp:object     [ sp:varName  "v"^^xsd:string ] ;
		                      sp:predicate  impact:hasValue ;
		                      sp:subject    [ sp:varName  "h"^^xsd:string ]
		                    ] [ a              sp:Filter ;
		                        sp:expression  [ a        impact:latest2 ;
		                                         sp:arg1  [ sp:varName "h"^^xsd:string ]
		                                       ]
		                      ] [ a              sp:Filter ;
		                          sp:expression  [ a        sp:ge ;
		                                           sp:arg1  [ sp:varName  "v"^^xsd:string ] ;
		                                           sp:arg2  135
		                                         ]
		                        ] )
		] .

impact:SystolicBloodPressure41 impact:hasDate "2013-01-24T03:58:15-04:00"^^xsd:date .
impact:SystolicBloodPressure41 impact:hasValue "142.84"^^xsd:double .
impact:SystolicBloodPressure41 rdf:type impact:SystolicBloodPressure .
impact:SystolicBloodPressure41 impact:hasLatestDate "true"^^xsd:boolean .

impact:latest2  a         spin:Function ;
        rdfs:comment     "Checks whether the given resource is the 'latest' of its type" ;
        rdfs:label       "latest"^^xsd:string ;
        rdfs:subClassOf  spin:Functions ;
        spin:body        [ a         sp:Ask ;
                           sp:where  ( [ sp:object     "true"^^xsd:boolean ;
                                         sp:predicate  impact:hasLatestDate ;
                                         sp:subject    spin:_arg1
                                       ] )
                         ] ;
        spin:constraint  [ a              spl:Argument ;
                           rdfs:comment   "The resource to check for 'latestness'."^^xsd:string ;
                           spl:predicate  sp:arg1
                         ] .