Feature: As a User , I want to Sign In

  Scenario: On Sign In screen, When I enter all details - I should be able to see Sign In Success Page
    Given I land on  Account page
    When I tap on Sign In button
    Then I verify "Sign in" title is displayed on Sign in page
    And I enter valid email address in Email Address as "abc@gmail.com"
    And I enter valid password in Password Field as "Abc12345#"
    And I tap on Sign In CTA
    And  Sign In - Error message is displayed
    And I verify the "The Email or Password you entered is incorrect, please try again." message is displayed
