Feature: Test for GET method

Background: Define URL
    Given url apiUrl

    Scenario: GET list of users
        Given param page = 2
        When method GET
        Then status 200
        And print response
        And match response.data[1].first_name contains 'Lindsay'
        And match response.data[2].last_name !contains 'Rachel'
        And match response.data == "#array"
        And match response.per_page == "#number"
        And match response.data == "#[6]"
        And match response.total_pages == 2
        And match response.data[*].first_name contains "Byron"
    

# for multiple param we can use 
# Given param {param1: 2, param2: 3}
# checking datatype of each value in array
# match each response.arrname == '#string'
# match response.arrname == '##string'   -> it means it can be either string or null
# match response.data == "#[5]" --> used for checking array size
# match response.data contains any ['val1','val2','val3']
# match response.data contains only ['val1','val2','val3']
# match response.total_pages != 2
# match response == {"data": "#array", "total_pages": 2}
# inside POST request - assertion for checking data
# https://github.com/karatelabs/karate#fuzzy-matching
# https://github.com/karatelabs/karate#schema-validation
# https://github.com/karatelabs/karate/blob/master/karate-junit4/src/test/java/com/intuit/karate/junit4/demos/time-validator.js


    Scenario: Get single user
        Given path '/2'
        When method GET
        Then status 200
        And match response.data == 
        """
            {
                "id": "#number",
                "email": "#string",
                "first_name": "#string",
                "last_name": "#string",
                "avatar": "#string"
            }

        """       
        





 