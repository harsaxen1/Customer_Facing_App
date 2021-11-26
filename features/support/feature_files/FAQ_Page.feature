Feature: As a user, I should be able to tap on FAQ and see FAQ webpage

  Scenario: I should be able to tap on FAQ and see FAQ webpage
    Given I land on Account page
    When I tap on FAQ button
    Then I verify I landed on webview as verify text "FAQ"
    And User taps on back button on webview
    And I verify that landed back on Accounts page
    And veruigu



