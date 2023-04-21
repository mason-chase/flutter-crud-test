Feature: Add Customer

  Scenario: I am not able to add customer with invalid phone number
    Given The app is running
    And I am on the "Add Customer" screen
    When I enter {"Mohsen"} into the {"First Name"} field
    And I enter {"Balestani"} into the {"Last Name"} field
    And I enter {"1234567890"} into the "Phone Number" field
    Then I should see "Invalid phone number" on the screen

  Scenario:I am not able to add customer with invalid email
    Given The app is running
    And I am on the "Add Customer" screen
    When I enter {"Mohsen"} into the {"First Name"} field
    And I enter {"Balestani"} into the {"Last Name"} field
    And I enter {"m.balestani"} into the {"Email"} field
    Then I should see "Invalid email" on the screen

  Scenario: I am not able to add customer with invalid bank account number
    Given The app is running
    And I am on the "Add Customer" screen
    When I enter {"Mohsen"} into the {"First Name"} field
    And I enter {"Balestani"} into the {"Last Name"} field
    And I enter {"+989353361996"} into the {"Phone Number"} field
    And I enter {"m.balestani@gmail.com"} into the {"Email"} field
    And I enter {"1234567890"} into the {"Bank Account Number"} field
    Then I should see {"Invalid bank account number"} Toast on the screen


  Scenario: I am able to add customer with valid data
    Given The app is running
    And I am on the "Add Customer" screen
    When I enter {"Mohsen"} into the {"First Name"} field
    And I enter {"Balestani"} into the {"Last Name"} field
    And I enter {"+989353361996"} into the {"Phone Number"} field
    And I enter {"m.balestani@gmail.com"} into the {"Email"} field
    And I enter {"IR123456789012345678901234"} into the {"Bank Account Number"} field
    And I enter {"1990-01-01"} into the {"Date of Birth"} field
    And I tap on the "Add" button
    Then I should see {"Customer added successfully"} Toast on the screen


  Scenario: I am not able to add customer with not unique email
    Given The app is running
    And I am on the "Add Customer" screen
    When I enter {"John"} into the {"First Name"} field
    And I enter {"Doe"} into the {"Last Name"} field
    And I enter {"+989353361990"} into the {"Phone Number"} field
    And I enter {"m.balestani@gmail.com"} into the {"Email"} field
    And I enter {"IR123456789012345678901230"} into the {"Bank Account Number"} field
    And I enter {"1990-01-01"} into the {"Date of Birth"} field
    And I tap on the "Add" button
    Then I should see {"Customer with this email already exists"} Toast on the screen


  Scenario: I am not able to add customer with not unique phone number
    Given The app is running
    And I am on the "Add Customer" screen
    When I enter {"John"} into the {"First Name"} field
    And I enter {"Doe"} into the {"Last Name"} field
    And I enter {"+989353361996"} into the {"Phone Number"} field
    And I enter {"john@gmail.com"} into the {"Email"} field
    And I enter {"IR123456789012345678901230"} into the {"Bank Account Number"} field
    And I enter {"1990-01-01"} into the {"Date of Birth"} field
    And I tap on the "Add" button
    Then I should see {"Customer with this phone number already exists"} Toast on the screen


  Scenario:I am not able to add customer because Customers must be unique in database: By `Firstname`, `Lastname` and `DateOfBirth`
    Given The app is running
    And I am on the "Add Customer" screen
    When I enter {"John"} into the {"First Name"} field
    And I enter {"Doe"} into the {"Last Name"} field
    And I enter {"+989353361996"} into the {"Phone Number"} field
    And I enter {"johni@gmail.com"} into the {"Email"} field
    And I enter {"IR123456789012345678401230"} into the {"Bank Account Number"} field
    And I enter {"1990-01-01"} into the {"Date of Birth"} field
    And I tap on the "Add" button
    Then I should see {"Customer already exists"} Toast on the screen
