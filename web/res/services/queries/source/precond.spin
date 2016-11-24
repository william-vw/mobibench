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
	<http://www.w3.org/2002/07/owl#AllDifferent> <http://www.w3.org/2002/07/owl#distinctMembers> ?var0 .
	?var0 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> ?_GEOGRAPHICAL_REGION1 .
	?var0 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> ?var1 .
	?var1 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> ?_GEOGRAPHICAL_REGION2 .
	?var1 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> <http://www.w3.org/1999/02/22-rdf-syntax-ns#nil> .
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
	<http://www.w3.org/2002/07/owl#AllDifferent> <http://www.w3.org/2002/07/owl#distinctMembers> ?var2 .
	?var2 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> ?_CITY1 .
	?var2 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> ?var3 .
	?var3 <http://www.w3.org/1999/02/22-rdf-syntax-ns#first> ?_CITY2 .
	?var3 <http://www.w3.org/1999/02/22-rdf-syntax-ns#rest> <http://www.w3.org/1999/02/22-rdf-syntax-ns#nil> .
	?_CITY1 <http://127.0.0.1/ontology/protont.owl#locatedIn> ?_STATE1 .
	?_CITY2 <http://127.0.0.1/ontology/protont.owl#locatedIn> ?_STATE2 .
	?_STATE1 <http://127.0.0.1/ontology/protont.owl#locatedIn> ?_COUNTRY1 .
	?_STATE2 <http://127.0.0.1/ontology/protont.owl#locatedIn> ?_COUNTRY2 .
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

