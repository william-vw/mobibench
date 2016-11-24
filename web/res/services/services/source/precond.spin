# AddLinks__service
CONSTRUCT {
	<http://127.0.0.1/service#AddLinks__service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?AddLinks__service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_GEOPOLITICAL_ENTITY .
	?_GEOPOLITICAL_ENTITY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/portal.owl#Geopolitical-Entity> .
	?AddLinks__service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_GEOPOLITICAL_ENTITY1 .
	?_GEOPOLITICAL_ENTITY1 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/portal.owl#Geopolitical-Entity> .
	<http://www.w3.org/2002/07/owl#AllDifferent> <http://www.w3.org/2002/07/owl#distinctMembers> ?var4 .
	?var4 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> ?_GEOPOLITICAL_ENTITY .
	?var4 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> ?var5 .
	?var5 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> ?_GEOPOLITICAL_ENTITY1 .
	?var5 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> <http://www.w3.org/1999/02/22-rdf-syntax-ns#nil> .
}

# addressDistanceCalculator
CONSTRUCT {
	<http://127.0.0.1/service#addressDistanceCalculator> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?addressDistanceCalculator <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_ADDRESS1 .
	?_ADDRESS1 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#Address> .
	?addressDistanceCalculator <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_ADDRESS2 .
	?_ADDRESS2 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#Address> .
	?addressDistanceCalculator <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_CITY1 .
	?_CITY1 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#City> .
	?addressDistanceCalculator <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_CITY2 .
	?_CITY2 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#City> .
	?addressDistanceCalculator <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_STATE1 .
	?_STATE1 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#State> .
	?addressDistanceCalculator <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_STATE2 .
	?_STATE2 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#State> .
	?addressDistanceCalculator <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_DISTANCE .
	?_DISTANCE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#GeographicDistance> .
	<http://www.w3.org/2002/07/owl#AllDifferent> <http://www.w3.org/2002/07/owl#distinctMembers> ?var6 .
	?var6 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> ?_ADDRESS1 .
	?var6 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> ?var7 .
	?var7 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> ?_ADDRESS2 .
	?var7 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> <http://www.w3.org/1999/02/22-rdf-syntax-ns#nil> .
	?_CITY1 <http://127.0.0.1/ontology/protont.owl#locatedIn> ?_STATE1 .
	?_CITY2 <http://127.0.0.1/ontology/protont.owl#locatedIn> ?_STATE2 .
}

# agent_movement
CONSTRUCT {
	<http://127.0.0.1/service#agent_movement> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?agent_movement <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?Agent .
	?Agent <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#Agent> .
	?agent_movement <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?CurrentPosition .
	?CurrentPosition <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/spatial_ontology.owl#SpatialZone> .
	?agent_movement <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?FuturePosition .
	?FuturePosition <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/spatial_ontology.owl#SpatialZone> .
	?Agent <http://127.0.0.1/ontology/messemodul.owl#isLocatedIn> ?CurrentPosition .
}

# AuthorizePhysician_service
CONSTRUCT {
	<http://127.0.0.1/service#AuthorizePhysician_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?AuthorizePhysician_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?AuthorizePhysician_AuthorizationTimeInterval .
	?AuthorizePhysician_AuthorizationTimeInterval <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/PatientOntology.owl#DateTime> .
	?AuthorizePhysician_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?AuthorizePhysician_PhysicianID .
	?AuthorizePhysician_PhysicianID <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/PatientOntology.owl#PhysicianID> .
	?AuthorizePhysician_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?AuthorizePhysician_PatientMedicalRecords .
	?AuthorizePhysician_PatientMedicalRecords <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/PatientOntology.owl#MedicalRecords> .
	?AuthorizePhysician_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?ContactEMA_AmbulanceArrivalTime .
	?ContactEMA_AmbulanceArrivalTime <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/PatientOntology.owl#DateTime> .
	?AuthorizePhysician_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?AcceptCostAndHealingPlan_CostAndHealingPlanAcceptanceAnswer .
	?AcceptCostAndHealingPlan_CostAndHealingPlanAcceptanceAnswer <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/PatientOntology.owl#Acknowledgement> .
	?AuthorizePhysician_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?AuthorizePhysician_PhysicianAuthorization .
	?AuthorizePhysician_PhysicianAuthorization <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/PatientOntology.owl#Authorization> .
	?AuthorizePhysician_PhysicianID <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
}

# BookMedicalFlight_service
CONSTRUCT {
	<http://127.0.0.1/service#BookMedicalFlight_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?BookMedicalFlight_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?BookMedicalFlight_FlightNumber .
	?BookMedicalFlight_FlightNumber <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/MedicalFlightCompanyOntology.owl#FlightNumber> .
	?BookMedicalFlight_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?BookMedicalFlight_Account .
	?BookMedicalFlight_Account <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/MedicalFlightCompanyOntology.owl#Account> .
	?BookMedicalFlight_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?BookMedicalFlight_AirportGate .
	?BookMedicalFlight_AirportGate <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/MedicalFlightCompanyOntology.owl#AirportGate> .
	?BookMedicalFlight_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?BookMedicalFlight_BookingNumber .
	?BookMedicalFlight_BookingNumber <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/MedicalFlightCompanyOntology.owl#BookingNumber> .
	?BookMedicalFlight_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?BookMedicalFlight_SeatNumber .
	?BookMedicalFlight_SeatNumber <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/MedicalFlightCompanyOntology.owl#SeatNumber> .
	?BookMedicalFlight_User <http://127.0.0.1/ontology/Mid-level-ontology.owl#accountHolder> ?BookMedicalFlight_Account .
}

# BookMedicalTransport_service
CONSTRUCT {
	<http://127.0.0.1/service#BookMedicalTransport_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?BookMedicalTransport_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?ProvideMedicalTransportInformation_DesiredTransportVehicle .
	?ProvideMedicalTransportInformation_DesiredTransportVehicle <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/MedicalTransportCompanyOntology.owl#Vehicle> .
	?BookMedicalTransport_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?BookMedicalTransport_Account .
	?BookMedicalTransport_Account <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/MedicalTransportCompanyOntology.owl#Account> .
	?BookMedicalTransport_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?BookMedicalTransport_TransportNumber .
	?BookMedicalTransport_TransportNumber <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/MedicalTransportCompanyOntology.owl#TransportNumber> .
	?BookMedicalTransport_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?BookMedicalTransport_SeatNumber .
	?BookMedicalTransport_SeatNumber <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/MedicalTransportCompanyOntology.owl#SeatNumber> .
	?BookMedicalTransport_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?BookMedicalTransport_BookingNumber .
	?BookMedicalTransport_BookingNumber <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/MedicalTransportCompanyOntology.owl#BookingNumber> .
	?BookMedicalTransport_User <http://127.0.0.1/ontology/Mid-level-ontology.owl#accountHolder> ?BookMedicalTransport_Account .
}

# BookNonMedicalFlight_service
CONSTRUCT {
	<http://127.0.0.1/service#BookNonMedicalFlight_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?BookNonMedicalFlight_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?BookNonMedicalFlight_Account .
	?BookNonMedicalFlight_Account <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/NonMedicalFlightCompanyOntology.owl#Account> .
	?BookNonMedicalFlight_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?BookNonMedicalFlight_FlightNumber .
	?BookNonMedicalFlight_FlightNumber <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/NonMedicalFlightCompanyOntology.owl#FlightNumber> .
	?BookNonMedicalFlight_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?BookNonMedicalFlight_SeatNumber .
	?BookNonMedicalFlight_SeatNumber <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/NonMedicalFlightCompanyOntology.owl#SeatNumber> .
	?BookNonMedicalFlight_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?BookNonMedicalFlight_AirportGate .
	?BookNonMedicalFlight_AirportGate <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/NonMedicalFlightCompanyOntology.owl#AirportGate> .
	?BookNonMedicalFlight_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?BookNonMedicalFlight_BookingNumber .
	?BookNonMedicalFlight_BookingNumber <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/NonMedicalFlightCompanyOntology.owl#BookingNumber> .
	?BookNonMedicalFlight_User <http://127.0.0.1/ontology/Mid-level-ontology.owl#accountHolder> ?BookNonMedicalFlight_Account .
}

# BookNonMedicalTransport_service
CONSTRUCT {
	<http://127.0.0.1/service#BookNonMedicalTransport_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?BookNonMedicalTransport_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?BookNonMedicalTransport_TransportNumber .
	?BookNonMedicalTransport_TransportNumber <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/NonMedicalTransportCompanyOntology.owl#TransportNumber> .
	?BookNonMedicalTransport_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?BookNonMedicalTransport_Account .
	?BookNonMedicalTransport_Account <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/NonMedicalTransportCompanyOntology.owl#Account> .
	?BookNonMedicalTransport_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?BookNonMedicalTransport_SeatNumber .
	?BookNonMedicalTransport_SeatNumber <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/NonMedicalTransportCompanyOntology.owl#SeatNumber> .
	?BookNonMedicalTransport_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?BookNonMedicalTransport_BookingNumber .
	?BookNonMedicalTransport_BookingNumber <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/NonMedicalTransportCompanyOntology.owl#BookingNumber> .
	?BookNonMedicalTransport_User <http://127.0.0.1/ontology/Mid-level-ontology.owl#accountHolder> ?BookNonMedicalTransport_Account .
}

# bookpersoncreditaccount__Beaservice
CONSTRUCT {
	<http://127.0.0.1/service#bookpersoncreditaccount__Beaservice> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?bookpersoncreditaccount__Beaservice <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_PERSON .
	?_PERSON <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#Person> .
	?bookpersoncreditaccount__Beaservice <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_BOOK .
	?_BOOK <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#Book> .
	?bookpersoncreditaccount__Beaservice <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_CREDITACCOUNT .
	?_CREDITACCOUNT <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/Mid-level-ontology.owl#CreditAccount> .
	?_CREDITACCOUNT <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/ontosem.owl#Accepted> .
	?_PERSON <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
	?_PERSON <http://127.0.0.1/ontology/Mid-level-ontology.owl#accountHolder> ?_CREDITACCOUNT .
}

# bookpersoncreditaccount__service
CONSTRUCT {
	<http://127.0.0.1/service#bookpersoncreditaccount__service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?bookpersoncreditaccount__service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_PERSON .
	?_PERSON <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#Person> .
	?bookpersoncreditaccount__service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_BOOK .
	?_BOOK <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#Book> .
	?bookpersoncreditaccount__service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_CREDITACCOUNT .
	?_CREDITACCOUNT <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/Mid-level-ontology.owl#CreditAccount> .
	?_CREDITACCOUNT <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/ontosem.owl#Accepted> .
	?_PERSON <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
	?_PERSON <http://127.0.0.1/ontology/Mid-level-ontology.owl#accountHolder> ?_CREDITACCOUNT .
}

# bookpersoncreditcardaccount_price_service
CONSTRUCT {
	<http://127.0.0.1/service#bookpersoncreditcardaccount_price_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?bookpersoncreditcardaccount_price_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_PERSON .
	?_PERSON <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#Person> .
	?bookpersoncreditcardaccount_price_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_BOOK .
	?_BOOK <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#Book> .
	?bookpersoncreditcardaccount_price_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_CREDITCARDACCOUNT .
	?_CREDITCARDACCOUNT <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/Mid-level-ontology.owl#CreditCardAccount> .
	?bookpersoncreditcardaccount_price_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_PRICE .
	?_PRICE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/concept.owl#Price> .
	?_CREDITCARDACCOUNT <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/ontosem.owl#Accepted> .
	?_PERSON <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
	?_PERSON <http://127.0.0.1/ontology/Mid-level-ontology.owl#accountHolder> ?_CREDITCARDACCOUNT .
}

# bookpersoncreditcardaccount_recommendedprice_service
CONSTRUCT {
	<http://127.0.0.1/service#bookpersoncreditcardaccount_recommendedprice_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?bookpersoncreditcardaccount_recommendedprice_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_PERSON .
	?_PERSON <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#Person> .
	?bookpersoncreditcardaccount_recommendedprice_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_BOOK .
	?_BOOK <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#Book> .
	?bookpersoncreditcardaccount_recommendedprice_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_CREDITCARDACCOUNT .
	?_CREDITCARDACCOUNT <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/Mid-level-ontology.owl#CreditCardAccount> .
	?bookpersoncreditcardaccount_recommendedprice_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_RECOMMENDEDPRICE .
	?_RECOMMENDEDPRICE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/concept.owl#RecommendedPrice> .
	?_CREDITCARDACCOUNT <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/ontosem.owl#Accepted> .
	?_PERSON <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
	?_PERSON <http://127.0.0.1/ontology/Mid-level-ontology.owl#accountHolder> ?_CREDITCARDACCOUNT .
}

# bookpersoncreditcardaccount_taxedfreeprice_service
CONSTRUCT {
	<http://127.0.0.1/service#bookpersoncreditcardaccount_taxedfreeprice_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?bookpersoncreditcardaccount_taxedfreeprice_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_CREDITCARDACCOUNT .
	?_CREDITCARDACCOUNT <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/Mid-level-ontology.owl#CreditCardAccount> .
	?bookpersoncreditcardaccount_taxedfreeprice_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_BOOK .
	?_BOOK <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#Book> .
	?bookpersoncreditcardaccount_taxedfreeprice_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_PERSON .
	?_PERSON <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#Person> .
	?bookpersoncreditcardaccount_taxedfreeprice_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_TAXEDFREEPRICE .
	?_TAXEDFREEPRICE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/concept.owl#TaxFreePrice> .
	?_CREDITCARDACCOUNT <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/ontosem.owl#Accepted> .
	?_PERSON <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
	?_PERSON <http://127.0.0.1/ontology/Mid-level-ontology.owl#accountHolder> ?_CREDITCARDACCOUNT .
}

# bookpersoncreditcardaccount__BShopservice
CONSTRUCT {
	<http://127.0.0.1/service#bookpersoncreditcardaccount__BShopservice> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?bookpersoncreditcardaccount__BShopservice <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_CREDITCARDACCOUNT .
	?_CREDITCARDACCOUNT <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/Mid-level-ontology.owl#CreditCardAccount> .
	?bookpersoncreditcardaccount__BShopservice <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_BOOK .
	?_BOOK <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#Book> .
	?bookpersoncreditcardaccount__BShopservice <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_PERSON .
	?_PERSON <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#Person> .
	?_CREDITCARDACCOUNT <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/ontosem.owl#Accepted> .
	?_PERSON <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
	?_PERSON <http://127.0.0.1/ontology/Mid-level-ontology.owl#accountHolder> ?_CREDITCARDACCOUNT .
}

# bookpersoncreditcardaccount__service
CONSTRUCT {
	<http://127.0.0.1/service#bookpersoncreditcardaccount__service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?bookpersoncreditcardaccount__service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_CREDITCARDACCOUNT .
	?_CREDITCARDACCOUNT <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/Mid-level-ontology.owl#CreditCardAccount> .
	?bookpersoncreditcardaccount__service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_BOOK .
	?_BOOK <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#Book> .
	?bookpersoncreditcardaccount__service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_PERSON .
	?_PERSON <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#Person> .
	?_CREDITCARDACCOUNT <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/ontosem.owl#Accepted> .
	?_PERSON <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
	?_PERSON <http://127.0.0.1/ontology/Mid-level-ontology.owl#accountHolder> ?_CREDITCARDACCOUNT .
	?_BOOK <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/ontosem.owl#be-available> .
}

# bookperson_price_service
CONSTRUCT {
	<http://127.0.0.1/service#bookperson_price_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?bookperson_price_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_BOOK .
	?_BOOK <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#Book> .
	?bookperson_price_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_PERSON .
	?_PERSON <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#Person> .
	?bookperson_price_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_PRICE .
	?_PRICE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/concept.owl#Price> .
	?_PERSON <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
}

# bookperson__service
CONSTRUCT {
	<http://127.0.0.1/service#bookperson__service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?bookperson__service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_PERSON .
	?_PERSON <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#Person> .
	?bookperson__service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_BOOK .
	?_BOOK <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#Book> .
	?_PERSON <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
}

# bookusercreditcardaccount__service
CONSTRUCT {
	<http://127.0.0.1/service#bookusercreditcardaccount__service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?bookusercreditcardaccount__service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_CREDITCARDACCOUNT .
	?_CREDITCARDACCOUNT <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/Mid-level-ontology.owl#CreditCardAccount> .
	?bookusercreditcardaccount__service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_BOOK .
	?_BOOK <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#Book> .
	?bookusercreditcardaccount__service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_USER .
	?_USER <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#User> .
	?_CREDITCARDACCOUNT <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/ontosem.owl#Accepted> .
	?_USER <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
	?_USER <http://127.0.0.1/ontology/Mid-level-ontology.owl#accountHolder> ?_CREDITCARDACCOUNT .
}

