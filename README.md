Intent HQ QA Exercise
=====================

## Background
We provide different solutions to let our customers integrate our products, one of those solutions is based on plugins ready to embed in any webpage.

To make this integration even better (and also to help us test the plugins) we have created an page (we call it [plugin builder](https://api-example-client.intenthq.com/) ) that contains all our plugins and allows you to test different configurations.

## What you will need to do
Given the [plugin builder page](https://api-example-client.intenthq.com/) and the following scenario already created as an example:

```gherkin
Feature: Social Login

  Scenario Outline: As a logged out user I want to login in IntentHQ platform using different social networks
    Given I am logged out from "<network>"
    And I am not logged in the platform
    And I am on the admin api-example-client page
    When I login in the platform using "<network>", "<email>" and "<password>"
    Then I should see my "<name>"

    #You will need to change the examples below with your own data
    Examples:
      | network   | email              | password | name       |
      | LinkedIn  | email@example.com  | pass     | John Smith |
      | Facebook  | email@example.com  | pass     | John Smith |
```

After doing an exploratory testing of the different plugins, you will need to:
- Report any bugs found (if any)
- Create some example scenarios that cover the testing of the plugins
- Automate a minimum of two scenarios
- Provide any assumptions you've made

## Requisites
- rbenv + ruby-build (https://github.com/sstephenson/rbenv)
- ruby 2.0.0-p247
- bundle (gem install bundle)
- chromedriver

## How to run the tests

```sh
$ bundle
$ rake features
```
