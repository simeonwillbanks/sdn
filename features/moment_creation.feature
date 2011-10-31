Feature: Moment Creation

  As an admin
  I want to create a moment 
  So that SDN can display the moment

  Scenario: create moment from one time request
    Given I am an admin
    When I make an authenticated request for a new moment
    Then I am redirected  
    And I see the message "Moment successfully created"
