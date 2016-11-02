Feature: User should be able to view tickets for sale without logging in
  
    Scenario: viewing tickets without logging in
        Given I am on the homepage of the TicketExchange site
        When I am not logged in
        And I click "Iowa State Cyclones"
        Then I should see all of the tickets on sale for the Iowa/Iowa State Game
