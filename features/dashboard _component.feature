@dashboard
Feature: Verify Dashboard component, user able to use the Dashboard

  Scenario:	Launch the Application and verify we landed on Homepage
    Given I land on Home screen

    @wip
  Scenario: Verify Search bar is available, user is able to enter text
    Given I land on Home screen
    Then  I click on Search Bar and the Keypad will open
    And   I will search for "Kitchen Storage"
    Then  I click on Enter in Keypad for Search

      @welcome
  Scenario: Verify Welcome message on Dashboard
    Given I land on Home screen
    Then  I Verify "Welcome" message

        @store
  Scenario: Verify the Store Name, arrow for dropdown and timing
    Given I land on Home screen
    Then I Verify the Store Name "The San Francisco Store"
    When  I click on arrow for dropdown
    Then I Verify the Timing "Open until 8pm today"

  Scenario: Verify Order pickup
    Given I land on Home screen
    Then I Verify "Order Pickup Status" title
    And  I Click on + Button to Maximize
  	And  I Verify "Order: #123234567876" title under order pickup Status Title
    Then I Verify "Placed: April 20, 2021" title under order pickup Status
    When I Verify I'M HERE NOW button is present and It is Tappable
    Then I Click on - Button to Maximize


  Scenario:	Verify all 4 secondary services
    Given I land on Home screen
    Then  I Verify FREE In-Home Design Service Text is Tappable and I land on the page
    And   I Verify FREE In-Home Design Service Icon is Tappable and I land on the page
    And   I Verify FREE In-Home Design Service Arrow is Tappable and I land on the page
    Then  I Verify FREE Virtual Design Service Text is Tappable and I land on the page
    And   I Verify FREE Virtual Design Service Icon is Tappable and I land on the page
    And   I Verify FREE Virtual Design Service Arrow is Tappable and I land on the page
    Then  I Verify Online Design Center Text is Tappable and I land on the page
    And   I Verify Online Design Center Icon is Tappable and I land on the page
    And   I Verify Online Design Center Arrow is Tappable and I land on the page
    Then  I Verify Special Financing Text is Tappable and I land on the page
    And   I Verify Special Financing Icon is Tappable and I land on the page
    And   I Verify Special Financing Arrow is Tappable and I land on the page

  Scenario: Verify Tertiary navigation
    Given I land on Home screen
    Then  I Verify the container store logo
    When  I Verify Text "1-888-CONTAIN (266-8246)" to reach customer service via a phone
    And   I Verify the copyright text "©2021 The Container Store® Inc."
    Then  I verify Accessibility Statement is Tappable & Redirecting to Web view
    And   I verify to click back button on Accessibility Statement Web view which should Redirect back to Home Screen
    Then  I verify Privacy Policy is Tappable & Redirecting to Web view
    And   I verify to click back button on Privacy Policy Web view which should Redirect back to Home Screen
    Then  I verify Terms of Use is Tappable & Redirecting to Web view
    And   I verify to click back button on Terms of Use Web view which should Redirect back to Home Screen


#  Scenario: Verify Account Page
#    Given I land on Home screen
#    And   I Click on Account
#    When  I Click on Create an Account
#    And   I Click on First Name so that keypad will open
#    Then  I Send text to First Name "Praveen"

  Scenario: Verify Persistent Navigation : User is able to tap on any icon from anywhere
    Given I land on Home screen
    Then I verify Account by clicking on it from Shop Page
    And  I verify Cart by clicking on it from Account Page
    Then I verify Inspiration by clicking on it from Cart Page
    Then I verify Shop by clicking on it from Inspiration Page


