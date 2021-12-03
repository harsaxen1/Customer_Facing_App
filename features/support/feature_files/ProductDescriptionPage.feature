@sanity
Feature: User should be able to visit the PCP web view by tapping on the button in app

  Scenario: As a user, when I tap on PDP, I should be able to see PCP web view
    Given I landed on Homepage and I see "Welcome" message
    When I tap on PCP button, I should see PDP web view
    And I tap on back button on web view of PDP
    And I landed on Homepage and I see "Welcome" message