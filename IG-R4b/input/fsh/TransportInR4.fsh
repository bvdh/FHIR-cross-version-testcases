Instance: BasicTransport
InstanceOf: Basic
* insert crossversionTestWithRationale( #pass, "http://hl7.org/fhir/StructureDefinition/Encounter|4.0.1", 
  [["Example of using cross version extensions to create a resource in another version where the resource does not exists. Resource should pass.
"]]
)
* insert crossversionTest( #pass, "http://hl7.org/fhir/StructureDefinition/Basic|4.0.1" )
* code =  http://hl7.org/fhir/fhir-types#Transport
* extension[+]
  * insert crossVersionUrl( R5, Transport.status )
  * valueCode = #in-progress
* extension[+]
  * insert crossVersionUrl( R5, Transport.intent )
  * valueCode = #filler-order
* extension[+]
  * insert crossVersionUrl( R5, Transport.priority )
  * valueCode = #urgent 
* extension[+]
  * insert crossVersionUrl( R5, Transport.description )
  * valueString = "Example of transport." 
