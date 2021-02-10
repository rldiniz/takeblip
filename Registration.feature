Feature: Registration

    This test is part of a technical evaluation activity.
    As a new system user
    I want to register a new account
    So that I can login and use the system

Scenario: Register new user
    # This test requires a clean database, or changing e-mail with a new e-mail
    # We could write a function that appends a timestamp to a "testemail-TIMESTAMP@test.com" email that will always be unique
    # as long as we don't run tests in parallel
    Given I am on "https://account.blip.ai/register"
    When I fill in "#FullName" with "Test User"
    And I fill in "#Email" with "testemail@test.com"
    And I fill in "#Password" with "password123456"
    And I fill in "#PhoneNumber" with "(12) 3456-7890"
    And I fill in "#CompanySite" with "www.takeblip.com"
    And I select "1 a 4 funcionários" from "//input[@placeholder='Select...']"
    And I click on "//bds-checkbox"
    And I click on "#submitButton"
    And I wait 30 seconds
    # Ideally, we should write a function here that checks for the absense of the loading GIF. This was made as a quick solution.
    Then I should see "Enviamos um e-mail de ativação para t****l@test.com "

Scenario: Check invalid field value messages
    Given I am on "https://account.blip.ai/register"
    When I fill in "#FullName" with "a"
    Then I should see "Ops! Seu nome completo precisa ter pelo menos 6 caracteres"
    When I fill in "#Email" with "a"
    Then I should see "Esse não parece ser um email válido. Por favor, tente de novo :)"
    When I fill in "#Password" with "a"
    Then I should see "Sua senha deve conter no mínimo 6 caracteres"
    When I fill in "#PhoneNumber" with "a"
    Then I should see "Esse não parece ser um telefone válido. Por favor, tente de novo :)"
    When I fill in "#CompanySite" with "a"
    Then I should see "Esse não parece ser um site válido. Por favor, tente de novo :)"

Scenario: Check TOS link
    Given I am on "https://account.blip.ai/register"
    When I click on "//a[contains(.,'Termos de Serviço')]"
    Then I should be on "https://help.blip.ai/hc/pt-br/articles/360054956974"

Scenario: Check Privacy Policy link
    Given I am on "https://account.blip.ai/register"
    When I click on "//a[contains(.,'Política de privacidade')]"
    Then I should be on "https://help.blip.ai/hc/pt-br/articles/360054956674"

Scenario: Check Cookies link
    Given I am on "https://account.blip.ai/register"
    When I click on "//a[contains(.,'Cookies')]"
    Then I should be on "https://help.blip.ai/hc/pt-br/articles/360056763173"