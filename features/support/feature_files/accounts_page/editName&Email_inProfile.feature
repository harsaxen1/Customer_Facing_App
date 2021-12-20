Feature: As a logged in user I want to be able to edit Name & Email in profile

  Scenario: Edit Email in profile
    Given I land on Home screen
    Then  I click on Account
    When  I click on Sign In CTA
    And   I enter Email Id "nsingh@test.com" on Text box
    And   I enter password "Password1" on Text Box
    Then  I click sign in CTA & successfully login as a registered User
    And   I click on My Profile in Account Page
    And   I tap on Email field.
    And   I Tap on X button and navigates back to Profile Page
    When  I tap on Email box & use wrong Email "praveen"
    Then  I can view error message "Email invalid" if incorrect email id/format entered
    When  I tap on Email box & use correct Email "pb@gmail.com"
    And   I update Email using save CTA


  Scenario: Edit Name in profile
    Given I land on Home screen
    Then  I click on Account
    When  I click on Sign In CTA
    And   I enter Email Id "nsingh@test.com" on Text box
    And   I enter password "Password1" on Text Box
    Then  I click sign in CTA & successfully login as a registered User
    And   I click on My Profile in Account Page
    And   I tap on Name field
    And   I Tap on X button and navigates back to Profile Page from Name field
    Then  I edit First Name "Abcd"
    When  I edit Last Name "xyz"
    Then  I tap on Save and lands back on profile page