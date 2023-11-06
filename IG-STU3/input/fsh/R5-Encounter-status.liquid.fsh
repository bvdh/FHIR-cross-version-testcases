Instance: R5-EncounterStatus-correctvalue-resource
InstanceOf: Encounter
Usage: #example
* insert crossversionTestWithRationale( #pass, "http://hl7.org/fhir/StructureDefinition/Encounter|{{fhirVersionNo}}", 
  [["Tests the use of the R5 Encounter.status in R4 with a value that only exists in R5 with a code that exists in R5."]]
)
* extension[+]
  * url = "http://hl7.org/5.0/StructureDefinition/extension-Encounter.status"
  * valueCode = #arrived
* status
  * insert dataAbsentExtension
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#FLD

Instance: R5-EncounterStatus-correctvalue-existingvalue-resource
InstanceOf: Encounter
Usage: #example
* insert crossversionTestWithRationale( #pass, "http://hl7.org/fhir/StructureDefinition/Encounter|{{fhirVersionNo}}", 
  [["Tests the use of the R5 Encounter.status in R4 with a value that only exists in R5 with a code that exists in R5.In addition, the base status is present."]]
)
* extension[+]
  * url = "http://hl7.org/5.0/StructureDefinition/extension-Encounter.status"
  * valueCode = #arrived
* status = #unknown
  
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#FLD

Instance: R5-EncounterStatus-incorrectvalue-resource
InstanceOf: Encounter
Usage: #example
* insert crossversionTestWithRationale( #fail, "http://hl7.org/fhir/StructureDefinition/Encounter|{{fhirVersionNo}}", 
  [["Tests the use of the R5 Encounter.status in R4 with a value that only exists in R5 with a code that exists in R5. This resource should fail as it does not a correct value.,"]]
)
* extension[+]
  * url = "http://hl7.org/5.0/StructureDefinition/extension-Encounter.status"
  * valueCode = #onleave
* status
  * insert dataAbsentExtension
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#FLD
