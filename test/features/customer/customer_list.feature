@customerList
Feature: Customer List

  Background:
    Given The app is running
    And see customer list page


  Scenario: customer list is empty at start
    Given I have no customers
    When I request customer list
    Then I see "No customers found" text

  Scenario: customer list is not empty
    Given I have one customer
    When I request customer list
    Then I see one customer in the list

  Scenario: failed to load customer list
    Given I have one customer
    And I have failed to load customer list
    When I request customer list
    Then I see "Failed to load customer list" text

  Scenario: click in add customer button
    When I tap add customer button
    Then I see add customer page

