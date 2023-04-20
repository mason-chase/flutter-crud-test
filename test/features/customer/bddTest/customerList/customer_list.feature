@customerList
Feature: Customer List

  Scenario: customer list is empty at start
    Given The app is running{0}
    And I have no customers
    When I request customer list
    Then i see empty list widget

  Scenario: customer list is not empty
    Given The app is running{1}
    And I have one customer
    When I request customer list
    Then I see one customer in the list

  Scenario: failed to load customer list
    Given The app is running{-1}
    And I have one customer
    And I have failed to load customer list
    When I request customer list
    Then I see "Failed to load customer list" text

  Scenario: click in add customer button
    When I tap add customer button
    Then I see add customer page

