Feature: Test for POST method using DDT

Background: Define URL
    Given url apiUrl
    * def dataGenerator = Java.type('helpers.DataGenerator')
    * def name = dataGenerator.getRandomName()
    * def job = dataGenerator.getRandomJob()

    Scenario Outline: Create user 

        And request { "name": "<name>", "job": "<job>" }
        When method POST
        Then status 201
        And print response

        Examples:
            | name | job |
            | #(name) | #(job)|
            | bob | #(job) |
            | #(name) | SDET |


