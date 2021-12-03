Ability: User should be able to view Account landing page as Guest user

  Scenario: As a Guest user, I should be able to see welcome message
    Given I land on Account page
    Then I see "Hi!" message as a Guest User
    And I see Sign In CTA
    And I see Create Account option

    Scenario: As a user, I see My Orders details on Account page
      Given I land on Account page
      Then I see My Orders tile
      And I see My Wallet tile
      And I see Address card
      And I see Lists card
      And I see Perks card
      And I see My Store card

