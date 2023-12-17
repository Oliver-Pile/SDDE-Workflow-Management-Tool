Feature: Project
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
    And   I click submit
    Then  I see the updated project title

  Scenario: Creating a project
    Given I visit the projects page 
    And I click the add project button
    When I fill in the add project form
    And I click submit
    Then I see the new project

  Scenario: Archiving a project
    Given I visit the project show page
    When I click archive
    Then I dont see the project
    