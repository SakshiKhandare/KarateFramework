Feature: Test for conversion

Background: Define URL
    Given url apiUrl

    Scenario: Number to string
        * def foo = 10
        * def json = {"bar": #(foo+'')}
        * match json == {"bar": '10' }

    Scenario: String to number
        * def foo = '10'
        * def json = {"bar": #(foo*1)}
        * match json == {"bar": 10 }

        * def json2 = {"bar": #(parseInt(foo))}
        * match json2 == {"bar": 10 }





