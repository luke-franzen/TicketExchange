Feature: User should be able to view tickets for sale without logging in
  
  Scenario: viewing tickets without logging in
    Given I am on the homepage of the TicketExchange site
    When I am not logged in to the site and I click on 