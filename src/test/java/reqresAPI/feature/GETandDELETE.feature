Feature: Test for GET and DELETEmethod

Background: Define URL
    Given url apiUrl
    * def GETres = call read('classpath:helpers/CallingAnotherFeature.feature')
    # * def res = callonce read('classpath:helpers/CallingAnotherFeature.feature')

    Scenario: Get single user
        # Given path '/2'
        # When method GET
        # Then status 200

        Given path '/2'
        When method DELETE
        Then status 204
        
