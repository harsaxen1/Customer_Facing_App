Feature: As a user, I should be able to tap on Email Preferences and see Email Preferences page

  Scenario Outline: I should be able to tap on Email Preferences and see Email Preferences webpage
    Given I land on Account page
    When I tap on Email Preferences button
    Then I verify I landed on webview as to  verify text <msg>
    And User taps on back button of webview
    And I verify that I landed back on Accounts page

    Examples:
      |msg|
      |Email Preferences|