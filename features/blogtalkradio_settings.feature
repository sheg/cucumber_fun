Feature: Make an updateable settings page
  As a user
  I would like to access and update the settings page
  So that I can update my account information

Background:
  Given I am on the homepage
  When I navigate to the login page
  And I sign into the application
  And go to the settings page

Scenario: Update profile picture
  When I add a new valid profile picture
  Then my new profile picture should be set

Scenario: Completely update contact info with random information
  When update contact info form with random data
  Then the settings page should not have any errors

Scenario: Update Contact Info with empty email
  When update contact info form with:

  |email|
  |     |

  Then the settings page should have the error "Email address required"

 Scenario: Update Contact Info with empty display name
  When update contact info form with:

  |display_name|
  |            |

  Then the settings page should have the error "Display name required"

 Scenario: Update contact info with an already used display_name
  When update contact info form with:

  | display_name      |
  | Cheese Sandwiches |

  Then the settings page should have the error "The Display name you entered is already being used in the system"
