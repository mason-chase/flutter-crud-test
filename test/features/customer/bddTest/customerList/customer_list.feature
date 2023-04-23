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

  Scenario: delete customer success
    Given The app is running{1}
    And I have one customer
    When I request customer list
    And I tap delete customer button
    Then Customer deleted successfully

  Scenario: delete customer failed
    Given The app is running{1}
    And I have one customer
    When I request customer list
    And I tap delete customer button
    Then I see one customer in the list

  Scenario: navigate to update customer page
    Given The app is running{1}
    When I tap update customer button
    Then I see update customer page


  Scenario: click in add customer button
    Given The app is running{1}
    When I tap add customer button
    Then I see add customer page

