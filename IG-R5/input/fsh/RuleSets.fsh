RuleSet: dataAbsentExtension
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
  * valueCode = #not-applicable

RuleSet: crossVersionUrl( sourceFhir, path )
* url = "http://hl7.org/{sourceFhir}/StructureDefinition/extension-{path}"
