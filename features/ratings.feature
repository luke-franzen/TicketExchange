Feature: User should be able to rate other users

Scenario: login with bad credentials
  Given I am logged in as a valid user
  And the following conversation exists:
    | id        | sender_id  | recipient_id |
    | 3         | 1          | 2            |
  And I am in a conversation
  Then I should see "Rate User"