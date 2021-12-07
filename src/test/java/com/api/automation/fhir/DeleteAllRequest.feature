Feature: To test the get end point of the application
  To performs a so called $expunge operation = deletion of data on all existing resources on the FHIR server in order to clear its database

  Background: Setup the Base path
    Given url 'http://localhost:8080/fhir/'
    And print '========== This is Background Keyword ================='

  Scenario: all existing resources on the FHIR server
    Given path 'Patient/$expunge'
   * def body = read("Json/DeleteBody.json")
    And request body
    When method post
    And status 200
    And print response
    And match response.parameter[0].valueInteger == 0
    