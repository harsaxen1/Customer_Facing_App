Feature: As a user, I should be able to tap on Contact Us and see Contact Us page

  Scenario Outline: I should be able to tap on Contact Us and see Contact Us webpage
    Given I land on Account page
    When I tap on Contact Us button
    Then I verify I landed on webview as to  verify text <msg>
    And User taps on back button of webview
    And I verify that I landed back on Accounts page

  Examples:
      |msg|
      |Contact Us|