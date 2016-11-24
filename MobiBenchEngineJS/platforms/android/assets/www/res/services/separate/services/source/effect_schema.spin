# AcceptCostAndHealingPlan_service
CONSTRUCT {
	<http://127.0.0.1/service#AcceptCostAndHealingPlan_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?AcceptCostAndHealingPlan_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?AcceptCostAndHealingPlan_CostAndHealingPlan .
	?AcceptCostAndHealingPlan_CostAndHealingPlan <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/PatientOntology.owl#CostAndHealingPlan> .
	?AcceptCostAndHealingPlan_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?AcceptCostAndHealingPlan_CostAndHealingPlanAcceptanceAnswer .
	?AcceptCostAndHealingPlan_CostAndHealingPlanAcceptanceAnswer <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/PatientOntology.owl#Acknowledgement> .
	?AcceptCostAndHealingPlan_Treatment <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
}

# AddLinks__service
CONSTRUCT {
	<http://127.0.0.1/service#AddLinks__service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?AddLinks__service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_GEOPOLITICAL_ENTITY .
	?_GEOPOLITICAL_ENTITY <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/portal.owl#Geopolitical-Entity> .
	?AddLinks__service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_GEOPOLITICAL_ENTITY1 .
	?_GEOPOLITICAL_ENTITY1 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/portal.owl#Geopolitical-Entity> .
	?_GEOPOLITICAL_ENTITY <http://127.0.0.1/ontology/SUMO.owl#linked> ?_GEOPOLITICAL_ENTITY1 .
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
	?Agent <http://127.0.0.1/ontology/messemodul.owl#isLocatedIn> ?FuturePosition .
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
	?BookMedicalFlight_SeatNumber <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/TravelMessageOntology.owl#Booking> .
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
	?BookMedicalTransport_SeatNumber <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/TravelMessageOntology.owl#Booking> .
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
	?BookNonMedicalFlight_SeatNumber <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/TravelMessageOntology.owl#Booking> .
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
	?BookNonMedicalTransport_SeatNumber <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/TravelMessageOntology.owl#Booking> .
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
	?_BOOK <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/ShoppingCart.owl#ShoppingCartRequestItems> .
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
	?_BOOK <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/ShoppingCart.owl#ShoppingCartRequestItems> .
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
	?_BOOK <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/ShoppingCart.owl#ShoppingCartRequestItems> .
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
	?_BOOK <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/ShoppingCart.owl#ShoppingCartRequestItems> .
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
	?_BOOK <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/ShoppingCart.owl#ShoppingCartRequestItems> .
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
	?_BOOK <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/ShoppingCart.owl#ShoppingCartRequestItems> .
}

# book__ShoppingCartservice
CONSTRUCT {
	<http://127.0.0.1/service#book__ShoppingCartservice> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?book__ShoppingCartservice <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_BOOK .
	?_BOOK <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#Book> .
	?_BOOK <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/ShoppingCart.owl#ShoppingCartRequestItems> .
}

# CheckCostAndHealingPlan_service
CONSTRUCT {
	<http://127.0.0.1/service#CheckCostAndHealingPlan_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?CheckCostAndHealingPlan_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?CheckCostAndHealingPlan_PatientHealthInsuranceNumber .
	?CheckCostAndHealingPlan_PatientHealthInsuranceNumber <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/HealthInsuranceOntology.owl#HealthInsuranceNumber> .
	?CheckCostAndHealingPlan_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?CheckCostAndHealingPlan_CostAndHealingPlan .
	?CheckCostAndHealingPlan_CostAndHealingPlan <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/HealthInsuranceOntology.owl#CostAndHealingPlan> .
	?CheckCostAndHealingPlan_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?CheckCostAndHealingPlan_AcceptanceAnswer .
	?CheckCostAndHealingPlan_AcceptanceAnswer <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/HealthInsuranceOntology.owl#AcceptanceAnswer> .
	?CheckCostAndHealingPlan_Treatment <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
}

