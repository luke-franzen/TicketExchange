Feature: User should be able to rate other users

Scenario: See rating stars
  Given Two users exist and I am logged in as a valid user with the following attributes:
    | first_name  | last_name | email                 | password      | activated |
    | Bob         | Smith     | valid_email@email.com | good_password | true      |
  Then I should be on the home page
  And the following conversation exists:
    | id        | sender_id  | recipient_id |
    | 3         | 1          | 2            |
  And I go to the corresponding conversation
  Then I should see "Rate User"