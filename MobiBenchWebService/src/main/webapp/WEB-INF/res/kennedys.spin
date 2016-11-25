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

sp:_birthYear  a    sp:Variable ;
        sp:varName  "birthYear"^^xsd:string .

_:b0    sp:varName  "predicate"^^xsd:string .

sp:_predicate  a    sp:Variable ;
        sp:varName  "predicate"^^xsd:string .

sp:_child  a        sp:Variable ;
        sp:varName  "child"^^xsd:string .

sp:_spouse  a       sp:Variable ;
        sp:varName  "spouse"^^xsd:string .

kspin:age  a         owl:DatatypeProperty ;
        rdfs:domain  kennedys:Person ;
        rdfs:label   "age"^^xsd:string ;
        rdfs:range   xsd:integer .

_:b1    sp:varName  "subject"^^xsd:string .

kennedys:Person  spin:constraint  [ a             sp:Ask ;
                                    rdfs:comment  "age must be within a realistic range"^^xsd:string ;
                                    sp:where      ( [ sp:object     sp:_age ;
                                                      sp:predicate  kspin:age ;
                                                      sp:subject    spin:_this
                                                    ] [ a              sp:Filter ;
                                                        sp:expression  [ a        sp:or ;
                                                                         sp:arg1  [ a        sp:lt ;
                                                                                    sp:arg1  sp:_age ;
                                                                                    sp:arg2  0
                                                                                  ] ;
                                                                         sp:arg2  [ a        sp:gt ;
                                                                                    sp:arg1  sp:_age ;
                                                                                    sp:arg2  120
                                                                                  ]
                                                                       ]
                                                      ] )
                                  ] ;
        spin:constraint  [ a             sp:Construct ;
                           sp:templates  ( [ sp:object     spin:ConstraintViolation ;
                                             sp:predicate  rdf:type ;
                                             sp:subject    _:b2
                                           ] [ sp:object     spin:_this ;
                                               sp:predicate  spin:violationRoot ;
                                               sp:subject    _:b2
                                             ] [ sp:object     kennedys:spouse ;
                                                 sp:predicate  spin:violationPath ;
                                                 sp:subject    _:b2
                                               ] [ sp:object     "Same-sex marriage not permitted (in this model)" ;
                                                   sp:predicate  rdfs:label ;
                                                   sp:subject    _:b2
                                                 ] [ sp:object     _:b3 ;
                                                     sp:predicate  spin:fix ;
                                                     sp:subject    _:b2
                                                   ] [ sp:object     _:b4 ;
                                                       sp:predicate  spin:fix ;
                                                       sp:subject    _:b2
                                                     ] [ sp:object     kspin:SetObject ;
                                                         sp:predicate  rdf:type ;
                                                         sp:subject    _:b3
                                                       ] [ sp:object     _:b5 ;
                                                           sp:predicate  rdf:subject ;
                                                           sp:subject    _:b3
                                                         ] [ sp:object     kennedys:gender ;
                                                             sp:predicate  rdf:predicate ;
                                                             sp:subject    _:b3
                                                           ] [ sp:object     _:b6 ;
                                                               sp:predicate  rdf:object ;
                                                               sp:subject    _:b3
                                                             ] [ sp:object     kspin:SetObject ;
                                                                 sp:predicate  rdf:type ;
                                                                 sp:subject    _:b4
                                                               ] [ sp:object     spin:_this ;
                                                                   sp:predicate  rdf:subject ;
                                                                   sp:subject    _:b4
                                                                 ] [ sp:object     kennedys:gender ;
                                                                     sp:predicate  rdf:predicate ;
                                                                     sp:subject    _:b4
                                                                   ] [ sp:object     _:b7 ;
                                                                       sp:predicate  rdf:object ;
                                                                       sp:subject    _:b4
                                                                     ] ) ;
                           sp:where      ( [ sp:object     _:b5 ;
                                             sp:predicate  kennedys:spouse ;
                                             sp:subject    spin:_this
                                           ] [ sp:object     _:b8 ;
                                               sp:predicate  kennedys:gender ;
                                               sp:subject    spin:_this
                                             ] [ sp:object     _:b9 ;
                                                 sp:predicate  kennedys:gender ;
                                                 sp:subject    _:b5
                                               ] [ a              sp:Let ;
                                                   sp:expression  [ a        kspin:getOppositeSex ;
                                                                    sp:arg1  _:b9
                                                                  ] ;
                                                   sp:variable    _:b6
                                                 ] [ a              sp:Let ;
                                                     sp:expression  [ a        kspin:getOppositeSex ;
                                                                      sp:arg1  _:b8
                                                                    ] ;
                                                     sp:variable    _:b7
                                                   ] [ a              sp:Filter ;
                                                       sp:expression  [ a        sp:eq ;
                                                                        sp:arg1  _:b8 ;
                                                                        sp:arg2  _:b9
                                                                      ]
                                                     ] )
                         ] ;
        spin:rule        [ a                kspin:InferGrandParent ;
                           kennedys:gender  kennedys:male ;
                           kspin:predicate  kspin:grandFather
                         ] ;
        spin:rule        [ a                kspin:InferGrandParent ;
                           kennedys:gender  kennedys:female ;
                           kspin:predicate  kspin:grandMother
                         ] ;
        spin:rule        [ a             sp:Construct ;
                           rdfs:comment  "Infer age from currentYear - birthYear"^^xsd:string ;
                           sp:templates  ( [ sp:object     sp:_age ;
                                             sp:predicate  kspin:age ;
                                             sp:subject    spin:_this
                                           ] ) ;
                           sp:where      ( [ sp:object     sp:_birthYear ;
                                             sp:predicate  kennedys:birthYear ;
                                             sp:subject    spin:_this
                                           ] [ a              sp:Let ;
                                               sp:expression  [ a  kspin:getCurrentYear ] ;
                                               sp:variable    sp:_currentYear
                                             ] [ a              sp:Let ;
                                                 sp:expression  [ a        sp:sub ;
                                                                  sp:arg1  sp:_currentYear ;
                                                                  sp:arg2  sp:_birthYear
                                                                ] ;
                                                 sp:variable    sp:_age
                                               ] )
                         ] .

