Feature: Job Offers CRUD
  In order to get employees
  As a job offerer
  I want to manage my offers

  Background:
  	Given I am logged in as job offerer

  Scenario: Create new offer
    When I create a new offer with "Programmer vacancy" as the title
    Then I should see a offer created confirmation message
    And I should see "Programmer vacancy" in my offers list

  Scenario: Update offer
    Given I have "Programmer vacancy" offer in my offers list
    When I change the title to "Programmer vacancy!!!"
    Then I should see a offer updated confirmation message
    And I should see "Programmer vacancy!!!" in my offers list

  Scenario: Delete offer
    Given I have "Programmer vacancy" offer in my offers list
    When I delete it
    Then I should see a offer deleted confirmation message
    And I should not see "Programmer vacancy!!!" in my offers list

  Scenario: Create new offer with expired date
    When I create a new job offer with "Programmer vacancy" as the title 
    And 20/10/22 as the expired date
    Then I should see a offer created confirmation message
    And I should see "Programmer vacancy" in my offers list
  
