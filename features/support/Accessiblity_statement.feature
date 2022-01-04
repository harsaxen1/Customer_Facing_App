Feature: As a user, I should be able to tap on Accessibility statement and see Accessibility statement page

  Scenario Outline: I should be able to tap on Accessibility statement and see Accessibility statement webpage
    Given I land on Account page
    When I tap on Accessibility statement button
    Then I verify I landed on webview as to  verify text <msg>
    And User taps on back button of webview
    And I verify that I landed back on Accounts page
  Examples:
    |msg|
    |Accessibility Statement|