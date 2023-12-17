Feature: User
  Scenario: Logging in
    Given I am a user
    And I am not logged in
    Then I see the login page
    When I login
    Then I see the project index page

  Scenario: Logging out
    Given I am a user
    When I login
    Given I press logout
    Then I see the login page

  Scenario: Create User
    Given I am a user
    When I login
    Given I visit the manage user page
    And I click add user
    When I fill in the add user form
    And I click add
    Then I see the new user

  Scenario: View users
    Given I am a user
    When I login
    Given I visit the manage user page
    Then I see a list of users

  Scenario: Update user
    Given I am a user
    When I login
    Given I visit the manage user page
    And I select edit user
    When I fill in the edit users form
    And I click submit
    Then I see the updated user
  
  Scenario: Delete user
    Given I am a user
    When I login
    Given I visit the manage user page
    When I select delete user
    Then I cant see the deleted user