RuleSet: dataAbsentExtension
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
  * valueCode = #not-applicable

RuleSet: crossVersionUrl( sourceFhir, path )
* url = "http://hl7.org/{sourceFhir}/StructureDefinition/extension-{path}"

Extension: CrossVersionTestExtension
* extension contains rationale 0..1 MS and profile 1..1 MS and expectedResult 1..1 MS
* extension[rationale].value[x] only string
* extension[profile].value[x] only string
* extension[expectedResult].value[x] only code
* extension[expectedResult].valueCode from CrossVersionTestExtensionsValueSet

RuleSet: crossversionTestWithRationale( result, profile, rationale )
* extension[CrossVersionTestExtension]
  * extension[rationale].valueString = {rationale}
  * extension[profile].valueString = {profile}
  * extension[expectedResult].valueCode = {result}

RuleSet: crossversionTest( result, profile )
* extension[CrossVersionTestExtension]
  // * extension[rationale].valueString = {rationale}
  * extension[profile].valueString = {profile}
  * extension[expectedResult].valueCode = {result}

CodeSystem: CrossVersionTestExtensionsCodeSystem
* #testoutcome "test result options" "Possible test results"
  * #pass "pass"
     "Test should pass validation."
  * #fail "fail" 
     "Test should fail validation."

ValueSet: CrossVersionTestExtensionsValueSet
* CrossVersionTestExtensionsCodeSystem#pass "pass" 
* CrossVersionTestExtensionsCodeSystem#fail "fail"
