Feature: JSON API Averages

  Scenario: Fetch one average
    Given a set of ratings for one song
    When I ask for that song's average rating
    Then I should get that song's average rating

  Scenario: Fetch several averages
    Given a set of ratings for several songs
    When I ask for those song's average ratings
    Then I should get those song's average ratings
