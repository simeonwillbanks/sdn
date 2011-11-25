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
			| daily | created_at | November 25, 2011 |
      | post | headline | My Dog Is Awesome |
      | song | title | Southbound |

  Scenario Outline: visit the moments section
    Given I am a guest
    When I visit the index of "<moment>"
    Then SDN displays the "<moment>"
    And SDN displays pagination

    Examples:
      | moment |
      | dailies |
      | posts |
      | songs |
