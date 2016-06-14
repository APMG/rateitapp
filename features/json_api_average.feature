Feature: JSON API Averages

  Scenario: Fetch one average
    Given a set of ratings for one song
    When I ask for that song's average rating
    Then I should get that song's average rating

  Scenario: Fetch several averages
    Given a set of ratings for several songs
    When I ask for those song's average ratings
    Then I should get those song's average ratings

  Scenario: Save a new rating
    When I post a rating to the API
    Then it is saved in the database

  Scenario: Update an existing rating
    Given an existing rating
    When I post a rating to the API
    Then the existing record is updated in the database
