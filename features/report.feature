Feature: Report
  Background:
    Given I am a user
    And There is a project
    And There are many cards
    When  I login

  Scenario: Viewing project report
    Given I visit the project show page
    When I click view report
    Then I see a report for the project