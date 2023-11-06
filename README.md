# FHIR-cross-version-testcases
Test cases for FHIR cross version extensions.

The `startDockerPublisher.sh` shell script starts a docker image (defined in the directory `docker-builder`). 

This image derives from the FHIR IG builder and adds support for liquid, rename and jq.

In order to update/generate the test cases, run the script `generateTests.sh`. 

This script performs the following tasks:

* it takes the content in IG-Base and copies them to R4, R4b and R5 specific sushi projects.
* it runs liquid on all files that hold `.liquid` in the name. The version specific elements are indicated in the source shorthand using liquid statements. The context variables used in these liquid runs are defined in the RX-context.json files.
* it deletes the source liquid files
* it runs sushi
* it copies the results files to the output directory.
