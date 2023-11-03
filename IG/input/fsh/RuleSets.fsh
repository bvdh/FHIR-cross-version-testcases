RuleSet: dataAbsentExtension
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
  * valueCode = #not-applicable

RuleSet: crossVersionUrl( sourceFhir, path )
* url = "http://hl7.org/{sourceFhir}/StructureDefinition/extension-{path}"

RuleSet: testcase( url, version, title, resource, profile, expressionEnd )
* url              = {url}
* version          = {version}
* versionAlgorithmCoding = http://hl7.org/fhir/version-algorithm#semver "SemVer"
* name             = {title}
* title            = {title}
* status           = #draft
* copyright        = "2023 HL7"
* fixture[+]
  * id = "validationBody"
  * autocreate = false
  * autodelete = false
  * resource.reference = "#parameters"
* test[+]
  * action[+]
    * operation
      * type     = http://hl7.org/fhir/restful-interaction#operation "operation"
      * encodeRequestUrl = false
      * method   = #post
      * sourceId = "validationBody"
      * url      = "$validate"
    * assert
      * response = #okay
      * expression = "OperationOutcome.issue.where( severity = 'error' or severity = 'fatal' ).exists(){expressionEnd}"
      * stopTestOnFail = true
      * warningOnly = false
* contained[+]
  * resourceType = "Parameters"
  * id = "parameters"
  * parameter[+]
    * name = "resource"
    * resource = {resource}
  * parameter[+]
    * name = "profile"
    * valueString = {profile}

RuleSet: testcasenoresource( url, version, title, resource, profile, expressionEnd )
* url              = {url}
* version          = {version}
* versionAlgorithmCoding = http://hl7.org/fhir/version-algorithm#semver "SemVer"
* name             = {title}
* title            = {title}
* status           = #draft
* copyright        = "2023 HL7"
* fixture[+]
  * id = "validationBody"
  * autocreate = false
  * autodelete = false
  * resource.reference = "#parameters"
* test[+]
  * action[+]
    * operation
      * type     = http://hl7.org/fhir/restful-interaction#operation "operation"
      * encodeRequestUrl = false
      * method   = #post
      * sourceId = "validationBody"
      * url      = "$validate"
    * assert
      * response = #okay
      * expression = "OperationOutcome.issue.where( severity = 'error' or severity = 'fatal' ).exists(){expressionEnd}"
      * stopTestOnFail = true
      * warningOnly = false
* contained[+]
  * resourceType = "Parameters"
  * id = "parameters"
  * parameter[+]
    * name = "profile"
    * valueString = {profile}



// RuleSet: mustFailTestcase( url, version, title, resource, profile )
// * url              = {url}
// * version          = {version}
// * versionAlgorithmCoding = http://hl7.org/fhir/version-algorithm#semver "SemVer"
// * name             = {title}
// * title            = {title}
// * status           = #draft
// * copyright        = "2023 HL7"
// * fixture[+]
//   * id = "validationBody"
//   * autocreate = false
//   * autodelete = false
//   * resource.reference = "#parameters"
// * test[+]
//   * action[+]
//     * operation
//       * type     = http://hl7.org/fhir/restful-interaction#operation "operation"
//       * encodeRequestUrl = false
//       * method   = #post
//       * sourceId = "validationBody"
//       * url      = "$validate"
//     * assert
//       * response = #okay
//       * expression = "OperationOutcome.issue.where( severity = 'error' or severity = 'fatal' ).exists()"
//       * stopTestOnFail = true
//       * warningOnly = false
// * contained[+]
//   * resourceType = "Parameters"
//   * id = "parameters"
//   * parameter[+]
//     * name = "resource"
//     * resource = {resource}
//   * parameter[+]
//     * name = "profile"
//     * valueString = {profile}


// RuleSet: mustSucceedTestcase( url, version, title, resource, profile )
// * url              = {url}
// * version          = {version}
// * versionAlgorithmCoding = http://hl7.org/fhir/version-algorithm#semver "SemVer"
// * name             = {title}
// * title            = {title}
// * status           = #draft
// * copyright        = "2023 HL7"
// * fixture[+]
//   * id = "validationBody"
//   * autocreate = false
//   * autodelete = false
//   * resource.reference = "#parameters"
// * test[+]
//   * action[+]
//     * operation
//       * type     = http://hl7.org/fhir/restful-interaction#operation "operation"
//       * encodeRequestUrl = false
//       * method   = #post
//       * sourceId = "validationBody"
//       * url      = "$validate"
//     * assert
//       * response = #okay
//       * expression = "OperationOutcome.issue.where( severity = 'error' or severity = 'fatal' ).exists().not()"
//       * stopTestOnFail = true
//       * warningOnly = false
// * contained[+]
//   * resourceType = "Parameters"
//   * id = "parameters"
//   * parameter[+]
//     * name = "resource"
//     * resource = {resource}
//   * parameter[+]
//     * name = "profile"
//     * valueString = {profile}
