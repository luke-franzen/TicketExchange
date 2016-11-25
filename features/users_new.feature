Feature: User should be able to sign up for an account

Scenario: go to the signup page
  Given I am on the home page
  When I click sign up
  Then I should be on the sign up page

Scenario: sign up with bad credentials
  Given I am on the sign up page
  When I fill out the signup form with the following attributes:
    | first_name  | last_name | email             | password      | password_confirmation |
    | Bob         | Smith     | invalid_email.com | good_password | good_password         |
  And I click the sign up button
  Then I should see "Email is invalid"

Scenario: sign up with good credentials
  Given I am on the sign up page
  When I fill out the signup form with the following attributes:
    | first_name  | last_name | email                 | password      | password_confirmation |
    | Bob         | Smith     | valid_email@email.com | good_password | good_password         |
  And I click the sign up button
  Then I should be on the home page
  And I should see "Sign up successful"

Scenario: reset password with activated email
  Given I am on the sign up page
  And a user exists with the following attributes:
    | first_name  | last_name | email                 | password      | activated |
    | Bob         | Smith     | valid_email@email.com | good_password | true     |
  When I click forgot password
  And I fill out the forgot password form with the following attributes:
    | email                 |
    | valid_email@email.com |
  And I click the reset password button
  Then I should see "Email sent with password reset instructions"

Scenario: reset password with nonexistent email
  Given I am on the sign up page
  When I click forgot password
  And I fill out the forgot password form with the following attributes:
    | email                 |
    | invalid_email@email.com |
  And I click the reset password button
  Then I should see "Email address not found"