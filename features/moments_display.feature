Feature: Show Moments

  As a visitor
  I want to visit SDN
  So that I can see moments

  Scenario Outline: visit a moment
    Given I am a guest
    When I visit a "<moment>" with the "<attribute>" "<value>"
    Then SDN displays the "<moment>" with the "<attribute>" "<value>"

    Examples:
      | moment | attribute | value |
      | post | headline | My Dog Is Awesome |
      | song | title | Southbound |

  @wip
  Scenario Outline: visit the moments section
    Given I am a guest
    When I visit the index of "<moment>s"
    Then SDN displays the "<moment>s"
    And SDN displays pagination

    Examples:
      | moment |
      | post |
      | song |
