Feature: Moment Comments

  As a user
  I want to add comments to a moment
  So that SDN can display a moment with comments

  Scenario: create a new comment for the moment type post
    Given I am a signed in user
    When I visit a "post" 
    And I create a commment which says "I love this moment. Its so Awesome."
    Then the "post" displays the comment which says "I love this moment. Its so Awesome."

  Scenario: try to create an empty comment for the moment type post
    Given I am a signed in user
    When I visit a "post" 
    And I create a empty commment
    Then the "post" alerts "Comment body can't be blank." 

  Scenario: guest can not create a comment for the moment type post 
    Given I am a guest
    When I visit a "post"
    Then I can not create a new comment
