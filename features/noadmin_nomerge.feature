Feature: Create Blog
  As an admin
  In order to keep my blog organized
  I want that non-admin cannot merge articles

  Background:
    Given the blog is set up
    And the following articles exist:
    | title        | body   | 
    | title1       | hello  |
    | title2       | world  |   
    | title3       | wow    | 

  Scenario: A non-admin cannot merge articles
    When I go to the edit page for "title1"
    Then I should not see "Merge"



