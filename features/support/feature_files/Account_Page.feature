Feature: As a User, I want to Create Account

  Scenario: On Create Account screen, When I enter all details - I should be able to see Success page
    Given I land on Account page
    When I tap on Create Account button
    Then I enter text in First Name as "John"
    And I enter text in Last Name as "Thomas"
    And I enter valid email address in Email ID as "abc@gmail.com"
    And I enter valid password in Password as "Abc12345#"
    And I enter valid Zip in Zip Code as "10012"
    And I tap on Create Account CTA
    And  Create Account - Success Page is displayed
    And I verify "Welcome to" message is displayed


