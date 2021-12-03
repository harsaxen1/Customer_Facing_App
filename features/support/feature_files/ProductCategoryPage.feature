@sanity
Feature: User should be able to visit the PCP web view by tapping on the button in app

  Scenario: As a user, when I tap on PCP, I should be able to see PCP web view
    Given I landed on Homepage and I see "Welcome" message
    When I tap on PCP button, I should see PCP web view
    And I tap on back button on web view
    And I landed on Homepage and I see "Welcome" message
