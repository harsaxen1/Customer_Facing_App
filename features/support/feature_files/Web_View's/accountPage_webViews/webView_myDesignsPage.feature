Feature: As a user I could visit My Designs Page Webpage

  Scenario: Verify My Designs Page Webpage
    Given I land on Home screen
    Then  I click on Account
    When  I click on Sign In CTA
    And   I enter Email Id "nsingh@test.com" on Text box
    And   I enter password "Password1" on Text Box
    Then  I click sign in CTA & successfully login as a registered User
    And   I click on My Designs in Account Page
    Then  I land on My Designs Page & Verify