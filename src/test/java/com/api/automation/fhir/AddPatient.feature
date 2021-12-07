Feature: To test the get end point of the application
  To generates 30 different FHIR Patient resources

  Background: Setup the Base path
    Given url 'http://localhost:8080/fhir/'
    And print '========== This is Background Keyword ================='
    * def generator = function(i){ if (i == 30) return null; return { name:  i } }
    * def random_string =
 """
 function(s) {
   var text = "";
   var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
   for (var i = 0; i < s; i++)
     text += possible.charAt(Math.floor(Math.random() * possible.length));
   return text;
 }
 """

Scenario Outline: generates 30 different FHIR Patient resources
    Given path 'Patient'
    * def body = read("Json/AddPatientBody.json")
    * def FName =  random_string(5)
    * def LName =  random_string(5)
   	And print FName
    And print LName
    * set body.name[0].given[0] = FName
    * set body.name[0].given[1] = LName
    And request body
    When method post
    Then status 201
    And match response.text.status == "generated"
		And print response.id
    Examples:
    | generator |

  