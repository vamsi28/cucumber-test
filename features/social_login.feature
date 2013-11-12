Feature: Social Login

  Scenario Outline: As a logged out user I want to login in IntentHQ platform using different social networks
    Given I am logged out from <network>
      And I am not logged in the platform
      And I am on the admin api-example-client page
    When I login in the platform using <network>, <email> and <password>
    Then I should see my <name>

    #You will need to change the examples below with your own data
    Examples:
      | network   | email              | password | name       |
      | LinkedIn  | email@example.com  | pass     | John Smith |
      | Facebook  | email@example.com  | pass     | John Smith |