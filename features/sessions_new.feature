Feature: User should be able to login to their accoutn

Scenario: go to the login page
  Given I am on the home page
  When I click login
  Then I should see the login page

Scenario: login with bad credentials
  Given I am on the login page
  When I fill out the login form with the following attributes:
    | email            | no_such_email@gmail.com |
    | password         | good_password           |
  And I click the log in button
  Then I should see an invalid email/password combination error

Scenario: login with good credentials
  Given I am on the login page
  When I fill out the form with the following attributes
    | email            | valid_email@email.com |
    | password         | good_password         |
  And I click the log in button
  Then I should be on the home page
  And I should see "Welcome Bob McBobberson"