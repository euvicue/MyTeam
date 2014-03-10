Feature: Create team
  In order to participate in a league
  As a user
  I want to create my own team

  Scenario: Create first team
    Given I do not have any team
    And I am in the team creation page
    When I add a team
    Then I should see it in my teams page
