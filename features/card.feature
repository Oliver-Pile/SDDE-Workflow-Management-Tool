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