# book_authorprice_service
CONSTRUCT {
	<http://127.0.0.1/service#book_authorprice_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?book_authorprice_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_BOOK .
	?_BOOK <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#Book> .
	?book_authorprice_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_AUTHOR .
	?_AUTHOR <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#Author> .
	?book_authorprice_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_PRICE .
	?_PRICE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/concept.owl#Price> .
	<http://www.w3.org/2002/07/owl#AllDifferent> <http://www.w3.org/2002/07/owl#distinctMembers> ?var8 .
	?var8 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> <http://127.0.0.1/ontology/books.owl#Novel> .
	?var8 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> ?var9 .
	?var9 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> ?_BOOK .
	?var9 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> <http://www.w3.org/1999/02/22-rdf-syntax-ns#nil> .
}

# book_recommendedprice_RegisteredUserservice
CONSTRUCT {
	<http://127.0.0.1/service#book_recommendedprice_RegisteredUserservice> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?book_recommendedprice_RegisteredUserservice <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_BOOK .
	?_BOOK <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#Book> .
	?book_recommendedprice_RegisteredUserservice <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_RECOMMENDEDPRICE .
	?_RECOMMENDEDPRICE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/concept.owl#RecommendedPrice> .
	?_USER <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
}

# book__ShoppingCartservice
CONSTRUCT {
	<http://127.0.0.1/service#book__ShoppingCartservice> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?book__ShoppingCartservice <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_BOOK .
	?_BOOK <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#Book> .
	?_BOOK <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/ontosem.owl#be-available> .
}

# calculateDistanceInMiles
CONSTRUCT {
	<http://127.0.0.1/service#calculateDistanceInMiles> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?calculateDistanceInMiles <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_LATITUDE1 .
	?_LATITUDE1 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#latitude> .
	?calculateDistanceInMiles <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_LONGITUDE1 .
	?_LONGITUDE1 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#longitude> .
	?calculateDistanceInMiles <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_LATITUDE2 .
	?_LATITUDE2 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#latitude> .
	?calculateDistanceInMiles <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_LONGITUDE2 .
	?_LONGITUDE2 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#longitude> .
	?calculateDistanceInMiles <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_DISTANCE .
	?_DISTANCE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#GeographicDistance> .
	<http://www.w3.org/2002/07/owl#AllDifferent> <http://www.w3.org/2002/07/owl#distinctMembers> ?var10 .
	?var10 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> ?_LATITUDE1 .
	?var10 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> ?var11 .
	?var11 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> ?_LATITUDE2 .
	?var11 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> <http://www.w3.org/1999/02/22-rdf-syntax-ns#nil> .
	<http://www.w3.org/2002/07/owl#AllDifferent> <http://www.w3.org/2002/07/owl#distinctMembers> ?var12 .
	?var12 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> ?_LONGITUDE1 .
	?var12 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> ?var13 .
	?var13 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> ?_LONGITUDE2 .
	?var13 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> <http://www.w3.org/1999/02/22-rdf-syntax-ns#nil> .
}

# calculateDistanceUsingSphericalGeometry
CONSTRUCT {
	<http://127.0.0.1/service#calculateDistanceUsingSphericalGeometry> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?calculateDistanceUsingSphericalGeometry <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_LATITUDE1 .
	?_LATITUDE1 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#latitude> .
	?calculateDistanceUsingSphericalGeometry <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_LONGITUDE1 .
	?_LONGITUDE1 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#longitude> .
	?calculateDistanceUsingSphericalGeometry <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_LATITUDE2 .
	?_LATITUDE2 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#latitude> .
	?calculateDistanceUsingSphericalGeometry <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_LONGITUDE2 .
	?_LONGITUDE2 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#longitude> .
	?calculateDistanceUsingSphericalGeometry <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_DISTANCE .
	?_DISTANCE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#GeographicDistance> .
	<http://www.w3.org/2002/07/owl#AllDifferent> <http://www.w3.org/2002/07/owl#distinctMembers> ?var14 .
	?var14 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> ?_LATITUDE1 .
	?var14 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> ?var15 .
	?var15 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> ?_LATITUDE2 .
	?var15 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> <http://www.w3.org/1999/02/22-rdf-syntax-ns#nil> .
	<http://www.w3.org/2002/07/owl#AllDifferent> <http://www.w3.org/2002/07/owl#distinctMembers> ?var16 .
	?var16 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> ?_LONGITUDE1 .
	?var16 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> ?var17 .
	?var17 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> ?_LONGITUDE2 .
	?var17 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> <http://www.w3.org/1999/02/22-rdf-syntax-ns#nil> .
}

# calculateSunriseTime
CONSTRUCT {
	<http://127.0.0.1/service#calculateSunriseTime> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?calculateSunriseTime <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_LICENSEKEY .
	?_LICENSEKEY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#Code> .
	?calculateSunriseTime <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_LATITUDE .
	?_LATITUDE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#latitude> .
	?calculateSunriseTime <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_LONGITUDE .
	?_LONGITUDE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#longitude> .
	?calculateSunriseTime <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_DATE .
	?_DATE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#Date> .
	?calculateSunriseTime <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_SUNRISE .
	?_SUNRISE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#Sunrise> .
	?_LICENSEKEY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
}

# calculatorDistanceSphericalLawOfCosines
CONSTRUCT {
	<http://127.0.0.1/service#calculatorDistanceSphericalLawOfCosines> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?calculatorDistanceSphericalLawOfCosines <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_LATITUDE1 .
	?_LATITUDE1 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#latitude> .
	?calculatorDistanceSphericalLawOfCosines <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_LONGITUDE1 .
	?_LONGITUDE1 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#longitude> .
	?calculatorDistanceSphericalLawOfCosines <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_LATITUDE2 .
	?_LATITUDE2 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#latitude> .
	?calculatorDistanceSphericalLawOfCosines <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_LONGITUDE2 .
	?_LONGITUDE2 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#longitude> .
	?calculatorDistanceSphericalLawOfCosines <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_DISTANCE .
	?_DISTANCE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#GeographicDistance> .
	<http://www.w3.org/2002/07/owl#AllDifferent> <http://www.w3.org/2002/07/owl#distinctMembers> ?var18 .
	?var18 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> ?_LATITUDE1 .
	?var18 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> ?var19 .
	?var19 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> ?_LATITUDE2 .
	?var19 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> <http://www.w3.org/1999/02/22-rdf-syntax-ns#nil> .
	<http://www.w3.org/2002/07/owl#AllDifferent> <http://www.w3.org/2002/07/owl#distinctMembers> ?var20 .
	?var20 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> ?_LONGITUDE1 .
	?var20 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> ?var21 .
	?var21 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> ?_LONGITUDE2 .
	?var21 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> <http://www.w3.org/1999/02/22-rdf-syntax-ns#nil> .
}

# checkAndLookupAddress
CONSTRUCT {
	<http://127.0.0.1/service#checkAndLookupAddress> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?checkAndLookupAddress <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_LICENSEKEY .
	?_LICENSEKEY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#Code> .
	?checkAndLookupAddress <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_ADDRESS .
	?_ADDRESS <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#Address> .
	?checkAndLookupAddress <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_CITY .
	?_CITY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#City> .
	?checkAndLookupAddress <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_STATE .
	?_STATE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#State> .
	?checkAndLookupAddress <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_COUNTRY .
	?_COUNTRY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#Country> .
	?checkAndLookupAddress <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_POSTALCODE .
	?_POSTALCODE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#PostalCode> .
	?checkAndLookupAddress <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_TIMEZONE .
	?_TIMEZONE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#TimeZone> .
	?checkAndLookupAddress <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_LATITUDE .
	?_LATITUDE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#latitude> .
	?checkAndLookupAddress <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_LONGITUDE .
	?_LONGITUDE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#longitude> .
	?checkAndLookupAddress <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_AREA_PHONECODE .
	?_AREA_PHONECODE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#PhoneCode> .
	?checkAndLookupAddress <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_COUNTY .
	?_COUNTY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#County> .
	?_LICENSEKEY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
	?_CITY <http://127.0.0.1/ontology/protont.owl#locatedIn> ?_STATE .
	?_STATE <http://127.0.0.1/ontology/protont.owl#locatedIn> ?_COUNTRY .
}

# citycity_arrowfigure_service
CONSTRUCT {
	<http://127.0.0.1/service#citycity_arrowfigure_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?citycity_arrowfigure_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_CITY1 .
	?_CITY1 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/portal.owl#City> .
	?citycity_arrowfigure_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_CITY2 .
	?_CITY2 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/portal.owl#City> .
	?citycity_arrowfigure_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_ARROWFIGURE .
	?_ARROWFIGURE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/Mid-level-ontology.owl#ArrowFigure> .
	<http://www.w3.org/2002/07/owl#AllDifferent> <http://www.w3.org/2002/07/owl#distinctMembers> ?var22 .
	?var22 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> ?_CITY1 .
	?var22 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> ?var23 .
	?var23 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> ?_CITY2 .
	?var23 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> <http://www.w3.org/1999/02/22-rdf-syntax-ns#nil> .
}

# citycity_map_service
CONSTRUCT {
	<http://127.0.0.1/service#citycity_map_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?citycity_map_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_CITY1 .
	?_CITY1 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/portal.owl#City> .
	?citycity_map_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_CITY2 .
	?_CITY2 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/portal.owl#City> .
	?citycity_map_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_MAP .
	?_MAP <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/Mid-level-ontology.owl#Map> .
	<http://www.w3.org/2002/07/owl#AllDifferent> <http://www.w3.org/2002/07/owl#distinctMembers> ?var24 .
	?var24 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> ?_CITY1 .
	?var24 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> ?var25 .
	?var25 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> ?_CITY2 .
	?var25 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> <http://www.w3.org/1999/02/22-rdf-syntax-ns#nil> .
}

# citycountryduration__HotelReserveservice
CONSTRUCT {
	<http://127.0.0.1/service#citycountryduration__HotelReserveservice> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?citycountryduration__HotelReserveservice <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_DURATION .
	?_DURATION <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/support.owl#Duration> .
	?citycountryduration__HotelReserveservice <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_COUNTRY .
	?_COUNTRY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/portal.owl#Country> .
	?citycountryduration__HotelReserveservice <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_CITY .
	?_CITY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/travel.owl#City> .
	?_CITY <http://127.0.0.1/ontology/protont.owl#locatedIn> ?_COUNTRY .
}

# citycountry_accommodation_service
CONSTRUCT {
	<http://127.0.0.1/service#citycountry_accommodation_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?citycountry_accommodation_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_COUNTRY .
	?_COUNTRY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/portal.owl#Country> .
	?citycountry_accommodation_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_CITY .
	?_CITY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/travel.owl#City> .
	?citycountry_accommodation_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_ACCOMMODATION .
	?_ACCOMMODATION <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/travel.owl#Accommodation> .
	?_CITY <http://127.0.0.1/ontology/protont.owl#locatedIn> ?_COUNTRY .
}

# citycountry_destinationhotel_service
CONSTRUCT {
	<http://127.0.0.1/service#citycountry_destinationhotel_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?citycountry_destinationhotel_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_COUNTRY .
	?_COUNTRY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/portal.owl#Country> .
	?citycountry_destinationhotel_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_CITY .
	?_CITY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/travel.owl#City> .
	?citycountry_destinationhotel_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_DESTINATION .
	?_DESTINATION <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/travel.owl#Destination> .
	?citycountry_destinationhotel_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_HOTEL .
	?_HOTEL <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/travel.owl#Hotel> .
	?_CITY <http://127.0.0.1/ontology/protont.owl#locatedIn> ?_COUNTRY .
}

# citycountry_hotel_service
CONSTRUCT {
	<http://127.0.0.1/service#citycountry_hotel_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?citycountry_hotel_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_COUNTRY .
	?_COUNTRY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/portal.owl#Country> .
	?citycountry_hotel_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_CITY .
	?_CITY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/portal.owl#City> .
	?citycountry_hotel_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_HOTEL .
	?_HOTEL <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/travel.owl#Hotel> .
	?_CITY <http://127.0.0.1/ontology/protont.owl#locatedIn> ?_COUNTRY .
}

# citycountry_skilledoccupation_service
CONSTRUCT {
	<http://127.0.0.1/service#citycountry_skilledoccupation_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?citycountry_skilledoccupation_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_COUNTRY .
	?_COUNTRY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/portal.owl#Country> .
	?citycountry_skilledoccupation_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_CITY .
	?_CITY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/SUMO.owl#City> .
	?citycountry_skilledoccupation_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_SKILLEDOCCUPATION .
	?_SKILLEDOCCUPATION <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/Mid-level-ontology.owl#SkilledOccupation> .
	?_CITY <http://127.0.0.1/ontology/protont.owl#locatedIn> ?_COUNTRY .
}

# city_hotel_Germanservice
CONSTRUCT {
	<http://127.0.0.1/service#city_hotel_Germanservice> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?city_hotel_Germanservice <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_CITY .
	?_CITY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/portal.owl#City> .
	?city_hotel_Germanservice <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_HOTEL .
	?_HOTEL <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/travel.owl#Hotel> .
	?_CITY <http://127.0.0.1/ontology/protont.owl#locatedIn> ?_GERMANY .
}

# city_hotel_Saarlandservice
CONSTRUCT {
	<http://127.0.0.1/service#city_hotel_Saarlandservice> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?city_hotel_Saarlandservice <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_CITY .
	?_CITY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/travel.owl#City> .
	?city_hotel_Saarlandservice <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_HOTEL .
	?_HOTEL <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/travel.owl#Hotel> .
	?_CITY <http://127.0.0.1/ontology/protont.owl#locatedIn> ?_SAARLAND .
}

# city_state_ZipCodes
CONSTRUCT {
	<http://127.0.0.1/service#city_state_ZipCodes> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?city_state_ZipCodes <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_LICENSEKEY .
	?_LICENSEKEY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#Code> .
	?city_state_ZipCodes <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_CITY .
	?_CITY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#City> .
	?city_state_ZipCodes <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_STATE .
	?_STATE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#State> .
	?city_state_ZipCodes <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_ZIPCODE .
	?_ZIPCODE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#US5DigitZipCode> .
	?_LICENSEKEY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
	?_CITY <http://127.0.0.1/ontology/protont.owl#locatedIn> ?_STATE .
}

# close_door
CONSTRUCT {
	<http://127.0.0.1/service#close_door> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?close_door <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?Door .
	?Door <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#Door> .
	?Door <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#Open> .
	?Door <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#Unlocked> .
}

# countrycapital-city_hotel_service
CONSTRUCT {
	<http://127.0.0.1/service#countrycapital-city_hotel_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?countrycapital_city_hotel_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_CAPITAL_CITY .
	?_CAPITAL_CITY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/portal.owl#Capital-City> .
	?countrycapital_city_hotel_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_COUNTRY .
	?_COUNTRY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/portal.owl#Country> .
	?countrycapital_city_hotel_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_HOTEL .
	?_HOTEL <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/travel.owl#Hotel> .
	?_CAPITAL_CITY <http://127.0.0.1/ontology/protont.owl#locatedIn> ?_COUNTRY .
}

# countrycity_hotel_service
CONSTRUCT {
	<http://127.0.0.1/service#countrycity_hotel_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?countrycity_hotel_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_CITY .
	?_CITY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/portal.owl#City> .
	?countrycity_hotel_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_COUNTRY .
	?_COUNTRY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/portal.owl#Country> .
	?countrycity_hotel_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_HOTEL .
	?_HOTEL <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/travel.owl#Hotel> .
	?_CITY <http://127.0.0.1/ontology/protont.owl#locatedIn> ?_COUNTRY .
}

# countrycity_luxuryhotel_Gelservice
CONSTRUCT {
	<http://127.0.0.1/service#countrycity_luxuryhotel_Gelservice> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?countrycity_luxuryhotel_Gelservice <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_CITY .
	?_CITY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/travel.owl#City> .
	?countrycity_luxuryhotel_Gelservice <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_COUNTRY .
	?_COUNTRY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/portal.owl#Country> .
	?countrycity_luxuryhotel_Gelservice <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_LUXURYHOTEL .
	?_LUXURYHOTEL <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/travel.owl#LuxuryHotel> .
	?_CITY <http://127.0.0.1/ontology/protont.owl#locatedIn> ?_COUNTRY .
}

# countrycity_luxuryhotel_service
CONSTRUCT {
	<http://127.0.0.1/service#countrycity_luxuryhotel_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?countrycity_luxuryhotel_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_CITY .
	?_CITY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/travel.owl#City> .
	?countrycity_luxuryhotel_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_COUNTRY .
	?_COUNTRY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/portal.owl#Country> .
	?countrycity_luxuryhotel_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_LUXURYHOTEL .
	?_LUXURYHOTEL <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/travel.owl#LuxuryHotel> .
	?_CITY <http://127.0.0.1/ontology/protont.owl#locatedIn> ?_COUNTRY .
}