# CheckEquipmentAvailability_service
CONSTRUCT {
	<http://127.0.0.1/service#CheckEquipmentAvailability_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?CheckEquipmentAvailability_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?CheckPersonnelAvailability_TreatmentRecomendation .
	?CheckPersonnelAvailability_TreatmentRecomendation <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/HospitalReceptionOntology.owl#Treatment> .
	?CheckEquipmentAvailability_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?CheckHospitalAvailability_TreatmentRecomendation .
	?CheckHospitalAvailability_TreatmentRecomendation <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/HospitalReceptionOntology.owl#Treatment> .
	?CheckEquipmentAvailability_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?CheckEquipmentAvailability_TreatmentDate .
	?CheckEquipmentAvailability_TreatmentDate <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/HospitalReceptionOntology.owl#DateTime> .
	?CheckEquipmentAvailability_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?CheckEquipmentAvailability_TreatmentRecomendation .
	?CheckEquipmentAvailability_TreatmentRecomendation <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/HospitalReceptionOntology.owl#Treatment> .
	?CheckEquipmentAvailability_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?CheckEquipmentAvailability_AvailabilityResponse .
	?CheckEquipmentAvailability_AvailabilityResponse <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/HospitalReceptionOntology.owl#AvailabilityResponse> .
	?_Treatment <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
}

# CheckHospitalAvailability_service
CONSTRUCT {
	<http://127.0.0.1/service#CheckHospitalAvailability_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?CheckHospitalAvailability_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?CheckPersonnelAvailability_TreatmentRecomendation .
	?CheckPersonnelAvailability_TreatmentRecomendation <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/HospitalReceptionOntology.owl#Treatment> .
	?CheckHospitalAvailability_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?CheckHospitalAvailability_TreatmentRecomendation .
	?CheckHospitalAvailability_TreatmentRecomendation <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/HospitalReceptionOntology.owl#Treatment> .
	?CheckHospitalAvailability_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?CheckHospitalAvailability_TreatmentDate .
	?CheckHospitalAvailability_TreatmentDate <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/HospitalReceptionOntology.owl#DateTime> .
	?CheckHospitalAvailability_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?CheckHospitalAvailability_AvailabilityResponse .
	?CheckHospitalAvailability_AvailabilityResponse <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/HospitalReceptionOntology.owl#AvailabilityResponse> .
	?_Treatment <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
}

# CheckPersonnelAvailability_service
CONSTRUCT {
	<http://127.0.0.1/service#CheckPersonnelAvailability_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?CheckPersonnelAvailability_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?CheckPersonnelAvailability_TreatmentRecomendation .
	?CheckPersonnelAvailability_TreatmentRecomendation <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/HospitalReceptionOntology.owl#Treatment> .
	?CheckPersonnelAvailability_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?CheckHospitalAvailability_TreatmentRecomendation .
	?CheckHospitalAvailability_TreatmentRecomendation <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/HospitalReceptionOntology.owl#Treatment> .
	?CheckPersonnelAvailability_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?CheckPersonnelAvailability_TreatmentDate .
	?CheckPersonnelAvailability_TreatmentDate <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/HospitalReceptionOntology.owl#DateTime> .
	?CheckPersonnelAvailability_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?CheckPersonnelAvailability_AvailabilityResponse .
	?CheckPersonnelAvailability_AvailabilityResponse <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/HospitalReceptionOntology.owl#AvailabilityResponse> .
	?_Treatment <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
}

# CheckRoomAvailability_service
CONSTRUCT {
	<http://127.0.0.1/service#CheckRoomAvailability_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?CheckRoomAvailability_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?CheckHospitalAvailability_TreatmentRecomendation .
	?CheckHospitalAvailability_TreatmentRecomendation <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/HospitalReceptionOntology.owl#Treatment> .
	?CheckRoomAvailability_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?CheckRoomAvailability_TreatmentDate .
	?CheckRoomAvailability_TreatmentDate <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/HospitalReceptionOntology.owl#DateTime> .
	?CheckRoomAvailability_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?CheckRoomAvailability_TreatmentRecomendation .
	?CheckRoomAvailability_TreatmentRecomendation <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/HospitalReceptionOntology.owl#Treatment> .
	?CheckRoomAvailability_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasOutput> ?CheckRoomAvailability_AvailabilityResponse .
	?CheckRoomAvailability_AvailabilityResponse <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/HospitalReceptionOntology.owl#AvailabilityResponse> .
	?_Treatment <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
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
	?_HOTEL <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/travel.owl#isReserved> .
}

