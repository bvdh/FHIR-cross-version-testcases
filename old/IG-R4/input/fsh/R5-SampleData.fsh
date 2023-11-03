Instance: R5-ObservationSampleddata-resource
InstanceOf: Observation
Description: """ 
  Tests the use of the R5 Encounter.status in R4 with a value that only exists in R5 with a code that does not exist in R5. 

  profile: "http://hl7.org/fhir/StructureDefinition/Observation|4.0.1",
"""
Usage: #example
* status = #final
* code = http:somecodesystem#value
* subject = Reference( PatientExample )
* valueSampledData
  * origin = 0 '{ratio}' "ratio"
  * period
    * insert dataAbsentExtension
  * dimensions = 1
  * extension[+]
    * url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-SampledData.intervalUnit"
    * valueCode = #s
  * extension[+]
    * url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-SampledData.offsets"
    * valueString = "0.1 0.15 0.3 0.4"
  * data    = "0.85 0.85 0.9 1.1"