# countrycity_sportshotel_service
CONSTRUCT {
	<http://127.0.0.1/service#countrycity_sportshotel_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?countrycity_sportshotel_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_CITY .
	?_CITY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/travel.owl#City> .
	?countrycity_sportshotel_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_COUNTRY .
	?_COUNTRY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/portal.owl#Country> .
	?countrycity_sportshotel_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_SPORTS .
	?_SPORTS <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/travel.owl#Sports> .
	?countrycity_sportshotel_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_HOTEL .
	?_HOTEL <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/travel.owl#Hotel> .
	?_CITY <http://127.0.0.1/ontology/protont.owl#locatedIn> ?_COUNTRY .
}

# countryvillage_hotel_service
CONSTRUCT {
	<http://127.0.0.1/service#countryvillage_hotel_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?countryvillage_hotel_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_VILLAGE .
	?_VILLAGE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/portal.owl#Village> .
	?countryvillage_hotel_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_COUNTRY .
	?_COUNTRY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/portal.owl#Country> .
	?countryvillage_hotel_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_HOTEL .
	?_HOTEL <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/travel.owl#Hotel> .
	?_VILLAGE <http://127.0.0.1/ontology/protont.owl#locatedIn> ?_COUNTRY .
}

# DJob_service
CONSTRUCT {
	<http://127.0.0.1/service#DJob_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?DJob_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_COUNTRY .
	?_COUNTRY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/portal.owl#Country> .
	?DJob_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_SKILLEDOCCUPATION .
	?_SKILLEDOCCUPATION <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/Mid-level-ontology.owl#SkilledOccupation> .
	?DJob_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_TIMEDURATION .
	?_TIMEDURATION <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/SUMO.owl#TimeDuration> .
	?_USER <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
}

# durationcountrycity_hotel_service
CONSTRUCT {
	<http://127.0.0.1/service#durationcountrycity_hotel_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?durationcountrycity_hotel_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_CITY .
	?_CITY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/travel.owl#City> .
	?durationcountrycity_hotel_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_COUNTRY .
	?_COUNTRY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/portal.owl#Country> .
	?durationcountrycity_hotel_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_DURATION .
	?_DURATION <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/support.owl#Duration> .
	?durationcountrycity_hotel_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_HOTEL .
	?_HOTEL <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/travel.owl#Hotel> .
	?_CITY <http://127.0.0.1/ontology/protont.owl#locatedIn> ?_COUNTRY .
}

# durationgeopolitical-entitycity_accommodation_service
CONSTRUCT {
	<http://127.0.0.1/service#durationgeopolitical-entitycity_accommodation_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?durationgeopolitical_entitycity_accommodation_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_CITY .
	?_CITY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/travel.owl#City> .
	?durationgeopolitical_entitycity_accommodation_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_GEOPOLITICAL_ENTITY .
	?_GEOPOLITICAL_ENTITY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/portal.owl#Geopolitical-Entity> .
	?durationgeopolitical_entitycity_accommodation_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_DURATION .
	?_DURATION <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/support.owl#Duration> .
	?durationgeopolitical_entitycity_accommodation_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_ACCOMMODATION .
	?_ACCOMMODATION <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/travel.owl#Accommodation> .
	?_CITY <http://127.0.0.1/ontology/protont.owl#locatedIn> ?_GEOPOLITICAL_ENTITY .
}

# durationgeopolitical-entitycity_bedandbreakfast_service
CONSTRUCT {
	<http://127.0.0.1/service#durationgeopolitical-entitycity_bedandbreakfast_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?durationgeopolitical_entitycity_bedandbreakfast_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_CITY .
	?_CITY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/travel.owl#City> .
	?durationgeopolitical_entitycity_bedandbreakfast_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_GEOPOLITICAL_ENTITY .
	?_GEOPOLITICAL_ENTITY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/portal.owl#Geopolitical-Entity> .
	?durationgeopolitical_entitycity_bedandbreakfast_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_DURATION .
	?_DURATION <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/support.owl#Duration> .
	?durationgeopolitical_entitycity_bedandbreakfast_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_BEDANDBREAKFAST .
	?_BEDANDBREAKFAST <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/travel.owl#BedAndBreakfast> .
	?_CITY <http://127.0.0.1/ontology/protont.owl#locatedIn> ?_GEOPOLITICAL_ENTITY .
}

# durationgeopolitical-entitycity_hotel_service
CONSTRUCT {
	<http://127.0.0.1/service#durationgeopolitical-entitycity_hotel_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?durationgeopolitical_entitycity_hotel_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_CITY .
	?_CITY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/travel.owl#City> .
	?durationgeopolitical_entitycity_hotel_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_GEOPOLITICAL_ENTITY .
	?_GEOPOLITICAL_ENTITY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/portal.owl#Geopolitical-Entity> .
	?durationgeopolitical_entitycity_hotel_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_DURATION .
	?_DURATION <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/support.owl#Duration> .
	?durationgeopolitical_entitycity_hotel_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_HOTEL .
	?_HOTEL <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/travel.owl#Hotel> .
	?_CITY <http://127.0.0.1/ontology/protont.owl#locatedIn> ?_GEOPOLITICAL_ENTITY .
}

# EBookOrder1
CONSTRUCT {
	<http://127.0.0.1/service#EBookOrder1> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?EBookOrder1 <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?EBookRequest .
	?EBookRequest <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#Title> .
	?EBookOrder1 <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?UserAccount .
	?UserAccount <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#User> .
	?EBookOrder1 <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?EBook .
	?EBook <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#Book> .
	?EBookRequest <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/ontosem.owl#Accepted> .
	?UserAccount <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
}

# EBookOrder2
CONSTRUCT {
	<http://127.0.0.1/service#EBookOrder2> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?EBookOrder2 <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?EBookRequest .
	?EBookRequest <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#Title> .
	?EBookOrder2 <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?UserAccount .
	?UserAccount <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#User> .
	?EBookOrder2 <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?EBook .
	?EBook <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#Book> .
	?EBookRequest <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/ontosem.owl#Accepted> .
	?UserAccount <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
}

# EBookOrder3
CONSTRUCT {
	<http://127.0.0.1/service#EBookOrder3> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?EBookOrder3 <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?EBookRequest .
	?EBookRequest <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#Title> .
	?EBookOrder3 <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?UserAccount .
	?UserAccount <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#User> .
	?EBookOrder3 <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?EBook .
	?EBook <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#Book> .
	?EBookRequest <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/ontosem.owl#Accepted> .
	?UserAccount <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
}

# fall_down_pill
CONSTRUCT {
	<http://127.0.0.1/service#fall_down_pill> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?fall_down_pill <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?MesseModul .
	?MesseModul <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#MesseModul> .
	?fall_down_pill <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?Slider .
	?Slider <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#Slider> .
	?fall_down_pill <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?Cup .
	?Cup <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#Cup> .
	?fall_down_pill <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?UltraSoundSensor .
	?UltraSoundSensor <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#UltraSoundSensor> .
	?fall_down_pill <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?Pill .
	?Pill <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#Pill> .
	?fall_down_pill <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?SliderZone .
	?SliderZone <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/spatial_ontology.owl#SpatialZone> .
	?fall_down_pill <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?CupZone .
	?CupZone <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/spatial_ontology.owl#SpatialZone> .
	?Slider <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#Down> .
	?UltraSoundSensor <http://127.0.0.1/ontology/messemodul.owl#detectsCup> ?Cup .
	?MesseModul <http://127.0.0.1/ontology/messemodul.owl#consistsOf> ?Slider .
	?MesseModul <http://127.0.0.1/ontology/messemodul.owl#consistsOf> ?UltraSoundSensor .
	?Slider <http://127.0.0.1/ontology/messemodul.owl#hasCargoArea> ?SliderZone .
	?Cup <http://127.0.0.1/ontology/messemodul.owl#hasCargoArea> ?CupZone .
	?Pill <http://127.0.0.1/ontology/spatial_ontology.owl#isLocatedIn> ?SliderZone .
}

# fantansynoveluser_price_service
CONSTRUCT {
	<http://127.0.0.1/service#fantansynoveluser_price_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?fantansynoveluser_price_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_USER .
	?_USER <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#User> .
	?fantansynoveluser_price_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_FANTANSYNOVEL .
	?_FANTANSYNOVEL <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#FantansyNovel> .
	?fantansynoveluser_price_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_PRICE .
	?_PRICE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/concept.owl#Price> .
	?_USER <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
}

# fill_pills
CONSTRUCT {
	<http://127.0.0.1/service#fill_pills> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?fill_pills <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?Magazine .
	?Magazine <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#Magazine> .
	?Magazine <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#Empty> .
}

# findNearbyPostalCodes
CONSTRUCT {
	<http://127.0.0.1/service#findNearbyPostalCodes> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?findNearbyPostalCodes <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_LICENSEKEY .
	?_LICENSEKEY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#Code> .
	?findNearbyPostalCodes <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_LATITUDE .
	?_LATITUDE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#latitude> .
	?findNearbyPostalCodes <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_LONGITUDE .
	?_LONGITUDE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#longitude> .
	?findNearbyPostalCodes <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_RADIUS .
	?_RADIUS <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#GeographicDistanceKilometerLengthUnit> .
	?findNearbyPostalCodes <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_MAX_RESULTS .
	?_MAX_RESULTS <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#Number> .
	?findNearbyPostalCodes <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_POSTALCODE .
	?_POSTALCODE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#PostalCode> .
	?_LICENSEKEY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
}

# findNearbyWikipediaArticles
CONSTRUCT {
	<http://127.0.0.1/service#findNearbyWikipediaArticles> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?findNearbyWikipediaArticles <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_LICENSEKEY .
	?_LICENSEKEY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#Code> .
	?findNearbyWikipediaArticles <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_LANGUAGE .
	?_LANGUAGE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#Language> .
	?findNearbyWikipediaArticles <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_COUNTRYCODE .
	?_COUNTRYCODE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#ISOCountryCode> .
	?findNearbyWikipediaArticles <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_RADIUS .
	?_RADIUS <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#GeographicDistanceKilometerLengthUnit> .
	?findNearbyWikipediaArticles <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_MAX_RESULTS .
	?_MAX_RESULTS <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#Number> .
	?findNearbyWikipediaArticles <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_POSTALCODE .
	?_POSTALCODE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#PostalCode> .
	?findNearbyWikipediaArticles <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_LATITUDE .
	?_LATITUDE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#latitude> .
	?findNearbyWikipediaArticles <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_LONGITUDE .
	?_LONGITUDE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#longitude> .
	?findNearbyWikipediaArticles <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_DISTANCE .
	?_DISTANCE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#GeographicDistance> .
	?findNearbyWikipediaArticles <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_WIKIPEDIA_ARTICLE .
	?_WIKIPEDIA_ARTICLE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#Article> .
	?_LICENSEKEY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
}

# findPlaceNamePostalCode
CONSTRUCT {
	<http://127.0.0.1/service#findPlaceNamePostalCode> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?findPlaceNamePostalCode <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_POSTALCODE .
	?_POSTALCODE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#PostalCode> .
	?findPlaceNamePostalCode <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_PLACENAME .
	?_PLACENAME <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#PopulatedPlace> .
	?findPlaceNamePostalCode <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_COUNTRYCODE .
	?_COUNTRYCODE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#ISOCountryCode> .
	?findPlaceNamePostalCode <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_LICENSEKEY .
	?_LICENSEKEY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#Code> .
	?findPlaceNamePostalCode <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_POSTALCODE_OUT .
	?_POSTALCODE_OUT <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#PostalCode> .
	?findPlaceNamePostalCode <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_PLACENAME_OUT .
	?_PLACENAME_OUT <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#PopulatedPlace> .
	?findPlaceNamePostalCode <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_COUNTRYCODE_OUT .
	?_COUNTRYCODE_OUT <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#ISOCountryCode> .
	?findPlaceNamePostalCode <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_LATITUDE .
	?_LATITUDE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#latitude> .
	?findPlaceNamePostalCode <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_LONGITUDE .
	?_LONGITUDE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#longitude> .
	?_LICENSEKEY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
}

# flip_down_slider
CONSTRUCT {
	<http://127.0.0.1/service#flip_down_slider> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?flip_down_slider <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?MesseModul .
	?MesseModul <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#MesseModul> .
	?flip_down_slider <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?Slider .
	?Slider <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#Slider> .
	?flip_down_slider <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?Cup .
	?Cup <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#Cup> .
	?flip_down_slider <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?UltraSoundSensor .
	?UltraSoundSensor <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#UltraSoundSensor> .
	?flip_down_slider <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?ContactSensor .
	?ContactSensor <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#ContactSensor> .
	?flip_down_slider <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?Carriage .
	?Carriage <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#Carriage> .
	?flip_down_slider <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?CarriageSpatialZone .
	?CarriageSpatialZone <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/spatial_ontology.owl#SpatialZone> .
	?Slider <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#Up> .
	?ContactSensor <http://127.0.0.1/ontology/messemodul.owl#detectsCarriage> ?Carriage .
	?MesseModul <http://127.0.0.1/ontology/messemodul.owl#consistsOf> ?Slider .
	?MesseModul <http://127.0.0.1/ontology/messemodul.owl#consistsOf> ?UltraSoundSensor .
	?UltraSoundSensor <http://127.0.0.1/ontology/messemodul.owl#detectsCup> ?Cup .
	?Carriage <http://127.0.0.1/ontology/messemodul.owl#hasCargoArea> ?CarriageSpatialZone .
	?Cup <http://127.0.0.1/ontology/spatial_ontology.owl#isLocatedIn> ?CarriageSpatialZone .
	?MesseModul <http://127.0.0.1/ontology/messemodul.owl#consistsOf> ?ContactSensor .
}

# flip_slider
CONSTRUCT {
	<http://127.0.0.1/service#flip_slider> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?flip_slider <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?Slider .
	?Slider <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#Slider> .
	?flip_slider <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?BluePill .
	?BluePill <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#BluePill> .
	?flip_slider <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?Area .
	?Area <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/spatial_ontology.owl#SpatialZone> .
	?Slider <http://127.0.0.1/ontology/messemodul.owl#hasCargoArea> ?Area .
	?BluePill <http://127.0.0.1/ontology/messemodul.owl#isLocatedIn> ?Area .
}

# flip_up_slider
CONSTRUCT {
	<http://127.0.0.1/service#flip_up_slider> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?flip_up_slider <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?MesseModul .
	?MesseModul <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#MesseModul> .
	?flip_up_slider <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?Slider .
	?Slider <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#Slider> .
	?flip_up_slider <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?Cup .
	?Cup <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#Cup> .
	?flip_up_slider <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?UltraSoundSensor .
	?UltraSoundSensor <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#UltraSoundSensor> .
	?Slider <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#Down> .
	?UltraSoundSensor <http://127.0.0.1/ontology/messemodul.owl#detectsCup> ?Cup .
	?MesseModul <http://127.0.0.1/ontology/messemodul.owl#consistsOf> ?Slider .
	?MesseModul <http://127.0.0.1/ontology/messemodul.owl#consistsOf> ?UltraSoundSensor .
}

# geocodeUSAddress
CONSTRUCT {
	<http://127.0.0.1/service#geocodeUSAddress> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?geocodeUSAddress <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_ADDRESS .
	?_ADDRESS <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#Address> .
	?geocodeUSAddress <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_CITY .
	?_CITY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#City> .
	?geocodeUSAddress <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_STATE .
	?_STATE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#State> .
	?geocodeUSAddress <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_ZIPCODE .
	?_ZIPCODE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#PostalCode> .
	?geocodeUSAddress <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_LATITUDE .
	?_LATITUDE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#latitude> .
	?geocodeUSAddress <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_LONGITUDE .
	?_LONGITUDE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#longitude> .
	?_CITY <http://127.0.0.1/ontology/protont.owl#locatedIn> ?_STATE .
}

# geographical-regiongeographical-region_icon_service
CONSTRUCT {
	<http://127.0.0.1/service#geographical-regiongeographical-region_icon_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?geographical_regiongeographical_region_icon_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_GEOGRAPHICAL_REGION1 .
	?_GEOGRAPHICAL_REGION1 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/portal.owl#Geographical-Region> .
	?geographical_regiongeographical_region_icon_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_GEOGRAPHICAL_REGION2 .
	?_GEOGRAPHICAL_REGION2 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/portal.owl#Geographical-Region> .
	?geographical_regiongeographical_region_icon_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_ICON .
	?_ICON <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/SUMO.owl#Icon> .
	<http://www.w3.org/2002/07/owl#AllDifferent> <http://www.w3.org/2002/07/owl#distinctMembers> ?var26 .
	?var26 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> ?_GEOGRAPHICAL_REGION1 .
	?var26 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> ?var27 .
	?var27 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> ?_GEOGRAPHICAL_REGION2 .
	?var27 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> <http://www.w3.org/1999/02/22-rdf-syntax-ns#nil> .
}

