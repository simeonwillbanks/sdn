Feature: SDN Home Page

  As a visitor
  I want to visit the SDN home page
  So that I can see a variety of moments

  Scenario: visit home page
    Given I am a guest
    When SDN has a variety of moments
    And I visit the home page
    Then SDN displays pagination

  Scenario Outline: visit home page looking for specific post
    Given I am a guest
    When I know SDN has a "<moment>" with the "<attribute>" "<value>"
    And I visit the home page
    Then SDN displays the "<moment>" with the "<attribute>" "<value>"

    Examples:
      | moment | attribute | value |
      | post | headline | My Dog Is Awesome |
      | song | title | Southbound |
