Feature: Hooks

Background: hooks
    # * def result = callonce read('classpath:helpers/dummy.feature')
    # * def name = result.name

    #after hooks
    # * configure afterFeature = function(){ karate.call('classpath:helpers/dummy.feature') }
    # * configure afterScenario = function(){ karate.call('classpath:helpers/dummy.feature') }
    
    # if u want to execute any JS feature after every feature/scenario
    * configure afterFeature = 
    """
        function(){
            karate.log('After feature text');
        }
    """


    Scenario:  First Scenario
        #* print name
        * print 'This is first feature'     

    Scenario:  Second Scenario
        #* print name
        * print 'This is second feature'