# geographical-regiongeographical-region_map_Gorgservice
CONSTRUCT {
	<http://127.0.0.1/service#geographical-regiongeographical-region_map_Gorgservice> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?geographical_regiongeographical_region_map_Gorgservice <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_GEOGRAPHICAL_REGION1 .
	?_GEOGRAPHICAL_REGION1 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/portal.owl#Geographical-Region> .
	?geographical_regiongeographical_region_map_Gorgservice <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_GEOGRAPHICAL_REGION2 .
	?_GEOGRAPHICAL_REGION2 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/portal.owl#Geographical-Region> .
	?geographical_regiongeographical_region_map_Gorgservice <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_MAP .
	?_MAP <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/Mid-level-ontology.owl#Map> .
	<http://www.w3.org/2002/07/owl#AllDifferent> <http://www.w3.org/2002/07/owl#distinctMembers> ?var28 .
	?var28 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> ?_GEOGRAPHICAL_REGION1 .
	?var28 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> ?var29 .
	?var29 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> ?_GEOGRAPHICAL_REGION2 .
	?var29 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> <http://www.w3.org/1999/02/22-rdf-syntax-ns#nil> .
}

# geographical-regiongeographical-region_map_service
CONSTRUCT {
	<http://127.0.0.1/service#geographical-regiongeographical-region_map_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?geographical_regiongeographical_region_map_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_GEOGRAPHICAL_REGION1 .
	?_GEOGRAPHICAL_REGION1 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/portal.owl#Geographical-Region> .
	?geographical_regiongeographical_region_map_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_GEOGRAPHICAL_REGION2 .
	?_GEOGRAPHICAL_REGION2 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/portal.owl#Geographical-Region> .
	?geographical_regiongeographical_region_map_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_MAP .
	?_MAP <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/Mid-level-ontology.owl#Map> .
	<http://www.w3.org/2002/07/owl#AllDifferent> <http://www.w3.org/2002/07/owl#distinctMembers> ?var30 .
	?var30 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> ?_GEOGRAPHICAL_REGION1 .
	?var30 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> ?var31 .
	?var31 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> ?_GEOGRAPHICAL_REGION2 .
	?var31 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> <http://www.w3.org/1999/02/22-rdf-syntax-ns#nil> .
}

# getAddressOfLocation
CONSTRUCT {
	<http://127.0.0.1/service#getAddressOfLocation> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?getAddressOfLocation <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_USERID .
	?_USERID <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#UniqueIdentifier> .
	?getAddressOfLocation <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_LATITUDE .
	?_LATITUDE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#latitude> .
	?getAddressOfLocation <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_LONGITUDE .
	?_LONGITUDE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#longitude> .
	?getAddressOfLocation <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_ADDRESS .
	?_ADDRESS <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#Address> .
	?getAddressOfLocation <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_CITY .
	?_CITY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#City> .
	?getAddressOfLocation <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_COUNTRY .
	?_COUNTRY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#Country> .
	?_USERID <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
}

# getAltitudeAboveSeaLevelOfLocation
CONSTRUCT {
	<http://127.0.0.1/service#getAltitudeAboveSeaLevelOfLocation> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?getAltitudeAboveSeaLevelOfLocation <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_USERID .
	?_USERID <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#UniqueIdentifier> .
	?getAltitudeAboveSeaLevelOfLocation <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_LATITUDE .
	?_LATITUDE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#latitude> .
	?getAltitudeAboveSeaLevelOfLocation <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_LONGITUDE .
	?_LONGITUDE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#longitude> .
	?getAltitudeAboveSeaLevelOfLocation <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_ALTITUDE .
	?_ALTITUDE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#AltitudeAboveSeaLevel> .
	?_USERID <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
}

# getAltitudeOfLocation
CONSTRUCT {
	<http://127.0.0.1/service#getAltitudeOfLocation> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?getAltitudeOfLocation <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_USERID .
	?_USERID <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#UniqueIdentifier> .
	?getAltitudeOfLocation <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_LATITUDE .
	?_LATITUDE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#latitude> .
	?getAltitudeOfLocation <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_LONGITUDE .
	?_LONGITUDE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#longitude> .
	?getAltitudeOfLocation <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_LOCATION .
	?_LOCATION <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#Location> .
	?getAltitudeOfLocation <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_ALTITUDE .
	?_ALTITUDE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#AltitudeAboveSeaLevel> .
	?_USERID <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
}

# getATMLocationsInCity
CONSTRUCT {
	<http://127.0.0.1/service#getATMLocationsInCity> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?getATMLocationsInCity <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_LICENSEKEY .
	?_LICENSEKEY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#Code> .
	?getATMLocationsInCity <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_CITY .
	?_CITY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#City> .
	?getATMLocationsInCity <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_STATE .
	?_STATE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#State> .
	?getATMLocationsInCity <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_LATITUDE .
	?_LATITUDE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#latitude> .
	?getATMLocationsInCity <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_LONGITUDE .
	?_LONGITUDE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#longitude> .
	?_LICENSEKEY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
	?_CITY <http://127.0.0.1/ontology/protont.owl#locatedIn> ?_STATE .
}

# getCoordinatesOfAddress
CONSTRUCT {
	<http://127.0.0.1/service#getCoordinatesOfAddress> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?getCoordinatesOfAddress <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_STREET .
	?_STREET <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#Street> .
	?getCoordinatesOfAddress <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_CITY .
	?_CITY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#City> .
	?getCoordinatesOfAddress <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_STATE .
	?_STATE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#State> .
	?getCoordinatesOfAddress <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_COUNTRY .
	?_COUNTRY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#Country> .
	?getCoordinatesOfAddress <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_POSTALCODE .
	?_POSTALCODE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#PostalCode> .
	?getCoordinatesOfAddress <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_ADDRESS .
	?_ADDRESS <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#Address> .
	?getCoordinatesOfAddress <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_LATITUDE .
	?_LATITUDE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#latitude> .
	?getCoordinatesOfAddress <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_LONGITUDE .
	?_LONGITUDE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#longitude> .
	?_CITY <http://127.0.0.1/ontology/protont.owl#locatedIn> ?_STATE .
	?_STATE <http://127.0.0.1/ontology/protont.owl#locatedIn> ?_COUNTRY .
}

# getDistanceBetweenCitiesWorldwide
CONSTRUCT {
	<http://127.0.0.1/service#getDistanceBetweenCitiesWorldwide> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?getDistanceBetweenCitiesWorldwide <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_COUNTRY1 .
	?_COUNTRY1 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#Country> .
	?getDistanceBetweenCitiesWorldwide <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_COUNTRY2 .
	?_COUNTRY2 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#Country> .
	?getDistanceBetweenCitiesWorldwide <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_CITY1 .
	?_CITY1 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#City> .
	?getDistanceBetweenCitiesWorldwide <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_CITY2 .
	?_CITY2 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#City> .
	?getDistanceBetweenCitiesWorldwide <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_STATE1 .
	?_STATE1 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#State> .
	?getDistanceBetweenCitiesWorldwide <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_STATE2 .
	?_STATE2 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#State> .
	?getDistanceBetweenCitiesWorldwide <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_DISTANCE .
	?_DISTANCE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#GeographicDistance> .
	<http://www.w3.org/2002/07/owl#AllDifferent> <http://www.w3.org/2002/07/owl#distinctMembers> ?var32 .
	?var32 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> ?_CITY1 .
	?var32 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> ?var33 .
	?var33 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> ?_CITY2 .
	?var33 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> <http://www.w3.org/1999/02/22-rdf-syntax-ns#nil> .
	?_CITY1 <http://127.0.0.1/ontology/protont.owl#locatedIn> ?_STATE1 .
	?_CITY2 <http://127.0.0.1/ontology/protont.owl#locatedIn> ?_STATE2 .
	?_STATE1 <http://127.0.0.1/ontology/protont.owl#locatedIn> ?_COUNTRY1 .
	?_STATE2 <http://127.0.0.1/ontology/protont.owl#locatedIn> ?_COUNTRY2 .
}

# getDistanceBetweenLocations
CONSTRUCT {
	<http://127.0.0.1/service#getDistanceBetweenLocations> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?getDistanceBetweenLocations <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_LATITUDE1 .
	?_LATITUDE1 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#latitude> .
	?getDistanceBetweenLocations <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_LONGITUDE1 .
	?_LONGITUDE1 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#longitude> .
	?getDistanceBetweenLocations <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_LATITUDE2 .
	?_LATITUDE2 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#latitude> .
	?getDistanceBetweenLocations <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_LONGITUDE2 .
	?_LONGITUDE2 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#longitude> .
	?getDistanceBetweenLocations <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_DISTANCE .
	?_DISTANCE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#GeographicDistance> .
	<http://www.w3.org/2002/07/owl#AllDifferent> <http://www.w3.org/2002/07/owl#distinctMembers> ?var34 .
	?var34 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> ?_LATITUDE1 .
	?var34 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> ?var35 .
	?var35 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> ?_LATITUDE2 .
	?var35 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> <http://www.w3.org/1999/02/22-rdf-syntax-ns#nil> .
	<http://www.w3.org/2002/07/owl#AllDifferent> <http://www.w3.org/2002/07/owl#distinctMembers> ?var36 .
	?var36 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> ?_LONGITUDE1 .
	?var36 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> ?var37 .
	?var37 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> ?_LONGITUDE2 .
	?var37 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> <http://www.w3.org/1999/02/22-rdf-syntax-ns#nil> .
}

# getDistanceBetweenPlaces
CONSTRUCT {
	<http://127.0.0.1/service#getDistanceBetweenPlaces> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?getDistanceBetweenPlaces <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_USCITY1 .
	?_USCITY1 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#City> .
	?getDistanceBetweenPlaces <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_USCITY2 .
	?_USCITY2 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#City> .
	?getDistanceBetweenPlaces <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_USSTATECODE1 .
	?_USSTATECODE1 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#USStateCode> .
	?getDistanceBetweenPlaces <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_USSTATECODE2 .
	?_USSTATECODE2 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#USStateCode> .
	?getDistanceBetweenPlaces <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_DISTANCE .
	?_DISTANCE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#GeographicDistance> .
	<http://www.w3.org/2002/07/owl#AllDifferent> <http://www.w3.org/2002/07/owl#distinctMembers> ?var38 .
	?var38 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> ?_USCITY1 .
	?var38 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> ?var39 .
	?var39 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> ?_USCITY2 .
	?var39 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> <http://www.w3.org/1999/02/22-rdf-syntax-ns#nil> .
}

# getDrivingDirections
CONSTRUCT {
	<http://127.0.0.1/service#getDrivingDirections> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?getDrivingDirections <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_USERID .
	?_USERID <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#UniqueIdentifier> .
	?getDrivingDirections <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_START_LATITUDE .
	?_START_LATITUDE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#latitude> .
	?getDrivingDirections <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_START_LONGITUDE .
	?_START_LONGITUDE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#longitude> .
	?getDrivingDirections <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_END_LATITUDE .
	?_END_LATITUDE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#latitude> .
	?getDrivingDirections <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_END_LONGITUDE .
	?_END_LONGITUDE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#longitude> .
	?getDrivingDirections <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_IMAGE_WIDTH .
	?_IMAGE_WIDTH <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/Units.owl#Pixel> .
	?getDrivingDirections <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_IMAGE_HEIGHT .
	?_IMAGE_HEIGHT <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/Units.owl#Pixel> .
	?getDrivingDirections <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_LANGUAGE .
	?_LANGUAGE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#Language> .
	?getDrivingDirections <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_TOTAL_DISTANCE .
	?_TOTAL_DISTANCE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#GeographicDistance> .
	?getDrivingDirections <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_TOTAL_DRIVING_TIME .
	?_TOTAL_DRIVING_TIME <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#TimeUnit> .
	?getDrivingDirections <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_DIRECTIONS .
	?_DIRECTIONS <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#DrivingDirections> .
	?getDrivingDirections <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_MAP .
	?_MAP <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#Map> .
	<http://www.w3.org/2002/07/owl#AllDifferent> <http://www.w3.org/2002/07/owl#distinctMembers> ?var40 .
	?var40 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> ?_START_LATITUDE .
	?var40 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> ?var41 .
	?var41 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> ?_END_LATITUDE .
	?var41 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> <http://www.w3.org/1999/02/22-rdf-syntax-ns#nil> .
	<http://www.w3.org/2002/07/owl#AllDifferent> <http://www.w3.org/2002/07/owl#distinctMembers> ?var42 .
	?var42 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> ?_START_LONGITUDE .
	?var42 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> ?var43 .
	?var43 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> ?_END_LONGITUDE .
	?var43 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> <http://www.w3.org/1999/02/22-rdf-syntax-ns#nil> .
	?_USERID <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
}

# getElevationFromLocation
CONSTRUCT {
	<http://127.0.0.1/service#getElevationFromLocation> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?getElevationFromLocation <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_USERID .
	?_USERID <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#UniqueIdentifier> .
	?getElevationFromLocation <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_LATITUDE .
	?_LATITUDE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#latitude> .
	?getElevationFromLocation <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_LONGITUDE .
	?_LONGITUDE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#longitude> .
	?getElevationFromLocation <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_ELEVATION .
	?_ELEVATION <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#AltitudeAboveSeaLevel> .
	?_USERID <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
}

# getGeographicAreaOfZipCode
CONSTRUCT {
	<http://127.0.0.1/service#getGeographicAreaOfZipCode> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?getGeographicAreaOfZipCode <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_USERID .
	?_USERID <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#UniqueIdentifier> .
	?getGeographicAreaOfZipCode <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_ZIPCODE .
	?_ZIPCODE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#ZipCode> .
	?getGeographicAreaOfZipCode <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_GEOGRAPHIC_AREA .
	?_GEOGRAPHIC_AREA <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#GeographicArea> .
	?getGeographicAreaOfZipCode <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_CITY .
	?_CITY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#City> .
	?getGeographicAreaOfZipCode <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_COUNTRY .
	?_COUNTRY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#Country> .
	?_USERID <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
}

# getListOfMatchingCities
CONSTRUCT {
	<http://127.0.0.1/service#getListOfMatchingCities> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?getListOfMatchingCities <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_USERID .
	?_USERID <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#UniqueIdentifier> .
	?getListOfMatchingCities <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_CITY .
	?_CITY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#City> .
	?getListOfMatchingCities <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_MATCHED_CITY .
	?_MATCHED_CITY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#City> .
	?getListOfMatchingCities <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_TIMEZONE .
	?_TIMEZONE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#TimeZone> .
	?getListOfMatchingCities <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_STATE .
	?_STATE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#State> .
	?getListOfMatchingCities <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_COUNTRY .
	?_COUNTRY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#Country> .
	?getListOfMatchingCities <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_POSTALCODE .
	?_POSTALCODE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#PostalCode> .
	?_USERID <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
}

# getLocationOfAddress
CONSTRUCT {
	<http://127.0.0.1/service#getLocationOfAddress> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?getLocationOfAddress <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_ADDRESS .
	?_ADDRESS <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#Address> .
	?getLocationOfAddress <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_CITY .
	?_CITY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#City> .
	?getLocationOfAddress <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_STATE .
	?_STATE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#State> .
	?getLocationOfAddress <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_LATITUDE .
	?_LATITUDE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#latitude> .
	?getLocationOfAddress <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_LONGITUDE .
	?_LONGITUDE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#longitude> .
	?_CITY <http://127.0.0.1/ontology/protont.owl#locatedIn> ?_STATE .
}

# getLocationOfAddressWorldwide
CONSTRUCT {
	<http://127.0.0.1/service#getLocationOfAddressWorldwide> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?getLocationOfAddressWorldwide <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_USERID .
	?_USERID <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#UniqueIdentifier> .
	?getLocationOfAddressWorldwide <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_ADDRESS .
	?_ADDRESS <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#Address> .
	?getLocationOfAddressWorldwide <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_CITY .
	?_CITY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#City> .
	?getLocationOfAddressWorldwide <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_COUNTRY .
	?_COUNTRY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#Country> .
	?getLocationOfAddressWorldwide <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_LATITUDE .
	?_LATITUDE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#latitude> .
	?getLocationOfAddressWorldwide <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_LONGITUDE .
	?_LONGITUDE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#longitude> .
	?_USERID <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
	?_CITY <http://127.0.0.1/ontology/protont.owl#locatedIn> ?_COUNTRY .
}

# getLocationOfCityState
CONSTRUCT {
	<http://127.0.0.1/service#getLocationOfCityState> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?getLocationOfCityState <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_CITY .
	?_CITY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#City> .
	?getLocationOfCityState <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_STATE .
	?_STATE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#State> .
	?getLocationOfCityState <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_ZIPCODE .
	?_ZIPCODE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#US5DigitZipCode> .
	?getLocationOfCityState <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_AREACODE .
	?_AREACODE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#US3DigitZipCode> .
	?getLocationOfCityState <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_LATITUDE .
	?_LATITUDE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#latitude> .
	?getLocationOfCityState <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_LONGITUDE .
	?_LONGITUDE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#longitude> .
	?_CITY <http://127.0.0.1/ontology/protont.owl#locatedIn> ?_STATE .
}

