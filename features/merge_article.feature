Feature: Merge Articles
  As an admin
  In order to manage the article section efficiently
  I want to merge articles

  Background:
    Given the blog is set up
    And the following articles exist:
    | title        | body   | 
    | title1       | hello  |
    | title2       | world  |   
    | title3       | wow    | 
    

  Scenario: A non-admin cannot merge articles


  Scenario: Merged article contains the text of both previous articles When articles are merged
    Given I am logged into the admin panel
    Given I am on the edit page for "title1"
    And I fill in "merge_with" with "4"
    And I press "Merge"
    Then I should see "helloworld"

