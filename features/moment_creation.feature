Feature: Moment Creation

  As an admin
  I want to create a moment 
  So that SDN can display the moment

  Scenario Outline: create a moment via JSON 
    Given I am an admin
    And I send and accept JSON
    And I have a new "<moment>" with the "<attribute>" "<value>" 
    When I make an authenticated request to create the "<moment>"
    Then the "<moment>" is created
    And the response is a JSON hash with the key "<attribute>" whose value is "<value>"

    Examples:
      | moment | attribute | value |
			| daily | origin_poid | 42 |
      | post | headline | My Dog Is Awesome |
      | song | title | Southbound |

  Scenario Outline: create a moment via HTML
    Given I am an admin
    When I make an authenticated request to create the "<moment>"
    Then the request is not accepted

    Examples:
      | moment |
			| daily |
      | post |
      | song |
