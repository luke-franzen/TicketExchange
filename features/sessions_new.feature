Feature: User should be able to login to their account

Scenario: go to the login page
  Given I am on the home page
  When I click login
  Then I should be on the login page

Scenario: login with bad credentials
  Given I am on the login page
  When I fill out the login form with the following attributes:
    | email             | password      |
    | invalid_email.com | good_password |
  And I click the log in button
  Then I should see "Invalid email/password"

Scenario: login with good credentials but not activated
  Given a user exists with the following attributes:
    | first_name  | last_name | email                 | password      | activated |
    | Bob         | Smith     | valid_email@email.com | good_password | false     |
  And I am on the login page
  When I fill out the login form with the following attributes:
    | email                 | password      |
    | valid_email@email.com | good_password |
  And I click the log in button
  Then I should be on the home page
  And I should see "Account not activated"

Scenario: login with good credentials and activated
  Given a user exists with the following attributes:
    | first_name  | last_name | email                 | password      | activated |
    | Bob         | Smith     | valid_email@email.com | good_password | true      |
  And I am on the login page
  When I fill out the login form with the following attributes:
    | email                 | password      |
    | valid_email@email.com | good_password |
  And I click the log in button
  Then I should be on the home page
  And I should see "Welcome, Bob Smith"