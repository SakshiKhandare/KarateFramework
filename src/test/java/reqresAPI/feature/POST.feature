Feature: Test for POST method

Background: Define URL
    * def timeValidator = read('classpath:helpers/timeValidator.js')
    # for reading static Java functions
    * def dataGenerator = Java.type('helpers.DataGenerator')
    Given url apiUrl
    * def requestBody = read('classpath:reqresAPI/json/newRequest.json')
    * set requestBody.name = dataGenerator.getRandomJson().name
    * set requestBody.job = dataGenerator.getRandomJson().job

    Scenario: Create user
        And request { "name": "morpheus", "job": "leader" }
        When method POST
        Then status 201
        Then print response
        And match response.job == "leader"
        And match response.createdAt contains '2022'
        And match response == 
        """
            {
                "name": "#string",
                "job": "#string",
                "id": "#string",
                "createdAt": "#string"
            }
        """
        
# for validating time
# "createdAt": "#? timeValidator(_)"

    Scenario: Create user using dataGenerator
        * def name = dataGenerator.getRandomName()
        * def job = dataGenerator.getRandomJob()

        And request { "name": #(name), "job": #(job) }
        When method POST
        Then status 201
        And print response

    Scenario: Create user using non static dataGenerator 
        * def job = dataGenerator.getRandomJob()

        * def jsFunction = 
        """
            function(){
                var DataGenerator = Java.type('helpers.DataGenerator')
                var generator = new DataGenerator()
                return generator.getRandomName2()
            }

        """
        * def randomName = call jsFunction

        And request { "name": #(randomName), "job": #(job) }
        When method POST
        Then status 201
        And print response


    Scenario: Create user using external json

        And request requestBody
        When method POST
        Then status 201
        And print response


    Scenario: Create user using external json and datagenerator

        And request requestBody
        When method POST
        Then status 201
        And print response
        And match response.name == requestBody.name

        