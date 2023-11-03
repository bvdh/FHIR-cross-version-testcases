Instance: R5-Observation-valueSampledData-R4
InstanceOf: TestScript
* insert testcasenoresource( 
    "http://hl7.org/fhir/TestScript/ObservationSampleddata", 
    "0.1", 
    "Use R5 SampledData in R4",
    R5-valueSampledData-resource, 
    "http://hl7.org/fhir/StructureDefinition/Observation|4.0.1",
    
    )
* status           = #draft
* date             = "2023-11-02"
* description      = """
    Tests the use of the R5 Encounter.status in R4 with a value that only exists in R5 with a code that does not exist in R5.
"""
* contained[0]
  * parameter[+]
    * name = "resource"   
    * resource
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



// Instance: R5-ObservationSampleddata-resource
// InstanceOf: Observation
// Usage: #inline
// * status = #final
// * code = http:somecodesystem#value
// * subject = Reference( PatientExample )
// * valueSampledData
//   * origin = 0 '{ratio}' "ratio"
//   * period
//     * insert dataAbsentExtension
//   * dimensions = 1
//   * extension[+]
//     * url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-SampledData.intervalUnit"
//     * valueCode = #s
//   * extension[+]
//     * url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-SampledData.offsets"
//     * valueString = "0.1 0.15 0.3 0.4"
//   * data    = "0.85 0.85 0.9 1.1"
