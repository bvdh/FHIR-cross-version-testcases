Instance: R5-EncounterStatus-correctvalue-STU3
InstanceOf: TestScript
* insert testcase( 
    "http://hl7.org/fhir/TestScript/encounterstatus", 
    "0.1", 
    "Use R5 Encounter status in STU3",
    R5-EncounterStatus-correctvalue-resource, 
    "http://hl7.org/fhir/StructureDefinition/Encounter|3.0.2",
    [[.not()]]
    )
* status           = #draft
* date             = "2023-11-02"
* description      = """
    Tests the use of the R5 Encounter.status in R4 with a value that only exists in R5 with a code that exists in STU3.
"""

Instance: R5-EncounterStatus-correctvalue-R4
InstanceOf: TestScript
* insert testcase( 
    "http://hl7.org/fhir/TestScript/encounterstatus", 
    "0.1", 
    "Use R5 Encounter status in R4",
    R5-EncounterStatus-correctvalue-resource, 
    "http://hl7.org/fhir/StructureDefinition/Encounter|4.0.1",
    [[.not()]]
    )
* status           = #draft
* date             = "2023-11-02"
* description      = """
    Tests the use of the R5 Encounter.status in R4 with a value that only exists in R5 with a code that exists in R5.
"""

Instance: R5-EncounterStatus-correctvalue-resource
InstanceOf: Encounter
Usage: #example
* extension[+]
  * url = "http://hl7.org/5.0/StructureDefinition/extension-Encounter.status"
  * valueCode = #arrived
* status
  * insert dataAbsentExtension


Instance: R5-EncounterStatus-incorrectvalue-R4
InstanceOf: TestScript
* insert testcase( 
    "http://hl7.org/fhir/TestScript/test2", 
    "0.1", 
    "Use R5 status in R4",
    R5-EncounterStatus-incorrectvalue-resource, 
    "http://hl7.org/fhir/StructureDefinition/Encounter|4.0.1",
    
    )
* status           = #draft
* date             = "2023-11-02"
* description      = """
    Tests the use of the R5 Encounter.status in R4 with a value that only exists in R5 with a code that does not exist in R5.
"""

Instance: R5-EncounterStatus-incorrectvalue-STU3
InstanceOf: TestScript
* insert testcase( 
    "http://hl7.org/fhir/TestScript/test2", 
    "0.1", 
    "Use R5 status in STU3",
    R5-EncounterStatus-incorrectvalue-resource, 
    "http://hl7.org/fhir/StructureDefinition/Encounter|3.0.2",
    
    )
* status           = #draft
* date             = "2023-11-02"
* description      = """
    Tests the use of the R5 Encounter.status in R4 with a value that only exists in R5 with a code that does not exist in STU3.
"""


Instance: R5-EncounterStatus-incorrectvalue-resource
InstanceOf: Encounter
Usage: #example
* extension[+]
  * url = "http://hl7.org/5.0/StructureDefinition/extension-Encounter.status"
  * valueCode = #onleave
* status
  * insert dataAbsentExtension
