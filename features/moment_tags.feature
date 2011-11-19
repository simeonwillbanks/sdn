Feature: Moment Tags

  As an admin
  I want to apply tags to a moment
  So that SDN can display moments by tag

  Scenario Outline: create a moment with tags via JSON
    Given I am an admin
    And I send and accept JSON
    And I have a new "<moment>" with the "<attribute>" "<value>" 
    And I have these tags I'd like to apply "<tags>"
    When I make an authenticated request to create the "<moment>"
    Then the "<moment>" is created
    And the response is a JSON hash with the key "<attribute>" whose value is "<value>"
    And an array of tags whose members are "<tags>"

    Examples:
      | moment    | attribute   | value               | tags            |
      | post      | headline    | My Dog Is Awesome   | dog, companion  |
      | song      | title       | Southbound          | rock, allmans   |

