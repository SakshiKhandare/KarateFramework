Feature: Test for calling another feature 

Background: Define URL
    Given url apiUrl

    Scenario: Get single user
        Given path '/2'
        When method GET
        Then status 200