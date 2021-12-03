@sanity
Ability: User should be able to see Hot topics bar & should have ability to scroll through it and open a webview

  Scenario: User views Hot Topics bar and scroll and tap on any one and open web view
    Given I landed on Homepage and I see "Welcome" message
    Then User views a Hot Topic bar "Kitchen Storage"
  #  And User scrolls through the Hot Topics Bar
    And User taps on any one Hot topic bar and web view opens
    And I verify I landed on webview as view text "WebView"
    And User taps on back button
    And I landed on Homepage and I see "Welcome" message


