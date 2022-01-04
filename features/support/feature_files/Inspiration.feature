Ability: User should be able to view Inspiration web pages

  Scenario: User taps on Inspiration from Persistent navigation and Inspiration tab is displayed
    Given I landed on Homepage and I see "Welcome" message
    When I tap on Inspiration tab
    Then I land on Inspiration page



    Scenario: User lands on Inspiration tab and user should be able to see all sub nav flows of Inspiration
      Given I tap on Inspiration tab
      Then I view All inspiration tab selected by default
      Then I tap on Projects
      And I verify Projects web view is displayed
      When I tap on Tips
      Then I verify Tips web view is displayed
      When I tap on videos
      Then I verify Videos web view is displayed
      When I tap on Blog Posts
      Then I verify Blog Posts is displayed
      When I tap on Customer Photos
      Then I verify Customer Photos web view is displayed
      When I tap on Container store Blog
      Then I verify Container store Blog is displayed
      When I tap on Before & After
      Then I verify Before & After is displayed