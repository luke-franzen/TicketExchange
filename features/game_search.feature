Feature: search for games on the homepage

Scenario:  search for a specific game on the homepage

Given I am on the landing page
When I search for a game
Then I should see the games with my search query

Given I am on the landing page table
Then I should see the 3 upcoming games

Given The game title "Michigan vs. Iowa"  and date "11/12" game has been added
When I am on the Iowa Ticket Exchange homepage
Then I should see a game entry with title "Michigan vs. Iowa" and the date "11/12"

