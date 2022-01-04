Feature: As a User , I sjould be able to tap on Forgot Password link and see Forgot Password Page

  Scenario: On Sign In screen, When I tap on Forgot Password link 
    Given I land on  Account page
    When I tap on Sign In button
    Then I verify "Sign in" title is displayed on Sign in page
    And I tap on Forgot Password button
    And I verify "Forgot Password" title is displayed on Forgot Password page
