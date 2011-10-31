Feature: Moment Creation

  As an admin
  I want to create a moment 
  So that SDN can display the moment

  @wip
  Scenario: create moment logged in
    Given I am an authenticated admin
    When I request a new moment
    Then I should see "Moment successfully created"

  Scenario: create moment from one time request
    Given I am an admin
    When I make an authenticated request for a new moment
    Then I should see "Moment successfully created"