# getLocationOfCityWorldwide
CONSTRUCT {
	<http://127.0.0.1/service#getLocationOfCityWorldwide> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?getLocationOfCityWorldwide <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_CITY .
	?_CITY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#City> .
	?getLocationOfCityWorldwide <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_STATE .
	?_STATE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#State> .
	?getLocationOfCityWorldwide <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_COUNTRY .
	?_COUNTRY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#Country> .
	?getLocationOfCityWorldwide <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_LATITUDE .
	?_LATITUDE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#latitude> .
	?getLocationOfCityWorldwide <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_LONGITUDE .
	?_LONGITUDE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#longitude> .
	?_CITY <http://127.0.0.1/ontology/protont.owl#locatedIn> ?_STATE .
	?_STATE <http://127.0.0.1/ontology/protont.owl#locatedIn> ?_COUNTRY .
}

# getLocationOfUSCity
CONSTRUCT {
	<http://127.0.0.1/service#getLocationOfUSCity> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?getLocationOfUSCity <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_CITY .
	?_CITY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#City> .
	?getLocationOfUSCity <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_STATE .
	?_STATE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#State> .
	?getLocationOfUSCity <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_LATITUDE .
	?_LATITUDE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#latitude> .
	?getLocationOfUSCity <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_LONGITUDE .
	?_LONGITUDE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#longitude> .
	?_CITY <http://127.0.0.1/ontology/protont.owl#locatedIn> ?_STATE .
}

# getLocationOfZipCodeWorldwide
CONSTRUCT {
	<http://127.0.0.1/service#getLocationOfZipCodeWorldwide> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?getLocationOfZipCodeWorldwide <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_USERID .
	?_USERID <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#UniqueIdentifier> .
	?getLocationOfZipCodeWorldwide <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_ZIPCODE .
	?_ZIPCODE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#ZipCode> .
	?getLocationOfZipCodeWorldwide <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_LATITUDE .
	?_LATITUDE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#latitude> .
	?getLocationOfZipCodeWorldwide <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_LONGITUDE .
	?_LONGITUDE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#longitude> .
	?getLocationOfZipCodeWorldwide <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_CITY .
	?_CITY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#City> .
	?getLocationOfZipCodeWorldwide <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_COUNTRY .
	?_COUNTRY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#Country> .
	?_USERID <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
}

# getMapOfAddress
CONSTRUCT {
	<http://127.0.0.1/service#getMapOfAddress> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?getMapOfAddress <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_LICENSEKEY .
	?_LICENSEKEY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#Code> .
	?getMapOfAddress <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_ADDRESS .
	?_ADDRESS <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#Address> .
	?getMapOfAddress <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_CITY .
	?_CITY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#City> .
	?getMapOfAddress <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_STATE .
	?_STATE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#State> .
	?getMapOfAddress <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_COUNTRY .
	?_COUNTRY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#Country> .
	?getMapOfAddress <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_VICINITY_MAP .
	?_VICINITY_MAP <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#Map> .
	?getMapOfAddress <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_THUMBNAIL_MAP .
	?_THUMBNAIL_MAP <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#Map> .
	?getMapOfAddress <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_LATITUDE .
	?_LATITUDE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#latitude> .
	?getMapOfAddress <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_LONGITUDE .
	?_LONGITUDE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#longitude> .
	?getMapOfAddress <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_MATCHED_ADDRESS .
	?_MATCHED_ADDRESS <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#Address> .
	?getMapOfAddress <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_MAPSIZE .
	?_MAPSIZE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/Units.owl#Pixel> .
	?_LICENSEKEY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
	?_CITY <http://127.0.0.1/ontology/protont.owl#locatedIn> ?_STATE .
	?_STATE <http://127.0.0.1/ontology/protont.owl#locatedIn> ?_COUNTRY .
}

# getMapOfUSAddress
CONSTRUCT {
	<http://127.0.0.1/service#getMapOfUSAddress> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?getMapOfUSAddress <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_ADDRESS .
	?_ADDRESS <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#PostalAddress> .
	?getMapOfUSAddress <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_CITY .
	?_CITY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#City> .
	?getMapOfUSAddress <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_STATE .
	?_STATE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#State> .
	?getMapOfUSAddress <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_ZIPCODE .
	?_ZIPCODE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#PostalCode> .
	?getMapOfUSAddress <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_MAP .
	?_MAP <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#Map> .
	?_CITY <http://127.0.0.1/ontology/protont.owl#locatedIn> ?_STATE .
}

# GetMedicalFlightAccount_service
CONSTRUCT {
	<http://127.0.0.1/service#GetMedicalFlightAccount_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?GetMedicalFlightAccount_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?GetMedicalFlightAccount_CustomerCreditCardNumber .
	?GetMedicalFlightAccount_CustomerCreditCardNumber <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/MedicalFlightCompanyOntology.owl#CreditCardNumber> .
	?GetMedicalFlightAccount_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?GetMedicalFlightAccount_CustomerDesiredAccountName .
	?GetMedicalFlightAccount_CustomerDesiredAccountName <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/MedicalFlightCompanyOntology.owl#AccountName> .
	?GetMedicalFlightAccount_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?GetMedicalFlightAccount_CustomerDesiredPassword .
	?GetMedicalFlightAccount_CustomerDesiredPassword <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/MedicalFlightCompanyOntology.owl#AccountPassword> .
	?GetMedicalFlightAccount_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?GetMedicalFlightAccount_CustomerAddress .
	?GetMedicalFlightAccount_CustomerAddress <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/MedicalFlightCompanyOntology.owl#Address> .
	?GetMedicalFlightAccount_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?GetMedicalFlightAccount_CustomerCreditCardExpDate .
	?GetMedicalFlightAccount_CustomerCreditCardExpDate <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/MedicalFlightCompanyOntology.owl#DateTime> .
	?GetMedicalFlightAccount_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?GetMedicalFlightAccount_CustomerName .
	?GetMedicalFlightAccount_CustomerName <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/MedicalFlightCompanyOntology.owl#PersonName> .
	?GetMedicalFlightAccount_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?GetMedicalFlightAccount_Account .
	?GetMedicalFlightAccount_Account <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/MedicalFlightCompanyOntology.owl#Account> .
	?GetMedicalFlightAccount_CustomerCreditCardNumber <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/ontosem.owl#Accepted> .
	?GetMedicalFlightAccount_CustomerName <http://127.0.0.1/ontology/Mid-level-ontology.owl#accountHolder> ?GetMedicalFlightAccount_CustomerCreditCardNumber .
}

# GetMedicalTransportAccount_service
CONSTRUCT {
	<http://127.0.0.1/service#GetMedicalTransportAccount_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?GetMedicalTransportAccount_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?GetMedicalTransportAccount_CustomerDesiredPassword .
	?GetMedicalTransportAccount_CustomerDesiredPassword <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/MedicalTransportCompanyOntology.owl#AccountPassword> .
	?GetMedicalTransportAccount_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?GetMedicalTransportAccount_CustomerCreditCardExpDate .
	?GetMedicalTransportAccount_CustomerCreditCardExpDate <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/MedicalTransportCompanyOntology.owl#DateTime> .
	?GetMedicalTransportAccount_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?ProvideMedicalTransportInformation_Diagnosis .
	?ProvideMedicalTransportInformation_Diagnosis <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/MedicalTransportCompanyOntology.owl#Diagnosis> .
	?GetMedicalTransportAccount_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?ProvideMedicalTransportInformation_DesiredDepartureDateTime .
	?ProvideMedicalTransportInformation_DesiredDepartureDateTime <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/MedicalTransportCompanyOntology.owl#DateTime> .
	?GetMedicalTransportAccount_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?GetMedicalTransportAccount_CustomerName .
	?GetMedicalTransportAccount_CustomerName <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/MedicalTransportCompanyOntology.owl#PersonName> .
	?GetMedicalTransportAccount_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?GetMedicalTransportAccount_CustomerAddress .
	?GetMedicalTransportAccount_CustomerAddress <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/MedicalTransportCompanyOntology.owl#Address> .
	?GetMedicalTransportAccount_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?GetMedicalTransportAccount_CustomerDesiredAccountName .
	?GetMedicalTransportAccount_CustomerDesiredAccountName <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/MedicalTransportCompanyOntology.owl#AccountName> .
	?GetMedicalTransportAccount_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?GetMedicalTransportAccount_CustomerCreditCardNumber .
	?GetMedicalTransportAccount_CustomerCreditCardNumber <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/MedicalTransportCompanyOntology.owl#CreditCardNumber> .
	?GetMedicalTransportAccount_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?GetMedicalTransportAccount_Account .
	?GetMedicalTransportAccount_Account <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/MedicalTransportCompanyOntology.owl#Account> .
	?GetMedicalTransportAccount_CustomerCreditCardNumber <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/ontosem.owl#Accepted> .
	?GetMedicalTransportAccount_CustomerName <http://127.0.0.1/ontology/Mid-level-ontology.owl#accountHolder> ?GetMedicalTransportAccount_CustomerCreditCardNumber .
}

# GetNonMedicalFlightAccount_service
CONSTRUCT {
	<http://127.0.0.1/service#GetNonMedicalFlightAccount_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?GetNonMedicalFlightAccount_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?BookNonMedicalFlight_Account .
	?BookNonMedicalFlight_Account <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/NonMedicalFlightCompanyOntology.owl#Account> .
	?GetNonMedicalFlightAccount_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?GetNonMedicalFlightAccount_CustomerAddress .
	?GetNonMedicalFlightAccount_CustomerAddress <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/NonMedicalFlightCompanyOntology.owl#Address> .
	?GetNonMedicalFlightAccount_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?GetNonMedicalFlightAccount_CustomerCreditCardExpDate .
	?GetNonMedicalFlightAccount_CustomerCreditCardExpDate <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/NonMedicalFlightCompanyOntology.owl#DateTime> .
	?GetNonMedicalFlightAccount_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?GetNonMedicalFlightAccount_CustomerCreditCardNumber .
	?GetNonMedicalFlightAccount_CustomerCreditCardNumber <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/NonMedicalFlightCompanyOntology.owl#CreditCardNumber> .
	?GetNonMedicalFlightAccount_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?BookNonMedicalFlight_FlightNumber .
	?BookNonMedicalFlight_FlightNumber <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/NonMedicalFlightCompanyOntology.owl#FlightNumber> .
	?GetNonMedicalFlightAccount_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?GetNonMedicalFlightAccount_CustomerName .
	?GetNonMedicalFlightAccount_CustomerName <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/NonMedicalFlightCompanyOntology.owl#PersonName> .
	?GetNonMedicalFlightAccount_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?GetNonMedicalFlightAccount_CustomerDesiredAccountName .
	?GetNonMedicalFlightAccount_CustomerDesiredAccountName <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/NonMedicalFlightCompanyOntology.owl#AccountName> .
	?GetNonMedicalFlightAccount_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?GetNonMedicalFlightAccount_CustomerDesiredPassword .
	?GetNonMedicalFlightAccount_CustomerDesiredPassword <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/NonMedicalFlightCompanyOntology.owl#AccountPassword> .
	?GetNonMedicalFlightAccount_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?GetNonMedicalFlightAccount_Account .
	?GetNonMedicalFlightAccount_Account <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/NonMedicalFlightCompanyOntology.owl#Account> .
	?GetNonMedicalFlightAccount_CustomerCreditCardNumber <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/ontosem.owl#Accepted> .
	?GetNonMedicalFlightAccount_CustomerName <http://127.0.0.1/ontology/Mid-level-ontology.owl#accountHolder> ?GetNonMedicalFlightAccount_CustomerCreditCardNumber .
}

# GetNonMedicalTransportAccount_service
CONSTRUCT {
	<http://127.0.0.1/service#GetNonMedicalTransportAccount_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?GetNonMedicalTransportAccount_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?GetNonMedicalTransportAccount_CustomerDesiredPassword .
	?GetNonMedicalTransportAccount_CustomerDesiredPassword <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/NonMedicalTransportCompanyOntology.owl#AccountPassword> .
	?GetNonMedicalTransportAccount_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?GetNonMedicalTransportAccount_CustomerDesiredAccountName .
	?GetNonMedicalTransportAccount_CustomerDesiredAccountName <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/NonMedicalTransportCompanyOntology.owl#AccountName> .
	?GetNonMedicalTransportAccount_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?GetNonMedicalTransportAccount_CustomerAddress .
	?GetNonMedicalTransportAccount_CustomerAddress <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/NonMedicalTransportCompanyOntology.owl#Address> .
	?GetNonMedicalTransportAccount_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?GetNonMedicalTransportAccount_CustomerCreditCardExpDate .
	?GetNonMedicalTransportAccount_CustomerCreditCardExpDate <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/NonMedicalTransportCompanyOntology.owl#DateTime> .
	?GetNonMedicalTransportAccount_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?GetNonMedicalTransportAccount_CustomerName .
	?GetNonMedicalTransportAccount_CustomerName <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/NonMedicalTransportCompanyOntology.owl#PersonName> .
	?GetNonMedicalTransportAccount_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?GetNonMedicalTransportAccount_CustomerCreditCardNumber .
	?GetNonMedicalTransportAccount_CustomerCreditCardNumber <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/NonMedicalTransportCompanyOntology.owl#CreditCardNumber> .
	?GetNonMedicalTransportAccount_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?GetNonMedicalTransportAccount_Account .
	?GetNonMedicalTransportAccount_Account <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/NonMedicalTransportCompanyOntology.owl#Account> .
	?GetNonMedicalTransportAccount_CustomerCreditCardNumber <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/ontosem.owl#Accepted> .
	?GetNonMedicalTransportAccount_CustomerName <http://127.0.0.1/ontology/Mid-level-ontology.owl#accountHolder> ?GetNonMedicalTransportAccount_CustomerCreditCardNumber .
}

# getPlaceOfAddress
CONSTRUCT {
	<http://127.0.0.1/service#getPlaceOfAddress> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?getPlaceOfAddress <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_ADDRESS .
	?_ADDRESS <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#Address> .
	?getPlaceOfAddress <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_CITY .
	?_CITY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#City> .
	?getPlaceOfAddress <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_COUNTY .
	?_COUNTY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#County> .
	?getPlaceOfAddress <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_STATE .
	?_STATE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#State> .
	?getPlaceOfAddress <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_COUNTRY .
	?_COUNTRY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#Country> .
	?getPlaceOfAddress <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_DISTRICT .
	?_DISTRICT <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#UrbanDistrict> .
	?getPlaceOfAddress <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_ZIPCODE .
	?_ZIPCODE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#PostalCode> .
	?getPlaceOfAddress <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_PLACE .
	?_PLACE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#PopulatedPlace> .
	?getPlaceOfAddress <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_LATITUDE .
	?_LATITUDE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#latitude> .
	?getPlaceOfAddress <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_LONGITUDE .
	?_LONGITUDE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#longitude> .
	?_CITY <http://127.0.0.1/ontology/protont.owl#locatedIn> ?_COUNTY .
	?_COUNTY <http://127.0.0.1/ontology/protont.owl#locatedIn> ?_STATE .
	?_STATE <http://127.0.0.1/ontology/protont.owl#locatedIn> ?_COUNTRY .
	?_DISTRICT <http://127.0.0.1/ontology/protont.owl#locatedIn> ?_COUNTY .
}

# getPopulationDensityOfLocation
CONSTRUCT {
	<http://127.0.0.1/service#getPopulationDensityOfLocation> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?getPopulationDensityOfLocation <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_USERID .
	?_USERID <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#UniqueIdentifier> .
	?getPopulationDensityOfLocation <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_LATITUDE .
	?_LATITUDE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#latitude> .
	?getPopulationDensityOfLocation <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_LONGITUDE .
	?_LONGITUDE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#longitude> .
	?getPopulationDensityOfLocation <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_DENSITY .
	?_DENSITY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/ontosem.owl#population-density> .
	?_USERID <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
}

# getSunsetAndSunriseTime
CONSTRUCT {
	<http://127.0.0.1/service#getSunsetAndSunriseTime> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?getSunsetAndSunriseTime <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_LICENSEKEY .
	?_LICENSEKEY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#Code> .
	?getSunsetAndSunriseTime <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_LATITUDE .
	?_LATITUDE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#latitude> .
	?getSunsetAndSunriseTime <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_LONGITUDE .
	?_LONGITUDE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#longitude> .
	?getSunsetAndSunriseTime <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_DATE .
	?_DATE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#Date> .
	?getSunsetAndSunriseTime <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_TIMEZONE .
	?_TIMEZONE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#TimeZone> .
	?getSunsetAndSunriseTime <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_SUNRISE .
	?_SUNRISE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#Sunrise> .
	?getSunsetAndSunriseTime <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_SUNSET .
	?_SUNSET <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#Sunset> .
	?_LICENSEKEY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
}

