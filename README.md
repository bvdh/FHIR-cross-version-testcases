# FHIR-cross-version-testcases
Test cases for FHIR cross version extensions.

## Test case format

The test cases are stored in the output directory. The R5 subdirectory contains the files for R5, the R4 the files for R4, the R4b subdirectory for R4b.

Each test case consist of a FHIR resource. The resource contains an extension that states:

* The profile to be used to validate the resource.
* Whether the validation should succeed or fail.
* A rationale for the test.

An example test case is presented below.

```json
{
  "resourceType": "ActivityDefinition",
  "id": "Test-ActivityDefinitionWithQuestionnaireExtension",
  "extension": [
    {
      "extension": [
        {
          "url": "rationale",
          "valueString": "Tests the use of the R5 Questionnaire.versionAlgorithmString on a ActivityDefinition. This resource should fail as the context of the extension is not on ActivityDefinition."
        },
        {
          "url": "profile",
          "valueString": "http://hl7.org/fhir/StructureDefinition/ActivityDefinition|4.0.1"
        },
        {
          "url": "expectedResult",
          "valueCode": "pass"
        }
      ],
      "url": "http://hl7.org/crossversion/tescases/R4/StructureDefinition/CrossVersionTestExtension"
    },
    {
      "url": "http://hl7.org/R5/StructureDefinition/extension-Questionnaire.versionAlgorithmString",
      "valueString": "random"
    }
  ],
  "status": "active",
  "priority": "routine"
}

```

## Running the tests

The intended test approach is to validate the differ test cases using the profile indicated in the extension.

The test passes if the validation results matches the `pass` or `fail` indication mentioned in the extension.

## Compiling the test cases

The `startDockerPublisher.sh` shell script starts a docker image (defined in the directory `docker-builder`). 

This image derives from the FHIR IG builder and adds support for liquid, rename and jq.

In order to update/generate the test cases, run the script `generateTests.sh`. 

This script performs the following tasks:

* it takes the content in IG-Base and copies them to R4, R4b and R5 specific sushi projects.
* it runs liquid on all files that hold `.liquid` in the name. The version specific elements are indicated in the source shorthand using liquid statements. The context variables used in these liquid runs are defined in the RX-context.json files.
* it deletes the source liquid files
* it runs sushi
* it copies the results files to the output directory.

