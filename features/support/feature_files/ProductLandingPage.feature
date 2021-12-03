@sanity
Feature: User should be able to visit the PLP web view by tapping on the button in app

  Scenario: As a User, on Tapping on PLP, I should be able to see PLP web view
    Given I landed on Homepage and I see "Welcome" message
    When I tap on PLP button
   # Then I should be able to see the PLP Web view and see text "Search Product"
    When I tap on back button
    And I landed on Homepage and I see "Welcome" message
