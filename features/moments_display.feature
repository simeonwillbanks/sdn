Feature: Show Moments

  As a visitor
  I want to visit SDN
  So that I can see moments

  Scenario: visit a moment as a post
    Given I am a guest
    When I visit a "post" with the "headline" "My Dog Is Awesome"
    Then SDN displays the "post" with the "headline" "My Dog Is Awesome"

  Scenario: visit the posts section
    Given I am a guest
    When I visit the index of "posts"
    Then SDN displays the "posts"
