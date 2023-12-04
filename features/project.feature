Feature: Viewing Kanban
  Background:
    Given There is a project
    And   I am a user
    When  I login

  Scenario: Viewing all projects
    Given I visit the projects page 
    Then I see the project title
    And I see the project description 
    And I see the project department

  Scenario: Viewing an individual project
    Given I visit the project show page
    Then  I see the project title

  Scenario: Editing a project
    Given I visit the project edit page
    When  I modify the project title
    And   I click update submit
    Then  I see the updated project title