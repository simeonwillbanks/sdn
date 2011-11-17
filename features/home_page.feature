Feature: SDN Home Page

  As a visitor
  I want to visit the SDN home page
  So that I can see a variety of moments

  Scenario: visit home page looking for specific post
    Given I am a guest
    When I know SDN has a "post" with the "headline" "My Dog Is Awesome"
    And I visit the home page
    Then SDN displays the "post" with the "headline" "My Dog Is Awesome"
    And the "post" "body" is shortened to an abstract

  Scenario: visit home page
    Given I am a guest
    When SDN has a variety of moments
    And I visit the home page
    Then SDN displays pagination
