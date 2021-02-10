Feature: Login

    This test is part of a technical evaluation activity.
    As a system user
    I want to login to the system
    So that I can use it safely and privately

Scenario: Login with existing email
    # Please, change "existing-email@email.com" and "password123" with valid login info
    Given I am on "https://account.blip.ai/login"
    When I fill in "#email" with "existing-email@email.com"
    And I fill in "#password" with "password123"
    And I click on "#blip-login"
    And I wait 10 seconds
    Then I should be on "https://portal.blip.ai/application"

Scenario: Login with invalid password
    # Please, change ONLY "existing-email@email.com"
    # "invalidpassword" should remain as is
    Given I am on "https://account.blip.ai/login"
    When I fill in "#email" with "existing-email@email.com"
    And I fill in "#password" with "invalidpassword"
    And I click on "#blip-login"
    And I wait 5 seconds
    Then I should be on "https://account.blip.ai/login"
    And I should see "Não sou um robô"