# getSunsetSunriseTimeOfLocation
CONSTRUCT {
	<http://127.0.0.1/service#getSunsetSunriseTimeOfLocation> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?getSunsetSunriseTimeOfLocation <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_LICENSEKEY .
	?_LICENSEKEY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#Code> .
	?getSunsetSunriseTimeOfLocation <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_LATITUDE .
	?_LATITUDE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#latitude> .
	?getSunsetSunriseTimeOfLocation <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_LONGITUDE .
	?_LONGITUDE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#longitude> .
	?getSunsetSunriseTimeOfLocation <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_DATE .
	?_DATE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#Date> .
	?getSunsetSunriseTimeOfLocation <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_SUNRISE .
	?_SUNRISE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#Sunrise> .
	?getSunsetSunriseTimeOfLocation <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_SUNSET .
	?_SUNSET <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#Sunset> .
	?_LICENSEKEY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
}

# getSunsetSunriseTwilightTime
CONSTRUCT {
	<http://127.0.0.1/service#getSunsetSunriseTwilightTime> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?getSunsetSunriseTwilightTime <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_LICENSEKEY .
	?_LICENSEKEY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#Code> .
	?getSunsetSunriseTwilightTime <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_LATITUDE .
	?_LATITUDE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#latitude> .
	?getSunsetSunriseTwilightTime <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_LONGITUDE .
	?_LONGITUDE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#longitude> .
	?getSunsetSunriseTwilightTime <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_DATE .
	?_DATE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#Date> .
	?getSunsetSunriseTwilightTime <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_TIMEZONE .
	?_TIMEZONE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#TimeZone> .
	?getSunsetSunriseTwilightTime <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_SUNRISE_TWILIGHT .
	?_SUNRISE_TWILIGHT <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#Twilight> .
	?getSunsetSunriseTwilightTime <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_SUNRISE .
	?_SUNRISE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#Sunrise> .
	?getSunsetSunriseTwilightTime <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_SUNSET_TWILIGHT .
	?_SUNSET_TWILIGHT <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#Twilight> .
	?getSunsetSunriseTwilightTime <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_SUNSET .
	?_SUNSET <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#Sunset> .
	?_LICENSEKEY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
}

# getTrafficInformation
CONSTRUCT {
	<http://127.0.0.1/service#getTrafficInformation> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?getTrafficInformation <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_USERID .
	?_USERID <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#UniqueIdentifier> .
	?getTrafficInformation <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_LATITUDE .
	?_LATITUDE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#latitude> .
	?getTrafficInformation <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_LONGITUDE .
	?_LONGITUDE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#longitude> .
	?getTrafficInformation <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_IMAGE_WIDTH .
	?_IMAGE_WIDTH <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/Units.owl#Pixel> .
	?getTrafficInformation <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_IMAGE_HEIGHT .
	?_IMAGE_HEIGHT <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/Units.owl#Pixel> .
	?getTrafficInformation <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_LANGUAGE .
	?_LANGUAGE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#Language> .
	?getTrafficInformation <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_RANGE .
	?_RANGE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#KilometerLengthUnit> .
	?getTrafficInformation <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_INCIDENTS .
	?_INCIDENTS <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#TrafficIncident> .
	?getTrafficInformation <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_HOTSPOTS .
	?_HOTSPOTS <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#Coordinate> .
	?getTrafficInformation <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_MAP .
	?_MAP <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#Map> .
	?_USERID <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
}

# getUSZipCodeLocation
CONSTRUCT {
	<http://127.0.0.1/service#getUSZipCodeLocation> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?getUSZipCodeLocation <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_LICENSEKEY .
	?_LICENSEKEY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#Code> .
	?getUSZipCodeLocation <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_ZIPCODE .
	?_ZIPCODE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#US5DigitZipCode> .
	?getUSZipCodeLocation <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_USSTATECODE .
	?_USSTATECODE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#USStateCode> .
	?getUSZipCodeLocation <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_LATITUDE .
	?_LATITUDE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#latitude> .
	?getUSZipCodeLocation <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_LONGITUDE .
	?_LONGITUDE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#longitude> .
	?getUSZipCodeLocation <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_CITY .
	?_CITY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#City> .
	?_LICENSEKEY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
}

# getZipcodeForUSCity
CONSTRUCT {
	<http://127.0.0.1/service#getZipcodeForUSCity> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?getZipcodeForUSCity <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_LICENSEKEY .
	?_LICENSEKEY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#Code> .
	?getZipcodeForUSCity <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_CITY .
	?_CITY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#City> .
	?getZipcodeForUSCity <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_STATE .
	?_STATE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#State> .
	?getZipcodeForUSCity <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_ZIPCODE .
	?_ZIPCODE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#US5DigitZipCode> .
	?_LICENSEKEY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
	?_CITY <http://127.0.0.1/ontology/protont.owl#locatedIn> ?_STATE .
}

# getZipCodeInfo
CONSTRUCT {
	<http://127.0.0.1/service#getZipCodeInfo> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?getZipCodeInfo <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_LICENSEKEY .
	?_LICENSEKEY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#Code> .
	?getZipCodeInfo <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_ZIPCODE .
	?_ZIPCODE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#US5DigitZipCode> .
	?getZipCodeInfo <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_CITY .
	?_CITY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#City> .
	?getZipCodeInfo <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_STATE .
	?_STATE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#State> .
	?getZipCodeInfo <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_TIMEZONE .
	?_TIMEZONE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#TimeZone> .
	?getZipCodeInfo <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_DAYLIGHTSAVINGTIME .
	?_DAYLIGHTSAVINGTIME <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#daylightSavingTime> .
	?_LICENSEKEY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
}

# getZipCodeInfoWorldwide
CONSTRUCT {
	<http://127.0.0.1/service#getZipCodeInfoWorldwide> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?getZipCodeInfoWorldwide <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_USERID .
	?_USERID <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#UniqueIdentifier> .
	?getZipCodeInfoWorldwide <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_ZIPCODE .
	?_ZIPCODE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#ZipCode> .
	?getZipCodeInfoWorldwide <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_GEOGRAPHIC_AREA .
	?_GEOGRAPHIC_AREA <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#GeographicArea> .
	?getZipCodeInfoWorldwide <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_CITY .
	?_CITY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#City> .
	?getZipCodeInfoWorldwide <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_COUNTRY .
	?_COUNTRY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#Country> .
	?getZipCodeInfoWorldwide <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_TIMEZONE .
	?_TIMEZONE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#TimeZone> .
	?getZipCodeInfoWorldwide <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_DAYLIGHTSAVINGTIME .
	?_DAYLIGHTSAVINGTIME <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#daylightSavingTime> .
	?_USERID <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
}

# getZipCodeLocation
CONSTRUCT {
	<http://127.0.0.1/service#getZipCodeLocation> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?getZipCodeLocation <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_LICENSEKEY .
	?_LICENSEKEY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#Code> .
	?getZipCodeLocation <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_ZIPCODE .
	?_ZIPCODE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#US5DigitZipCode> .
	?getZipCodeLocation <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_STATE .
	?_STATE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#State> .
	?getZipCodeLocation <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_LATITUDE .
	?_LATITUDE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#latitude> .
	?getZipCodeLocation <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_LONGITUDE .
	?_LONGITUDE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protont.owl#longitude> .
	?_LICENSEKEY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
}

# getZipCodesWithinCityState
CONSTRUCT {
	<http://127.0.0.1/service#getZipCodesWithinCityState> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?getZipCodesWithinCityState <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_LICENSEKEY .
	?_LICENSEKEY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#Code> .
	?getZipCodesWithinCityState <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_CITY .
	?_CITY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#City> .
	?getZipCodesWithinCityState <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_STATE .
	?_STATE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#State> .
	?getZipCodesWithinCityState <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_COUNTRY .
	?_COUNTRY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/protonu.owl#Country> .
	?getZipCodesWithinCityState <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_WITHIN_DISTANCE .
	?_WITHIN_DISTANCE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#GeographicDistance> .
	?getZipCodesWithinCityState <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_ZIPCODE .
	?_ZIPCODE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#US5DigitZipCode> .
	?getZipCodesWithinCityState <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_DISTANCE_TO_CITY .
	?_DISTANCE_TO_CITY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/geographydataset.owl#GeographicDistance> .
	?_LICENSEKEY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
	?_CITY <http://127.0.0.1/ontology/protont.owl#locatedIn> ?_STATE .
	?_STATE <http://127.0.0.1/ontology/protont.owl#locatedIn> ?_COUNTRY .
}

# greenLight_to_off
CONSTRUCT {
	<http://127.0.0.1/service#greenLight_to_off> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?greenLight_to_off <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?MesseModul .
	?MesseModul <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#MesseModul> .
	?greenLight_to_off <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?Magazine .
	?Magazine <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#Magazine> .
	?greenLight_to_off <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?GreenLamp .
	?GreenLamp <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#GreenLamp> .
	?GreenLamp <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#On> .
	?Magazine <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#Empty> .
	?MesseModul <http://127.0.0.1/ontology/messemodul.owl#consistsOf> ?GreenLamp .
	?MesseModul <http://127.0.0.1/ontology/messemodul.owl#consistsOf> ?Magazine .
}

# greenLight_to_on
CONSTRUCT {
	<http://127.0.0.1/service#greenLight_to_on> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?greenLight_to_on <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?MesseModul .
	?MesseModul <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#MesseModul> .
	?greenLight_to_on <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?Magazine .
	?Magazine <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#Magazine> .
	?greenLight_to_on <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?GreenLamp .
	?GreenLamp <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#GreenLamp> .
	?GreenLamp <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#Off> .
	?Magazine <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#Full> .
	?MesseModul <http://127.0.0.1/ontology/messemodul.owl#consistsOf> ?GreenLamp .
	?MesseModul <http://127.0.0.1/ontology/messemodul.owl#consistsOf> ?Magazine .
}

# HospitalPhysician_service
CONSTRUCT {
	<http://127.0.0.1/service#HospitalPhysician_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?HospitalPhysician_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?GetPatientMedicalRecords_PhysicianPassword .
	?GetPatientMedicalRecords_PhysicianPassword <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/HospitalPhysicianOntology.owl#AccountPassword> .
	?HospitalPhysician_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?PatientTransport_PatientGpsPosition .
	?PatientTransport_PatientGpsPosition <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/HospitalPhysicianOntology.owl#GpsPosition> .
	?HospitalPhysician_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?GetPatientMedicalRecords_PatientHealthInsuranceNumber .
	?GetPatientMedicalRecords_PatientHealthInsuranceNumber <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/HospitalPhysicianOntology.owl#HealthInsuranceNumber> .
	?HospitalPhysician_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?GetPatientMedicalRecords_PhysicianID .
	?GetPatientMedicalRecords_PhysicianID <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/HospitalPhysicianOntology.owl#PhysicianID> .
	?HospitalPhysician_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?UpdatePatientMedicalRecords_Treatment .
	?UpdatePatientMedicalRecords_Treatment <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/HospitalPhysicianOntology.owl#Treatment> .
	?HospitalPhysician_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?GetPatientMedicalRecords_AuthorizationEndTime .
	?GetPatientMedicalRecords_AuthorizationEndTime <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/HospitalPhysicianOntology.owl#DateTime> .
	?HospitalPhysician_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?GetPatientMedicalRecords_AuthorizedMedicalRecords .
	?GetPatientMedicalRecords_AuthorizedMedicalRecords <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/HospitalPhysicianOntology.owl#MedicalRecords> .
	?HospitalPhysician_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?UpdatePatientMedicalRecords_Acknowledgement .
	?UpdatePatientMedicalRecords_Acknowledgement <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/HospitalPhysicianOntology.owl#Acknowledgement> .
	?GetPatientMedicalRecords_PhysicianID <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
}

# locationlocation_arrowfigure_service
CONSTRUCT {
	<http://127.0.0.1/service#locationlocation_arrowfigure_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?locationlocation_arrowfigure_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_LOCATION1 .
	?_LOCATION1 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/portal.owl#Location> .
	?locationlocation_arrowfigure_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_LOCATION2 .
	?_LOCATION2 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/portal.owl#Location> .
	?locationlocation_arrowfigure_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_ARROWFIGURE .
	?_ARROWFIGURE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/Mid-level-ontology.owl#ArrowFigure> .
	<http://www.w3.org/2002/07/owl#AllDifferent> <http://www.w3.org/2002/07/owl#distinctMembers> ?var44 .
	?var44 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> ?_LOCATION1 .
	?var44 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> ?var45 .
	?var45 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> ?_LOCATION2 .
	?var45 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> <http://www.w3.org/1999/02/22-rdf-syntax-ns#nil> .
}

# locationlocation_icon_service
CONSTRUCT {
	<http://127.0.0.1/service#locationlocation_icon_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?locationlocation_icon_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_LOCATION1 .
	?_LOCATION1 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/portal.owl#Location> .
	?locationlocation_icon_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_LOCATION2 .
	?_LOCATION2 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/portal.owl#Location> .
	?locationlocation_icon_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_ICON .
	?_ICON <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/SUMO.owl#Icon> .
	<http://www.w3.org/2002/07/owl#AllDifferent> <http://www.w3.org/2002/07/owl#distinctMembers> ?var46 .
	?var46 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> ?_LOCATION1 .
	?var46 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> ?var47 .
	?var47 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> ?_LOCATION2 .
	?var47 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> <http://www.w3.org/1999/02/22-rdf-syntax-ns#nil> .
}

# locationlocation_map_service
CONSTRUCT {
	<http://127.0.0.1/service#locationlocation_map_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?locationlocation_map_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_LOCATION1 .
	?_LOCATION1 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/portal.owl#Location> .
	?locationlocation_map_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_LOCATION2 .
	?_LOCATION2 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/portal.owl#Location> .
	?locationlocation_map_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_MAP .
	?_MAP <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/Mid-level-ontology.owl#Map> .
	<http://www.w3.org/2002/07/owl#AllDifferent> <http://www.w3.org/2002/07/owl#distinctMembers> ?var48 .
	?var48 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> ?_LOCATION1 .
	?var48 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> ?var49 .
	?var49 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> ?_LOCATION2 .
	?var49 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> <http://www.w3.org/1999/02/22-rdf-syntax-ns#nil> .
}

# locationlocation_map_SRIservice
CONSTRUCT {
	<http://127.0.0.1/service#locationlocation_map_SRIservice> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?locationlocation_map_SRIservice <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_LOCATION1 .
	?_LOCATION1 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/portal.owl#Location> .
	?locationlocation_map_SRIservice <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_LOCATION2 .
	?_LOCATION2 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/portal.owl#Location> .
	?locationlocation_map_SRIservice <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_MAP .
	?_MAP <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/Mid-level-ontology.owl#Map> .
	<http://www.w3.org/2002/07/owl#AllDifferent> <http://www.w3.org/2002/07/owl#distinctMembers> ?var50 .
	?var50 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> ?_LOCATION1 .
	?var50 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> ?var51 .
	?var51 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> ?_LOCATION2 .
	?var51 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> <http://www.w3.org/1999/02/22-rdf-syntax-ns#nil> .
}

# lock_door
CONSTRUCT {
	<http://127.0.0.1/service#lock_door> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?lock_door <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?Door .
	?Door <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#Door> .
	?Door <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#Closed> .
	?Door <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#Unlocked> .
}

# monographpersoncreditcardaccount_recommendedprice_service
CONSTRUCT {
	<http://127.0.0.1/service#monographpersoncreditcardaccount_recommendedprice_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?monographpersoncreditcardaccount_recommendedprice_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_CREDITCARDACCOUNT .
	?_CREDITCARDACCOUNT <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/Mid-level-ontology.owl#CreditCardAccount> .
	?monographpersoncreditcardaccount_recommendedprice_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_MONOGRAPH .
	?_MONOGRAPH <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#Monograph> .
	?monographpersoncreditcardaccount_recommendedprice_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_PERSON .
	?_PERSON <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#Person> .
	?monographpersoncreditcardaccount_recommendedprice_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_RECOMMENDEDPRICE .
	?_RECOMMENDEDPRICE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/concept.owl#RecommendedPrice> .
	?_CREDITCARDACCOUNT <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/ontosem.owl#Accepted> .
	?_PERSON <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
	?_PERSON <http://127.0.0.1/ontology/Mid-level-ontology.owl#accountHolder> ?_CREDITCARDACCOUNT .
}

# monographperson__service
CONSTRUCT {
	<http://127.0.0.1/service#monographperson__service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?monographperson__service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_MONOGRAPH .
	?_MONOGRAPH <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#Monograph> .
	?monographperson__service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_PERSON .
	?_PERSON <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#Person> .
	?_PERSON <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
}

