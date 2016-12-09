Feature: User should be able to send a message

Scenario: send a new message
  Given the following conversation exists:
    | id        | sender_id  | recipient_id |
    | 3         | 5          | 6            |
  And I am in a conversation
  When I fill out the message box with text
  And I click send
  Then I should see my new message sent
