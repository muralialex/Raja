Feature: Training Catalog

  As a CK Authenticated user
  I should be able View Training Catalog
  So that I can Register, Launch and Drop Course



  Background:
    Given Training Catalog
    
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

