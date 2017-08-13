Feature: Login
  As a CK user
  I should be able login to a tenant of CK
  So that I can use CK application

  Background:
    Given URL of a CK Tenant

  @login
  Scenario Outline: Login to CK Tenant
    Given URL of a CK Tenant
    When I Provide eMailID  as "<eMailID>"
    Then I should see Non SSO Page
    When I Provide Password "<Password>"
    And Sign In
    Then I should see CK Landing Page

    Examples:
      | eMailID                | Password   |
      | admin@t2-qa.xkit.co    | Cisco@1234 |







    