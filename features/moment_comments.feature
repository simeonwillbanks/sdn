Feature: Moment Comments

  As a user
  I want to add comments to a moment
  So that SDN can display a moment with comments

  Scenario Outline: create a new comment for the moment type 
    Given I am a signed in user
    When I visit a "<moment>" 
    And I create a commment which says "I love this moment. Its so Awesome."
    Then the "<moment>" displays the comment which says "I love this moment. Its so Awesome."

    Examples:
      | moment |
			| video |
			| photo |
			| daily |
      | post |
      | song |

  Scenario Outline: try to create an empty comment for the moment type 
    Given I am a signed in user
    When I visit a "<moment>" 
    And I create a empty commment
    Then the "<moment>" alerts "Comment body can't be blank." 

    Examples:
      | moment |
			| video |
			| photo |
			| daily |
      | post |
      | song |

  Scenario Outline: guest can not create a comment for the moment type  
    Given I am a guest
    When I visit a "<moment>"
    Then I can not create a new comment

    Examples:
      | moment |
			| video |
			| photo |
			| daily |
      | post |
      | song |
