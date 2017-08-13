Feature: TC

  @login_spike
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


  @wip
  Scenario Outline: Register Course
    Given Training Catalog
    When I Search  Title "<courseTitle>" in the Catalog
    Then I should see Course In Search Results
    When I Register for the Course "<courseTitle>" From Training Catalog
    Then I should Get Success Message

    Examples:
      | courseTitle            |
      | eLearningCourse10001    |