# NonMedicalFlightCompany_service
CONSTRUCT {
	<http://127.0.0.1/service#NonMedicalFlightCompany_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?NonMedicalFlightCompany_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?GetNonMedicalFlightAccount_CustomerDesiredAccountName .
	?GetNonMedicalFlightAccount_CustomerDesiredAccountName <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/NonMedicalFlightCompanyOntology.owl#AccountName> .
	?NonMedicalFlightCompany_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?ProvideNonMedicalFlightInformation_DesiredDepartureAirport .
	?ProvideNonMedicalFlightInformation_DesiredDepartureAirport <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/NonMedicalFlightCompanyOntology.owl#Airport> .
	?NonMedicalFlightCompany_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?ProvideNonMedicalFlightInformation_DesiredDepartureDateTime .
	?ProvideNonMedicalFlightInformation_DesiredDepartureDateTime <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/NonMedicalFlightCompanyOntology.owl#DateTime> .
	?NonMedicalFlightCompany_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?ProvideNonMedicalFlightInformation_FlightCategory .
	?ProvideNonMedicalFlightInformation_FlightCategory <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/NonMedicalFlightCompanyOntology.owl#FlightCategory> .
	?NonMedicalFlightCompany_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?ProvideNonMedicalFlightInformation_DesiredArrivalAirport .
	?ProvideNonMedicalFlightInformation_DesiredArrivalAirport <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/NonMedicalFlightCompanyOntology.owl#Airport> .
	?NonMedicalFlightCompany_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?ProvideNonMedicalFlightInformation_ListOfFlights .
	?ProvideNonMedicalFlightInformation_ListOfFlights <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/NonMedicalFlightCompanyOntology.owl#ListOfFlights> .
	<http://www.w3.org/2002/07/owl#AllDifferent> <http://www.w3.org/2002/07/owl#distinctMembers> ?var52 .
	?var52 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> ?ProvideNonMedicalFlightInformation_DesiredDepartureAirport .
	?var52 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> ?var53 .
	?var53 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> ?ProvideNonMedicalFlightInformation_DesiredArrivalAirport .
	?var53 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> <http://www.w3.org/1999/02/22-rdf-syntax-ns#nil> .
}

# novelperson__Reservationservice
CONSTRUCT {
	<http://127.0.0.1/service#novelperson__Reservationservice> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?novelperson__Reservationservice <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_PERSON .
	?_PERSON <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#Person> .
	?novelperson__Reservationservice <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_NOVEL .
	?_NOVEL <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#Novel> .
	?_NOVEL <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#isNotReserved> .
}

# novel_person_Reserverservice
CONSTRUCT {
	<http://127.0.0.1/service#novel_person_Reserverservice> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?novel_person_Reserverservice <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_NOVEL .
	?_NOVEL <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#Novel> .
	?novel_person_Reserverservice <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_PERSON .
	?_PERSON <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#Person> .
	?_NOVEL <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#isReserved> .
}

# objectpersoncreditaccount_price_service
CONSTRUCT {
	<http://127.0.0.1/service#objectpersoncreditaccount_price_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?objectpersoncreditaccount_price_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_CREDITACCOUNT .
	?_CREDITACCOUNT <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/Mid-level-ontology.owl#CreditAccount> .
	?objectpersoncreditaccount_price_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_OBJECT .
	?_OBJECT <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/simplified_sumo.owl#Object> .
	?objectpersoncreditaccount_price_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_PERSON .
	?_PERSON <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#Person> .
	?objectpersoncreditaccount_price_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_PRICE .
	?_PRICE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/concept.owl#Price> .
	?_CREDITACCOUNT <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/ontosem.owl#Accepted> .
	?_PERSON <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
	?_PERSON <http://127.0.0.1/ontology/Mid-level-ontology.owl#accountHolder> ?_CREDITACCOUNT .
}

# objectperson__service
CONSTRUCT {
	<http://127.0.0.1/service#objectperson__service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?objectperson__service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_OBJECT .
	?_OBJECT <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/simplified_sumo.owl#Object> .
	?objectperson__service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_PERSON .
	?_PERSON <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#Person> .
	?_OBJECT <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/ontosem.owl#be-available> .
	?_PERSON <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
}

# open_door
CONSTRUCT {
	<http://127.0.0.1/service#open_door> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?open_door <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?Door .
	?Door <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#Door> .
	?Door <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#Closed> .
	?Door <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#Unlocked> .
}

# PatientTransport_service
CONSTRUCT {
	<http://127.0.0.1/service#PatientTransport_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?PatientTransport_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?PatientTransport_PatientGpsPosition .
	?PatientTransport_PatientGpsPosition <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/HospitalPhysicianOntology.owl#GpsPosition> .
	?PatientTransport_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?SeePatientMedicalRecords_PhysicianPassword .
	?SeePatientMedicalRecords_PhysicianPassword <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/HospitalPhysicianOntology.owl#AccountPassword> .
	?PatientTransport_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?PatientTransport_Diagnosis .
	?PatientTransport_Diagnosis <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/HospitalPhysicianOntology.owl#Diagnosis> .
	?PatientTransport_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?PatientTransport_ChosenHospital .
	?PatientTransport_ChosenHospital <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/HospitalPhysicianOntology.owl#Hospital> .
	?PatientTransport_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?SeePatientMedicalRecords_PatientMedicalRecords .
	?SeePatientMedicalRecords_PatientMedicalRecords <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/HospitalPhysicianOntology.owl#MedicalRecords> .
	?PatientTransport_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?PatientTransport_Acknowledgement .
	?PatientTransport_Acknowledgement <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/HospitalPhysicianOntology.owl#Acknowledgement> .
	?SeePatientMedicalRecords_PhysicianPassword <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/ontosem.owl#Accepted> .
}

# personbookliabilityaccount__service
CONSTRUCT {
	<http://127.0.0.1/service#personbookliabilityaccount__service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?personbookliabilityaccount__service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_LIABILITYACCOUNT .
	?_LIABILITYACCOUNT <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/Mid-level-ontology.owl#LiabilityAccount> .
	?personbookliabilityaccount__service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_BOOK .
	?_BOOK <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#Book> .
	?personbookliabilityaccount__service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_PERSON .
	?_PERSON <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#Person> .
	?_LIABILITYACCOUNT <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/ontosem.owl#Accepted> .
	?_PERSON <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
	?_PERSON <http://127.0.0.1/ontology/Mid-level-ontology.owl#accountHolder> ?_LIABILITYACCOUNT .
}

# personcountrycity_sportshotel_service
CONSTRUCT {
	<http://127.0.0.1/service#personcountrycity_sportshotel_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?personcountrycity_sportshotel_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_CITY .
	?_CITY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/travel.owl#City> .
	?personcountrycity_sportshotel_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_COUNTRY .
	?_COUNTRY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/portal.owl#Country> .
	?personcountrycity_sportshotel_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_PERSON .
	?_PERSON <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/portal.owl#Person> .
	?personcountrycity_sportshotel_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_SPORTS .
	?_SPORTS <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/travel.owl#Sports> .
	?personcountrycity_sportshotel_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_HOTEL .
	?_HOTEL <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/travel.owl#Hotel> .
	?_CITY <http://127.0.0.1/ontology/protont.owl#locatedIn> ?_COUNTRY .
}

# personmonographcreditcardaccount__service
CONSTRUCT {
	<http://127.0.0.1/service#personmonographcreditcardaccount__service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?personmonographcreditcardaccount__service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_CREDITCARDACCOUNT .
	?_CREDITCARDACCOUNT <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/Mid-level-ontology.owl#CreditCardAccount> .
	?personmonographcreditcardaccount__service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_MONOGRAPH .
	?_MONOGRAPH <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#Monograph> .
	?personmonographcreditcardaccount__service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_PERSON .
	?_PERSON <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#Person> .
	?_CREDITCARDACCOUNT <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/ontosem.owl#Accepted> .
	?_PERSON <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
	?_PERSON <http://127.0.0.1/ontology/Mid-level-ontology.owl#accountHolder> ?_CREDITCARDACCOUNT .
}

# postal-addresscity_hotel_service
CONSTRUCT {
	<http://127.0.0.1/service#postal-addresscity_hotel_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?postal_addresscity_hotel_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_CITY .
	?_CITY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/portal.owl#City> .
	?postal_addresscity_hotel_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_POSTAL_ADDRESS .
	?_POSTAL_ADDRESS <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/portal.owl#Postal-Address> .
	?postal_addresscity_hotel_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_HOTEL .
	?_HOTEL <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/travel.owl#Hotel> .
	?_CITY <http://127.0.0.1/ontology/protont.owl#locatedIn> ?_EUROPE .
}

# printedmaterialpersoncreditcardaccount_price_service
CONSTRUCT {
	<http://127.0.0.1/service#printedmaterialpersoncreditcardaccount_price_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?printedmaterialpersoncreditcardaccount_price_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_PERSON .
	?_PERSON <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#Person> .
	?printedmaterialpersoncreditcardaccount_price_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_PRINTEDMATERIAL .
	?_PRINTEDMATERIAL <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#PrintedMaterial> .
	?printedmaterialpersoncreditcardaccount_price_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_CREDITCARDACCOUNT .
	?_CREDITCARDACCOUNT <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/Mid-level-ontology.owl#CreditCardAccount> .
	?printedmaterialpersoncreditcardaccount_price_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_PRICE .
	?_PRICE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/concept.owl#Price> .
	?_CREDITCARDACCOUNT <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/ontosem.owl#Accepted> .
	?_PERSON <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
	?_PERSON <http://127.0.0.1/ontology/Mid-level-ontology.owl#accountHolder> ?_CREDITCARDACCOUNT .
}

# printedmaterialpersoncreditcardaccount__service
CONSTRUCT {
	<http://127.0.0.1/service#printedmaterialpersoncreditcardaccount__service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?printedmaterialpersoncreditcardaccount__service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_PERSON .
	?_PERSON <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#Person> .
	?printedmaterialpersoncreditcardaccount__service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_PRINTEDMATERIAL .
	?_PRINTEDMATERIAL <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#PrintedMaterial> .
	?printedmaterialpersoncreditcardaccount__service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_CREDITCARDACCOUNT .
	?_CREDITCARDACCOUNT <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/Mid-level-ontology.owl#CreditCardAccount> .
	?_CREDITCARDACCOUNT <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/ontosem.owl#Accepted> .
	?_PERSON <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
	?_PERSON <http://127.0.0.1/ontology/Mid-level-ontology.owl#accountHolder> ?_CREDITCARDACCOUNT .
}

# printedmaterialperson__service
CONSTRUCT {
	<http://127.0.0.1/service#printedmaterialperson__service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?printedmaterialperson__service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_PRINTEDMATERIAL .
	?_PRINTEDMATERIAL <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#PrintedMaterial> .
	?printedmaterialperson__service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_PERSON .
	?_PERSON <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#Person> .
	?_PERSON <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
}

# ProvideMedicalFlightInformation_services
CONSTRUCT {
	<http://127.0.0.1/service#ProvideMedicalFlightInformation_services> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?ProvideMedicalFlightInformation_services <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?BookMedicalFlight_Account .
	?BookMedicalFlight_Account <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/MedicalFlightCompanyOntology.owl#Account> .
	?ProvideMedicalFlightInformation_services <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?ProvideMedicalFlightInformation_DesiredArrivalAirport .
	?ProvideMedicalFlightInformation_DesiredArrivalAirport <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/MedicalFlightCompanyOntology.owl#Airport> .
	?ProvideMedicalFlightInformation_services <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?ProvideMedicalFlightInformation_DesiredTreatment .
	?ProvideMedicalFlightInformation_DesiredTreatment <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/MedicalFlightCompanyOntology.owl#Treatment> .
	?ProvideMedicalFlightInformation_services <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?BookMedicalFlight_FlightNumber .
	?BookMedicalFlight_FlightNumber <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/MedicalFlightCompanyOntology.owl#FlightNumber> .
	?ProvideMedicalFlightInformation_services <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?ProvideMedicalFlightInformation_DesiredDepartureAirport .
	?ProvideMedicalFlightInformation_DesiredDepartureAirport <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/MedicalFlightCompanyOntology.owl#Airport> .
	?ProvideMedicalFlightInformation_services <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?ProvideMedicalFlightInformation_FlightCategory .
	?ProvideMedicalFlightInformation_FlightCategory <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/MedicalFlightCompanyOntology.owl#FlightCategory> .
	?ProvideMedicalFlightInformation_services <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?ProvideMedicalFlightInformation_DesiredDepartureDateTime .
	?ProvideMedicalFlightInformation_DesiredDepartureDateTime <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/MedicalFlightCompanyOntology.owl#DateTime> .
	?ProvideMedicalFlightInformation_services <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?ProvideMedicalFlightInformation_Diagnosis .
	?ProvideMedicalFlightInformation_Diagnosis <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/MedicalFlightCompanyOntology.owl#Diagnosis> .
	?ProvideMedicalFlightInformation_services <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?ProvideMedicalFlightInformation_ListOfFlights .
	?ProvideMedicalFlightInformation_ListOfFlights <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/MedicalFlightCompanyOntology.owl#ListOfFlights> .
	?BookMedicalFlight_Account <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/ontosem.owl#Accepted> .
	<http://www.w3.org/2002/07/owl#AllDifferent> <http://www.w3.org/2002/07/owl#distinctMembers> ?var54 .
	?var54 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> ?ProvideMedicalFlightInformation_DesiredArrivalAirport .
	?var54 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> ?var55 .
	?var55 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> ?ProvideMedicalFlightInformation_DesiredDepartureAirport .
	?var55 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> <http://www.w3.org/1999/02/22-rdf-syntax-ns#nil> .
}

# publicationperson__service
CONSTRUCT {
	<http://127.0.0.1/service#publicationperson__service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?publicationperson__service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_PERSON .
	?_PERSON <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#Person> .
	?publicationperson__service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_PUBLICATION .
	?_PUBLICATION <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#Publication> .
	?_PERSON <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
}

# redLight_to_off
CONSTRUCT {
	<http://127.0.0.1/service#redLight_to_off> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?redLight_to_off <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?MesseModul .
	?MesseModul <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#MesseModul> .
	?redLight_to_off <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?Magazine .
	?Magazine <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#Magazine> .
	?redLight_to_off <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?RedLamp .
	?RedLamp <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#RedLamp> .
	?RedLamp <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#On> .
	?Magazine <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#Full> .
	?MesseModul <http://127.0.0.1/ontology/messemodul.owl#consistsOf> ?RedLamp .
	?MesseModul <http://127.0.0.1/ontology/messemodul.owl#consistsOf> ?Magazine .
}

# redLight_to_on
CONSTRUCT {
	<http://127.0.0.1/service#redLight_to_on> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?redLight_to_on <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?MesseModul .
	?MesseModul <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#MesseModul> .
	?redLight_to_on <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?Magazine .
	?Magazine <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#Magazine> .
	?redLight_to_on <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?RedLamp .
	?RedLamp <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#RedLamp> .
	?RedLamp <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#Off> .
	?Magazine <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#Empty> .
	?MesseModul <http://127.0.0.1/ontology/messemodul.owl#consistsOf> ?RedLamp .
	?MesseModul <http://127.0.0.1/ontology/messemodul.owl#consistsOf> ?Magazine .
}

# science-fiction-noveluser_recommendedpriceindollar_service
CONSTRUCT {
	<http://127.0.0.1/service#science-fiction-noveluser_recommendedpriceindollar_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?science_fiction_noveluser_recommendedpriceindollar_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_USER .
	?_USER <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#User> .
	?science_fiction_noveluser_recommendedpriceindollar_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_SCIENCE_FICTION_NOVEL .
	?_SCIENCE_FICTION_NOVEL <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#Science-Fiction-Novel> .
	?science_fiction_noveluser_recommendedpriceindollar_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_RECOMMENDEDPRICEINDOLLAR .
	?_RECOMMENDEDPRICEINDOLLAR <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/concept.owl#RecommendedPriceInDollar> .
	?_USER <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
}

# sciencefictionbookuser_price_service
CONSTRUCT {
	<http://127.0.0.1/service#sciencefictionbookuser_price_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?sciencefictionbookuser_price_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_USER .
	?_USER <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#User> .
	?sciencefictionbookuser_price_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_SCIENCEFICTIONBOOK .
	?_SCIENCEFICTIONBOOK <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#ScienceFictionBook> .
	?sciencefictionbookuser_price_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_PRICE .
	?_PRICE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/concept.owl#Price> .
	?_USER <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
}

# ScienceFNovelReview_service
CONSTRUCT {
	<http://127.0.0.1/service#ScienceFNovelReview_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?ScienceFNovelReview_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_SCIENCE_FICTION_NOVEL .
	?_SCIENCE_FICTION_NOVEL <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#Science-Fiction-Novel> .
	?ScienceFNovelReview_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_USER .
	?_USER <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#User> .
	?ScienceFNovelReview_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_RECOMMENDEDPRICE .
	?_RECOMMENDEDPRICE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/concept.owl#RecommendedPrice> .
	?ScienceFNovelReview_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_REVIEW .
	?_REVIEW <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#Review> .
	?_USER <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
}

