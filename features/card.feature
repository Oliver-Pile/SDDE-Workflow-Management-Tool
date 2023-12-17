Feature: Card
  Background:
    Given I am a user
    And There is a project
    And There are many cards
    When  I login

  Scenario: Viewing all cards for project
    Given I visit the project show page
    Then I see the cards content
    And I see the cards status
    And I see the cards assignees

  Scenario: Create a new card
    Given I visit the project show page
    And I click add card
    When I fill in the add card form
    And I click submit
    Then I see the new card

  Scenario: Editing a card
    Given I visit the project show page
    And I click on a card
    When I fill in the update card form
    And I click submit
    Then I see the updated card

  Scenario: Assign user to card
    Given I visit the project show page
    And I click on a card
    When I update the assigned user
    And I click submit
    Then I see the card with the updated user

  Scenario:  Unassign user to card
    Given I visit the project show page
    And I click on a card with an assigned user
    When I remove the assigned user
    And I click submit
    Then I see the card with no users

  Scenario:  Filtering cards
    Given I visit the project show page
    When I click the only mine toggle
    Then I can see my cards
    And I cant see any other cards