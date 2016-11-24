# baseURI: http://example.org/unnamed
# imports: http://spinrdf.org/spin

@prefix impact: <http://example.org/unnamed#> .
@prefix owl: <http://www.w3.org/2002/07/owl#> .
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
@prefix sp: <http://spinrdf.org/sp#> .
@prefix spin: <http://spinrdf.org/spin#> .
@prefix spl: <http://spinrdf.org/spl#> .
@prefix xsd: <http://www.w3.org/2001/XMLSchema#> .

<http://example.org/unnamed>
  rdf:type owl:Ontology ;
  owl:imports <http://spinrdf.org/spin> ;
  owl:versionInfo "Created with TopBraid Composer"^^xsd:string ;
.
impact:PatientProfileChart0
  impact:hasSystolicBloodPressure impact:SystolicBloodPressure41 ;
.
impact:SystolicBloodPressure
  rdf:type owl:Class ;
  spin:rule [
      rdf:type sp:Construct ;
      sp:templates (
          [
            sp:object impact:HighSystolicBloodPressure ;
            sp:predicate impact:hasDSSFinding ;
            sp:subject [
                sp:varName "p"^^xsd:string ;
              ] ;
          ]
          [
            sp:object "DiaryHighSystolicBloodPressure" ;
            sp:predicate impact:hasTriggeredRule ;
            sp:subject impact:HighSystolicBloodPressure ;
          ]
          [
            sp:object "Patient's systolic bloodpressure is uncontrolled" ;
            sp:predicate impact:hasLabel ;
            sp:subject impact:HighSystolicBloodPressure ;
          ]
          [
            sp:object impact:DSSFinding ;
            sp:predicate rdf:type ;
            sp:subject impact:HighSystolicBloodPressure ;
          ]
        ) ;
      sp:where (
          [
            sp:object [
                sp:varName "h"^^xsd:string ;
              ] ;
            sp:predicate impact:hasSystolicBloodPressure ;
            sp:subject [
                sp:varName "p"^^xsd:string ;
              ] ;
          ]
          [
            sp:object [
                sp:varName "v"^^xsd:string ;
              ] ;
            sp:predicate impact:hasValue ;
            sp:subject [
                sp:varName "h"^^xsd:string ;
              ] ;
          ]
          [
            rdf:type sp:Filter ;
            sp:expression [
                rdf:type impact:latest2 ;
                sp:arg1 [
                    sp:varName "h"^^xsd:string ;
                  ] ;
              ] ;
          ]
          [
            rdf:type sp:Filter ;
            sp:expression [
                rdf:type sp:ge ;
                sp:arg1 [
                    sp:varName "v"^^xsd:string ;
                  ] ;
                sp:arg2 135 ;
              ] ;
          ]
        ) ;
    ] ;
.
impact:SystolicBloodPressure41
  rdf:type impact:SystolicBloodPressure ;
  impact:hasLatestDate "true"^^xsd:boolean ;
  impact:hasDate "2013-01-24T03:58:15-04:00"^^xsd:date ;
  impact:hasValue "142.84"^^xsd:double ;
.
impact:hasLatestDate
  rdf:type rdf:Property ;
.
impact:latest2
  rdf:type spin:Function ;
  spin:body [
      rdf:type sp:Ask ;
      sp:where (
          [
            sp:object "true"^^xsd:boolean ;
            sp:predicate impact:hasLatestDate ;
            sp:subject [
                sp:varName "systolicBloodPressure"^^xsd:string ;
              ] ;
          ]
        ) ;
    ] ;
  spin:constraint [
      rdf:type spl:Argument ;
      spl:predicate <http://spinrdf.org/arg#systolicBloodPressure> ;
      spl:valueType impact:SystolicBloodPressure ;
    ] ;
  rdfs:comment "Checks whether the given resource is the 'latest' of its type" ;
  rdfs:label "latest"^^xsd:string ;
  rdfs:subClassOf spin:Functions ;
.
<http://spinrdf.org/arg#systolicBloodPressure>
  rdf:type rdf:Property ;
  rdfs:subPropertyOf sp:arg ;
.