Feature: Add and edit categories
  As a blog administrator
  In order to organize articles
  I want to be able to add and edit categories 

  Background:
    Given the blog is set up
    And I am logged into the admin panel

  Scenario: Successfully add a new category
    Given I am on the new page for categories
    When I fill in "category_name" with "Sports"
    And I press "Save"
    Then I should see "Sports"
