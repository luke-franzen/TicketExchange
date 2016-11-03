Feature: view the landing page for the Iowa Ticket Exchange

#     Scenario:  open website and go to landing page
#         When I have visited the root page
#         Then I should see the landing page text box
        
#     Given the following games have been added to Iowa Ticket Exchange:
#         | title                     |
#         | Miami RedHawks            |
#         | Iowa State Cyclones       |
#         | North Dakota State Bison  |
#         | Northwestern Wildcats     |
#         | Wisconsin Badgers         |
#         | Michigan Wolverines       |
#         | Nebraska Cornhuskers      |
        
#     And  I am on the Iowa Ticket Exchange home page
    
#     Scenario: see games on home page
#     When I am on the homepage
#     Then I should see all of the games
    
#     When I search for a game
    
    @javascript
    Scenario: Autocomplete
        Given the following games exists:
        | name                     |
        | Miami RedHawks            |
        | Iowa State Cyclones       |
        | North Dakota State Bison  |
        | Northwestern Wildcats     |
        | Wisconsin Badgers         |
        | Michigan Wolverines       |
        | Nebraska Cornhuskers      |
        When I go to the home page
        When I fill in "Search" with "Io"
        When I choose "Iowa State Cyclones" in the autocomplete list
        Then the "Search" field should contain "Iowa State Cyclones"