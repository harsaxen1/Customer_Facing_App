Feature: As a user I could visit Cart Page - Webpage

  Scenario: Verify Cart Page - Webpage
    Given I land on Home screen
    Then  I search for any product eg: SKU "10084635"
    And   Add the item & go to the Cart Page
    Then  I verify Cart Page
    Then  I click on persistent checkout button CTA