# close_door
CONSTRUCT {
	<http://127.0.0.1/service#close_door> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?close_door <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?Door .
	?Door <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#Door> .
	?Door <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#Closed> .
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
	?EBook <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/ShoppingCart.owl#ShoppingCartRequestItems> .
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
	?EBook <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/ShoppingCart.owl#ShoppingCartRequestItems> .
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
	?EBook <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/ShoppingCart.owl#ShoppingCartRequestItems> .
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
	?Pill <http://127.0.0.1/ontology/spatial_ontology.owl#isLocatedIn> ?CupZone .
}

# fill_pills
CONSTRUCT {
	<http://127.0.0.1/service#fill_pills> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?fill_pills <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?Magazine .
	?Magazine <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#Magazine> .
	?Magazine <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#Full> .
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
	?Slider <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#Down> .
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
	?BluePill <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#released> .
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
	?Slider <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#Up> .
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
	?GetMedicalFlightAccount_Account <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Create> .
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
	?GetMedicalTransportAccount_Account <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Create> .
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
	?GetNonMedicalFlightAccount_Account <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Create> .
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
	?GetNonMedicalTransportAccount_Account <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Create> .
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
	?GreenLamp <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#Off> .
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
	?GreenLamp <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#On> .
}

# KLM-Login_service
CONSTRUCT {
	<http://127.0.0.1/service#KLM-Login_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?KLM_Login_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_LINGUISTICEXPRESSION .
	?_LINGUISTICEXPRESSION <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#LinguisticExpression> .
	?KLM_Login_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_LINGUISTICEXPRESSION1 .
	?_LINGUISTICEXPRESSION1 <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#LinguisticExpression> .
	?_USER <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/ontosem.owl#register> .
}

# lock_door
CONSTRUCT {
	<http://127.0.0.1/service#lock_door> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?lock_door <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?Door .
	?Door <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#Door> .
	?Door <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#Locked> .
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
	?_MONOGRAPH <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/ShoppingCart.owl#ShoppingCartRequestItems> .
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
	?_NOVEL <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/ontosem.owl#reserve> .
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
	?_OBJECT <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/ShoppingCart.owl#ShoppingCartRequestItems> .
}

# open_door
CONSTRUCT {
	<http://127.0.0.1/service#open_door> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?open_door <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?Door .
	?Door <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#Door> .
	?Door <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#Open> .
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
	?_BOOK <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/ShoppingCart.owl#ShoppingCartRequestItems> .
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
	?_MONOGRAPH <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/ShoppingCart.owl#ShoppingCartRequestItems> .
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
	?_PRINTEDMATERIAL <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/ShoppingCart.owl#ShoppingCartRequestItems> .
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
	?_PRINTEDMATERIAL <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/ShoppingCart.owl#ShoppingCartRequestItems> .
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
	?_PUBLICATION <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/ShoppingCart.owl#ShoppingCartRequestItems> .
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
	?RedLamp <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#Off> .
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
	?RedLamp <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#On> .
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
	?UpdatePatientMedicalRecords_Treatment <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/core-plus-office.owl#Authorized> .
}

# switch_off_messemodul
CONSTRUCT {
	<http://127.0.0.1/service#switch_off_messemodul> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?switch_off_messemodul <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?MesseModul .
	?MesseModul <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#MesseModul> .
	?MesseModul <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#Off> .
}

# switch_on_messemodul
CONSTRUCT {
	<http://127.0.0.1/service#switch_on_messemodul> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?switch_on_messemodul <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?MesseModul .
	?MesseModul <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#MesseModul> .
	?MesseModul <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#On> .
}

# TitleSaving_service
CONSTRUCT {
	<http://127.0.0.1/service#TitleSaving_service> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?TitleSaving_service <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?_TITLE .
	?_TITLE <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/books.owl#Title> .
	?_TITLE <http://127.0.0.1/ontology/SUMO.owl#part> ?_DATABASE .
}

# unlock_door
CONSTRUCT {
	<http://127.0.0.1/service#unlock_door> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?unlock_door <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?Door .
	?Door <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#Door> .
	?Door <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#Unlocked> .
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
	?_ITEMS <http://127.0.0.1/ontology/order.owl#shipTo> ?_ADDRESS .
}

