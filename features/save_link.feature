Feature: Users can save link

  Scenario: User enters a link
    When I enter a link with http://google.com
    Then there is a link for http://google.com in the system
