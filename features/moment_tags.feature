Feature: Moment Tags

  As an admin
  I want to apply tags to a moment
  So that SDN can display moments by tag

  Scenario: create a moment with tags as a post via JSON
    Given I am an admin
    And I send and accept JSON
    And I have a new "post" with the "headline" "My Dog Is Awesome" 
    And I have these tags I'd like to apply "dogs, companion, pet"
    When I make an authenticated request to create the "post"
    Then the "post" is created
    And the response is a JSON hash with the key "headline" whose value is "My Dog Is Awesome"
    And an array of tags whose members are "dogs, companion, pet"
