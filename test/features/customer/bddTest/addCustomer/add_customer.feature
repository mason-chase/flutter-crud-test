import 'package:mc_crud_test/features/customer/presentation/addCustomer/add_customer_form_keys.dart';
Feature: Add Customer

  Scenario: I am not able to add customer with invalid phone number
    Given The app is running
    And I am on the "Add Customer" screen
    When I enter valid name into the firstName field
    And I enter valid lastName into the lastName field
    And I enter invalid number into the phoneNumber field
    Then I should see {"Invalid phone"} text

  Scenario:I am not able to add customer with invalid email
    Given The app is running
    And I am on the "Add Customer" screen
    When I enter valid name into the firstName field
    And I enter valid lastName into the lastName field
    And I enter valid number into the phoneNumber field
    And I enter invalid email into the email field
    Then I should see {"Invalid email"} text

  Scenario: I am not able to add customer with invalid bank account number
    Given The app is running
    And I am on the "Add Customer" screen
    When I enter valid name into the firstName field
    And I enter valid lastName into the lastName field
    And I enter valid number into the phoneNumber field
    And I enter valid email into the email field
    And I enter invalid bank account into the bank account field
    Then I should see {"Invalid bank account"} text


  Scenario: I am able to add customer with valid data
    Given The app is running
    And I am on the "Add Customer" screen
    When I enter valid name into the firstName field
    And I enter valid lastName into the lastName field
    And I enter valid number into the phoneNumber field
    And I enter valid email into the email field
    And I enter valid bank account into the bank account field
    And I enter valid date of birth into the date of birth field
    And I tap on the "Add" button
    Then I should see success message


  Scenario: I am not able to add customer with not unique email
    Given The app is running
    And I am on the "Add Customer" screen
    When I enter valid name into the firstName field
    And I enter valid lastName into the lastName field
    And I enter valid number into the phoneNumber field
    And I enter valid email into the email field
    And I enter valid bank account into the bank account field
    And I enter valid date of birth into the date of birth field
    And I tap on the "Add" button
    Then I should see user already exist message


  Scenario: I am not able to add customer with not unique phone number
    Given The app is running
    And I am on the "Add Customer" screen
    When I enter valid name into the firstName field
    And I enter valid lastName into the lastName field
    And I enter valid number into the phoneNumber field
    And I enter valid email into the email field
    And I enter valid bank account into the bank account field
    And I enter valid date of birth into the date of birth field
    And I tap on the "Add" button
    Then I should see user already exist message


  Scenario:I am not able to add customer because Customers must be unique in database: By `Firstname`, `Lastname` and `DateOfBirth`
    Given The app is running
    And I am on the "Add Customer" screen
    When I enter valid name into the firstName field
    And I enter valid lastName into the lastName field
    And I enter valid number into the phoneNumber field
    And I enter valid email into the email field
    And I enter valid bank account into the bank account field
    And I enter valid date of birth into the date of birth field
    And I tap on the "Add" button
    Then I should see user already exist message