# SeePatientMedicalRecords_service
CONSTRUCT {
	<http://127.0.0.1/service#SeePatientMedicalRecords_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?SeePatientMedicalRecords_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?SeePatientMedicalRecords_PhysicianPassword .
	?SeePatientMedicalRecords_PhysicianPassword <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/HospitalPhysicianOntology.owl#AccountPassword> .
	?SeePatientMedicalRecords_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?SeePatientMedicalRecords_PhysicianAuthorization .
	?SeePatientMedicalRecords_PhysicianAuthorization <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/HospitalPhysicianOntology.owl#Authorization> .
	?SeePatientMedicalRecords_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?SeePatientMedicalRecords_PatientHealthInsuranceNumber .
	?SeePatientMedicalRecords_PatientHealthInsuranceNumber <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/HospitalPhysicianOntology.owl#HealthInsuranceNumber> .
	?SeePatientMedicalRecords_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?SeePatientMedicalRecords_PhysicianID .
	?SeePatientMedicalRecords_PhysicianID <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/HospitalPhysicianOntology.owl#PhysicianID> .
	?SeePatientMedicalRecords_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?SeePatientMedicalRecords_PatientMedicalRecords .
	?SeePatientMedicalRecords_PatientMedicalRecords <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/HospitalPhysicianOntology.owl#MedicalRecords> .
	?SeePatientMedicalRecords_PhysicianID <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
	?SeePatientMedicalRecords_PhysicianPassword <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
}

# SetUpCostAndHealingPlan_service
CONSTRUCT {
	<http://127.0.0.1/service#SetUpCostAndHealingPlan_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?SetUpCostAndHealingPlan_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?SetUpCostAndHealingPlan_Diagnosis .
	?SetUpCostAndHealingPlan_Diagnosis <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/HospitalPhysicianOntology.owl#Diagnosis> .
	?SetUpCostAndHealingPlan_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?PatientTransport_PatientGpsPosition .
	?PatientTransport_PatientGpsPosition <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/HospitalPhysicianOntology.owl#GpsPosition> .
	?SetUpCostAndHealingPlan_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?SetUpCostAndHealingPlan_RequiredDrugs .
	?SetUpCostAndHealingPlan_RequiredDrugs <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/HospitalPhysicianOntology.owl#Drug> .
	?SetUpCostAndHealingPlan_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?UpdatePatientMedicalRecords_Treatment .
	?UpdatePatientMedicalRecords_Treatment <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/HospitalPhysicianOntology.owl#Treatment> .
	?SetUpCostAndHealingPlan_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?SetUpCostAndHealingPlan_TreatmentDateTime .
	?SetUpCostAndHealingPlan_TreatmentDateTime <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/HospitalPhysicianOntology.owl#DateTime> .
	?SetUpCostAndHealingPlan_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?SetUpCostAndHealingPlan_PatientName .
	?SetUpCostAndHealingPlan_PatientName <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/HospitalPhysicianOntology.owl#PersonName> .
	?SetUpCostAndHealingPlan_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?SetUpCostAndHealingPlan_PhysicianID .
	?SetUpCostAndHealingPlan_PhysicianID <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/HospitalPhysicianOntology.owl#PhysicianID> .
	?SetUpCostAndHealingPlan_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?SetUpCostAndHealingPlan_PatientHealthInsuranceNumber .
	?SetUpCostAndHealingPlan_PatientHealthInsuranceNumber <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/HospitalPhysicianOntology.owl#HealthInsuranceNumber> .
	?SetUpCostAndHealingPlan_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?SetUpCostAndHealingPlan_CostAndHealingPlan .
	?SetUpCostAndHealingPlan_CostAndHealingPlan <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/HospitalPhysicianOntology.owl#CostAndHealingPlan> .
	?SetUpCostAndHealingPlan_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?UpdatePatientMedicalRecords_Acknowledgement .
	?UpdatePatientMedicalRecords_Acknowledgement <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/HospitalPhysicianOntology.owl#Acknowledgement> .
	?SetUpCostAndHealingPlan_PhysicianID <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
}

# SFNovelReview_service
CONSTRUCT {
	<http://127.0.0.1/service#SFNovelReview_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?SFNovelReview_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_USER .
	?_USER <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#User> .
	?SFNovelReview_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_SCIENCE_FICTION_NOVEL .
	?_SCIENCE_FICTION_NOVEL <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#Science-Fiction-Novel> .
	?SFNovelReview_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_RECOMMENDEDPRICEINEURO .
	?_RECOMMENDEDPRICEINEURO <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/concept.owl#RecommendedPriceInEuro> .
	?SFNovelReview_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_REVIEW .
	?_REVIEW <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#Review> .
	?_USER <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
}

# SFNRecommendedPrice_service
CONSTRUCT {
	<http://127.0.0.1/service#SFNRecommendedPrice_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?SFNRecommendedPrice_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_SCIENCE_FICTION_NOVEL .
	?_SCIENCE_FICTION_NOVEL <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#Science-Fiction-Novel> .
	?SFNRecommendedPrice_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_USER .
	?_USER <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#User> .
	?SFNRecommendedPrice_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_RECOMMENDEDPRICE .
	?_RECOMMENDEDPRICE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/concept.owl#RecommendedPrice> .
	?_USER <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
}

# surfingorganizationperson_destination_service
CONSTRUCT {
	<http://127.0.0.1/service#surfingorganizationperson_destination_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?surfingorganizationperson_destination_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_PERSON .
	?_PERSON <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/portal.owl#Person> .
	?surfingorganizationperson_destination_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_ORGANIZATION .
	?_ORGANIZATION <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/portal.owl#Organization> .
	?surfingorganizationperson_destination_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_SURFING .
	?_SURFING <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/travel.owl#Surfing> .
	?surfingorganizationperson_destination_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_DESTINATION .
	?_DESTINATION <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/travel.owl#Destination> .
	?_PERSON <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
}

# switch_off_messemodul
CONSTRUCT {
	<http://127.0.0.1/service#switch_off_messemodul> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?switch_off_messemodul <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?MesseModul .
	?MesseModul <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#MesseModul> .
	?MesseModul <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#On> .
}

# switch_on_messemodul
CONSTRUCT {
	<http://127.0.0.1/service#switch_on_messemodul> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?switch_on_messemodul <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?MesseModul .
	?MesseModul <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#MesseModul> .
	?MesseModul <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#Off> .
}

# time-measurecountrycity_hotel_service
CONSTRUCT {
	<http://127.0.0.1/service#time-measurecountrycity_hotel_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?time_measurecountrycity_hotel_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_CITY .
	?_CITY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/travel.owl#City> .
	?time_measurecountrycity_hotel_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_COUNTRY .
	?_COUNTRY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/portal.owl#Country> .
	?time_measurecountrycity_hotel_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_TIME_MEASURE .
	?_TIME_MEASURE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/support.owl#Time-Measure> .
	?time_measurecountrycity_hotel_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_HOTEL .
	?_HOTEL <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/travel.owl#Hotel> .
	?_CITY <http://127.0.0.1/ontology/protont.owl#locatedIn> ?_COUNTRY .
}

# time-measuregeopolitical-entitycity_accommodation_service
CONSTRUCT {
	<http://127.0.0.1/service#time-measuregeopolitical-entitycity_accommodation_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?time_measuregeopolitical_entitycity_accommodation_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_CITY .
	?_CITY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/travel.owl#City> .
	?time_measuregeopolitical_entitycity_accommodation_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_GEOPOLITICAL_ENTITY .
	?_GEOPOLITICAL_ENTITY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/portal.owl#Geopolitical-Entity> .
	?time_measuregeopolitical_entitycity_accommodation_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_TIME_MEASURE .
	?_TIME_MEASURE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/support.owl#Time-Measure> .
	?time_measuregeopolitical_entitycity_accommodation_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_ACCOMMODATION .
	?_ACCOMMODATION <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/travel.owl#Accommodation> .
	?_CITY <http://127.0.0.1/ontology/protont.owl#locatedIn> ?_GEOPOLITICAL_ENTITY .
}

# time-measuregeopolitical-entitycity_bedandbreakfast_service
CONSTRUCT {
	<http://127.0.0.1/service#time-measuregeopolitical-entitycity_bedandbreakfast_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?time_measuregeopolitical_entitycity_bedandbreakfast_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_CITY .
	?_CITY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/travel.owl#City> .
	?time_measuregeopolitical_entitycity_bedandbreakfast_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_GEOPOLITICAL_ENTITY .
	?_GEOPOLITICAL_ENTITY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/portal.owl#Geopolitical-Entity> .
	?time_measuregeopolitical_entitycity_bedandbreakfast_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_TIME_MEASURE .
	?_TIME_MEASURE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/support.owl#Time-Measure> .
	?time_measuregeopolitical_entitycity_bedandbreakfast_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_BEDANDBREAKFAST .
	?_BEDANDBREAKFAST <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/travel.owl#BedAndBreakfast> .
	?_CITY <http://127.0.0.1/ontology/protont.owl#locatedIn> ?_GEOPOLITICAL_ENTITY .
}

# time-measuregeopolitical-entitycity_hotel_service
CONSTRUCT {
	<http://127.0.0.1/service#time-measuregeopolitical-entitycity_hotel_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?time_measuregeopolitical_entitycity_hotel_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_CITY .
	?_CITY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/travel.owl#City> .
	?time_measuregeopolitical_entitycity_hotel_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_GEOPOLITICAL_ENTITY .
	?_GEOPOLITICAL_ENTITY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/portal.owl#Geopolitical-Entity> .
	?time_measuregeopolitical_entitycity_hotel_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_TIME_MEASURE .
	?_TIME_MEASURE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/support.owl#Time-Measure> .
	?time_measuregeopolitical_entitycity_hotel_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_HOTEL .
	?_HOTEL <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/travel.owl#Hotel> .
	?_CITY <http://127.0.0.1/ontology/protont.owl#locatedIn> ?_GEOPOLITICAL_ENTITY .
}

# towncountry_hotel_service
CONSTRUCT {
	<http://127.0.0.1/service#towncountry_hotel_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?towncountry_hotel_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_COUNTRY .
	?_COUNTRY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/portal.owl#Country> .
	?towncountry_hotel_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_TOWN .
	?_TOWN <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/portal.owl#Town> .
	?towncountry_hotel_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_HOTEL .
	?_HOTEL <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/travel.owl#Hotel> .
	?_TOWN <http://127.0.0.1/ontology/protont.owl#locatedIn> ?_COUNTRY .
}

# unlock_door
CONSTRUCT {
	<http://127.0.0.1/service#unlock_door> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?unlock_door <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?Door .
	?Door <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#Door> .
	?Door <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#Closed> .
	?Door <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#Locked> .
}

# UnsuccessfulDiagnosis_service
CONSTRUCT {
	<http://127.0.0.1/service#UnsuccessfulDiagnosis_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?UnsuccessfulDiagnosis_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_DIAGNOSTICPROCESS .
	?_DIAGNOSTICPROCESS <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/SUMO.owl#DiagnosticProcess> .
	?UnsuccessfulDiagnosis_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_REASONING .
	?_REASONING <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/SUMO.owl#Reasoning> .
	?_DIAGNOSTICPROCESS <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/ontosem.owl#has-unexpected-outcome> .
}

# UpdatePatientMedicalRecords_service
CONSTRUCT {
	<http://127.0.0.1/service#UpdatePatientMedicalRecords_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?UpdatePatientMedicalRecords_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?UpdatePatientMedicalRecords_Treatment .
	?UpdatePatientMedicalRecords_Treatment <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/HospitalPhysicianOntology.owl#Treatment> .
	?UpdatePatientMedicalRecords_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?UpdatePatientMedicalRecords_PatientHealthInsuranceNumber .
	?UpdatePatientMedicalRecords_PatientHealthInsuranceNumber <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/HospitalPhysicianOntology.owl#HealthInsuranceNumber> .
	?UpdatePatientMedicalRecords_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?PatientTransport_PatientGpsPosition .
	?PatientTransport_PatientGpsPosition <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/HospitalPhysicianOntology.owl#GpsPosition> .
	?UpdatePatientMedicalRecords_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?UpdatePatientMedicalRecords_PhysicianID .
	?UpdatePatientMedicalRecords_PhysicianID <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/HospitalPhysicianOntology.owl#PhysicianID> .
	?UpdatePatientMedicalRecords_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?UpdatePatientMedicalRecords_UsedDrugs .
	?UpdatePatientMedicalRecords_UsedDrugs <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/HospitalPhysicianOntology.owl#Drug> .
	?UpdatePatientMedicalRecords_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?UpdatePatientMedicalRecords_Diagnosis .
	?UpdatePatientMedicalRecords_Diagnosis <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/HospitalPhysicianOntology.owl#Diagnosis> .
	?UpdatePatientMedicalRecords_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?UpdatePatientMedicalRecords_TreatmentDateTime .
	?UpdatePatientMedicalRecords_TreatmentDateTime <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/HospitalPhysicianOntology.owl#DateTime> .
	?UpdatePatientMedicalRecords_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?UpdatePatientMedicalRecords_PhysicianAuthorization .
	?UpdatePatientMedicalRecords_PhysicianAuthorization <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/HospitalPhysicianOntology.owl#Authorization> .
	?UpdatePatientMedicalRecords_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?UpdatePatientMedicalRecords_PhysicianPassword .
	?UpdatePatientMedicalRecords_PhysicianPassword <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/HospitalPhysicianOntology.owl#AccountPassword> .
	?UpdatePatientMedicalRecords_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?UpdatePatientMedicalRecords_Acknowledgement .
	?UpdatePatientMedicalRecords_Acknowledgement <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/HospitalPhysicianOntology.owl#Acknowledgement> .
	?UpdatePatientMedicalRecords_PhysicianID <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
	?UpdatePatientMedicalRecords_PhysicianPassword <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
}

# userbook_price_service
CONSTRUCT {
	<http://127.0.0.1/service#userbook_price_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?userbook_price_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_BOOK .
	?_BOOK <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#Book> .
	?userbook_price_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_USER .
	?_USER <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#User> .
	?userbook_price_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_PRICE .
	?_PRICE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/concept.owl#Price> .
	?_USER <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
}

# userRomanticnovel_price_service
CONSTRUCT {
	<http://127.0.0.1/service#userRomanticnovel_price_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?userRomanticnovel_price_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_ROMANTICNOVEL .
	?_ROMANTICNOVEL <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#RomanticNovel> .
	?userRomanticnovel_price_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_USER .
	?_USER <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#User> .
	?userRomanticnovel_price_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_PRICE .
	?_PRICE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/concept.owl#Price> .
	?_USER <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
}

# userscience-fiction-novel_price_Bestservice
CONSTRUCT {
	<http://127.0.0.1/service#userscience-fiction-novel_price_Bestservice> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?userscience_fiction_novel_price_Bestservice <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_SCIENCE_FICTION_NOVEL .
	?_SCIENCE_FICTION_NOVEL <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#Science-Fiction-Novel> .
	?userscience_fiction_novel_price_Bestservice <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_USER .
	?_USER <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#User> .
	?userscience_fiction_novel_price_Bestservice <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_PRICE .
	?_PRICE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/concept.owl#Price> .
	?_USER <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
}

# userscience-fiction-novel_price_service
CONSTRUCT {
	<http://127.0.0.1/service#userscience-fiction-novel_price_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?userscience_fiction_novel_price_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_SCIENCE_FICTION_NOVEL .
	?_SCIENCE_FICTION_NOVEL <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#Science-Fiction-Novel> .
	?userscience_fiction_novel_price_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_USER .
	?_USER <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#User> .
	?userscience_fiction_novel_price_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_PRICE .
	?_PRICE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/concept.owl#Price> .
	?_USER <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
}

# userscience-fiction-novel_Relprice_service
CONSTRUCT {
	<http://127.0.0.1/service#userscience-fiction-novel_Relprice_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?userscience_fiction_novel_Relprice_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_SCIENCE_FICTION_NOVEL .
	?_SCIENCE_FICTION_NOVEL <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#Science-Fiction-Novel> .
	?userscience_fiction_novel_Relprice_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_USER .
	?_USER <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#User> .
	?userscience_fiction_novel_Relprice_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_PRICE .
	?_PRICE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/concept.owl#Price> .
	?_USER <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
}

# user_price_ShoppingStatusservice
CONSTRUCT {
	<http://127.0.0.1/service#user_price_ShoppingStatusservice> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?user_price_ShoppingStatusservice <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_USER .
	?_USER <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#User> .
	?user_price_ShoppingStatusservice <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?_PRICE .
	?_PRICE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/concept.owl#Price> .
	?_USER <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
}

