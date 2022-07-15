Feature: Dummy

    Scenario:  Dummy
        * def dataGenerator = Java.type('helpers.DataGenerator')
        * def name = dataGenerator.getRandomName()
        * print name