sp:_childAge  a     sp:Variable ;
        sp:varName  "childAge"^^xsd:string .

sp:_currentYear  a  sp:Variable ;
        sp:varName  "currentYear"^^xsd:string .

sp:_year  a         sp:Variable ;
        sp:varName  "year"^^xsd:string .

kspin:grandMother  a        owl:ObjectProperty ;
        rdfs:label          "grand mother"^^xsd:string ;
        rdfs:subPropertyOf  kspin:grandParent .

_:b6    sp:varName  "spouseOppositeSex"^^xsd:string .

sp:_sub  a          sp:Variable ;
        sp:varName  "sub"^^xsd:string .

kspin:SetObject  a          spin:Template ;
        rdfs:label          "Set object"^^xsd:string ;
        rdfs:subClassOf     spin:Templates ;
        spin:body           [ a                 sp:Modify ;
                              sp:deletePattern  ( [ sp:object     _:b10 ;
                                                    sp:predicate  _:b0 ;
                                                    sp:subject    _:b1
                                                  ] ) ;
                              sp:graphIRI       <http://topbraid.org/examples/kennedys> ;
                              sp:insertPattern  ( [ sp:object     [ sp:varName  "object"^^xsd:string ] ;
                                                    sp:predicate  _:b0 ;
                                                    sp:subject    _:b1
                                                  ] ) ;
                              sp:where          ( [ sp:object     _:b10 ;
                                                    sp:predicate  _:b0 ;
                                                    sp:subject    _:b1
                                                  ] )
                            ] ;
        spin:constraint     [ a              spl:Argument ;
                              spl:predicate  rdf:subject ;
                              spl:valueType  rdfs:Resource
                            ] ;
        spin:constraint     [ a              spl:Argument ;
                              spl:predicate  rdf:predicate ;
                              spl:valueType  rdf:Property
                            ] ;
        spin:constraint     [ a              spl:Argument ;
                              spl:predicate  rdf:object
                            ] ;
        spin:labelTemplate  "Change {?predicate} of {?subject} to {?object}"^^xsd:string .

sp:_grandParent  a  sp:Variable ;
        sp:varName  "grandParent"^^xsd:string .

sp:_spouseGender  a  sp:Variable ;
        sp:varName  "spouseGender"^^xsd:string .

_:b8    sp:varName  "gender"^^xsd:string .

_:b5    sp:varName  "spouse"^^xsd:string .

kspin:grandParent  a  owl:ObjectProperty ;
        rdfs:label  "grand parent"^^xsd:string .

