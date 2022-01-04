Feature: As a user I could visit Web View - View Saved Addresses

  Scenario: Verify Web View - View Saved Addresses
    Given I land on Home screen
    Then  I click on Account
    When  I click on Sign In CTA
    And   I enter Email Id "nsingh2@test.com" on Text box
    And   I enter password "12345678" on Text Box
    Then  I click sign in CTA & successfully login as a registered User
    And   I click on Addresses Page
    Then  I land on Addresses Page & Verify