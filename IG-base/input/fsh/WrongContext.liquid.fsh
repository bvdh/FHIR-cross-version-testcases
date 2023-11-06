{% if fhirVersion != "R5" %}
Instance: ActivityDefinitionWithQuestionnaireExtension
InstanceOf: ActivityDefinition
* insert crossversionTestWithRationale( #pass, "http://hl7.org/fhir/StructureDefinition/Encounter|{{fhirVersionNo}}", 
  [["Tests the use of the R5 Questionnaire.versionAlgorithmString on a ActivityDefinition. This resource should fail as the context of the extension is not on ActivityDefinition."]]
)
* insert crossversionTest( #pass, "http://hl7.org/fhir/StructureDefinition/ActivityDefinition|{{fhirVersionNo}}" )
* status = #active
* priority = #routine
* extension[+]
  * insert crossVersionUrl( R5, Questionnaire.versionAlgorithmString )
  * valueString = "random"
{% endif %}