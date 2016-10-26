Feature: User should be able to sign up for an account

Scenario: go to the login page
  Given I am on the home page
  When I click sign up
  Then I should see the sign up page

Scenario: sign up with bad credentials
  Given I am on the sign up page
  When I fill out the form with the following attributes:
    | first_name       | Bob               |
    | last_name        | McBobberson       |
    | email            | invalid_email.com |
    | password         | good_password     |
    | confirm_password | good_password     |
  And I click the sign up button
  Then I should see an invalid email error

Scenario: sign up with good credentials
  Given I am on the sign up page
  When I fill out the form with the following attributes
    | first_name       | Bob                   |
    | last_name        | McBobberson           |
    | email            | valid_email@email.com |
    | password         | good_password         |
    | confirm_password | good_password         |
  And I click the sign up button
  Then I should be on the home page
  And I should see "Welcome Bob McBobberson"