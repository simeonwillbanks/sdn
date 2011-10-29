Feature: Moment Creation

  As an admin
  I want to create a moment 
  So that SDN can display the moment

  @wip
  Scenario: create moment
    Given I am an authenticated admin
    When I request a new moment
    Then I should see "Moment successfully created"
