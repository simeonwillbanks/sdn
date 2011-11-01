Feature: Post Creation

  As an admin
  I want to create a post
  So that SDN can display the post

  Scenario: create post from a one time request
    Given I am an admin
    And I send and accept JSON
    And I have a new post with the headline "My Dog Is Awesome" 
    When I make an authenticated request to create the post
    Then the post is created
    And the response is a JSON hash with the key "headline" whose value is "My Dog Is Awesome"