kspin:InferGrandParent
        a                   spin:Template ;
        rdfs:comment        "Find the grandparents of the given person ?this. This template can be used either for grandMother or grandFather." ;
        rdfs:label          "Infer grand parent"^^xsd:string ;
        rdfs:subClassOf     spin:Templates ;
        spin:abstract       true ;
        spin:body           [ a             sp:Construct ;
                              sp:templates  ( [ sp:object     sp:_grandParent ;
                                                sp:predicate  sp:_predicate ;
                                                sp:subject    spin:_this
                                              ] ) ;
                              sp:where      ( [ sp:object     sp:_parent ;
                                                sp:predicate  kennedys:parent ;
                                                sp:subject    spin:_this
                                              ] [ sp:object     sp:_grandParent ;
                                                  sp:predicate  kennedys:parent ;
                                                  sp:subject    sp:_parent
                                                ] [ sp:object     sp:_gender ;
                                                    sp:predicate  kennedys:gender ;
                                                    sp:subject    sp:_grandParent
                                                  ] )
                            ] ;
        spin:constraint     [ a              spl:Argument ;
                              rdfs:comment   "the gender to match against"^^xsd:string ;
                              spl:predicate  kennedys:gender ;
                              spl:valueType  kennedys:Gender
                            ] ;
        spin:constraint     [ a              spl:Argument ;
                              rdfs:comment   "the predicate to create (e.g. grandFather)"^^xsd:string ;
                              spl:predicate  kspin:predicate ;
                              spl:valueType  rdf:Property
                            ] ;
        spin:labelTemplate  "Infer {?predicate} from {?gender} grand parents"^^xsd:string .

sp:_createPredicate  a  sp:Variable ;
        sp:varName  "createPredicate"^^xsd:string .

sp:_parent  a       sp:Variable ;
        sp:varName  "parent"^^xsd:string .

kspin:getFather  a       spin:Function ;
        rdfs:comment     "Gets the male parent of a given person (?arg1)" ;
        rdfs:label       "get father"^^xsd:string ;
        rdfs:subClassOf  spin:Functions ;
        spin:body        [ a                   sp:Select ;
                           sp:resultVariables  ( sp:_father ) ;
                           sp:where            ( [ sp:object     sp:_father ;
                                                   sp:predicate  kennedys:parent ;
                                                   sp:subject    spin:_arg1
                                                 ] [ sp:object     kennedys:male ;
                                                     sp:predicate  kennedys:gender ;
                                                     sp:subject    sp:_father
                                                   ] )
                         ] ;
        spin:constraint  [ a              spl:Argument ;
                           rdfs:comment   "the person to get the father of"^^xsd:string ;
                           spl:predicate  sp:arg1 ;
                           spl:valueType  kennedys:Person
                         ] .

kspin:grandFather  a        owl:ObjectProperty ;
        rdfs:label          "grand father"^^xsd:string ;
        rdfs:subPropertyOf  kspin:grandParent .

_:b7    sp:varName  "oppositeSex"^^xsd:string .

_:b11   sp:varName  "opposite"^^xsd:string .

_:b9    sp:varName  "spouseGender"^^xsd:string .

sp:_gender  a       sp:Variable ;
        sp:varName  "gender"^^xsd:string .

sp:_age  a          sp:Variable ;
        sp:varName  "age"^^xsd:string .

<http://topbraid.org/examples/kennedysSPIN>
        a                owl:Ontology ;
        owl:imports      <http://topbraid.org/examples/kennedys> , <http://spinrdf.org/spin> ;
        owl:versionInfo  "Created with TopBraid Composer"^^xsd:string .

_:b10   sp:varName  "oldObject"^^xsd:string .

kspin:getCurrentYear  a  spin:Function ;
        rdfs:comment     "Gets the current year as an xsd:integer." ;
        rdfs:label       "get current year"^^xsd:string ;
        rdfs:subClassOf  spin:Functions ;
        spin:body        [ a                   sp:Select ;
                           sp:resultVariables  ( sp:_year ) ;
                           sp:where            ( [ a              sp:Let ;
                                                   sp:expression  [ a        xsd:string ;
                                                                    sp:arg1  [ a      afn:now ]
                                                                  ] ;
                                                   sp:variable    sp:_str
                                                 ] [ a              sp:Let ;
                                                     sp:expression  [ a        fn:substring ;
                                                                      sp:arg1  sp:_str ;
                                                                      sp:arg2  0 ;
                                                                      sp:arg3  4
                                                                    ] ;
                                                     sp:variable    sp:_sub
                                                   ] [ a              sp:Let ;
                                                       sp:expression  [ a        xsd:integer ;
                                                                        sp:arg1  sp:_sub
                                                                      ] ;
                                                       sp:variable    sp:_year
                                                     ] )
                         ] ;
        spin:returnType  xsd:integer .

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

kspin:predicate  a          rdf:Property ;
        rdfs:label          "predicate"^^xsd:string ;
        rdfs:subPropertyOf  sp:arg .

sp:_father  a       sp:Variable ;
        sp:varName  "father"^^xsd:string .

sp:_str  a          sp:Variable ;
        sp:varName  "str"^^xsd:string .
