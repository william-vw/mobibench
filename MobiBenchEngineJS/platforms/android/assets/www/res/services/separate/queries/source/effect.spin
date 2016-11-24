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

# lock_door
CONSTRUCT {
	<http://127.0.0.1/service#lock_door> <http://127.0.0.1/matches> "true" .
}
WHERE {
	?lock_door <http://www.daml.org/services/owl-s/1.1/Process.owl#hasInput> ?Door .
	?Door <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#Door> .
	?Door <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://127.0.0.1/ontology/messemodul.owl#Locked> .
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

