Feature: JSON API Averages

  Scenario: Fetch rating for one song
    Given a set of ratings for one song
    When I ask for the composite rating for that song
    Then I should get that song's rating information

  Scenario: Fetch ratings for several songs
    Given a set of ratings for several songs
    When I ask for those songs' ratings
    Then I should get those songs' ratings information

  Scenario: Save a new rating
    Given a song plugin
    When I post a rating to the API
    Then it is saved in the database

  Scenario: Attempt to save an invalid rating
    Given a song plugin
    When I post a rating to the API with an invalid type
    Then it returns an error

  Scenario: Update an existing rating
    Given a song plugin
      And an existing rating
    When I post that same rating to the API
    Then the existing record is updated in the database

  Scenario: Return error on invalid rating
    When I post an invalid rating to the API
    Then I get an invalid rating error
      And there is nothing in the database

  Scenario: Fetch one rating for a user
    Given an existing rating
    When I request a user's rating for that song
    Then I get the rating information for that song

  Scenario: Fetch several ratings for a user
    Given several existing ratings
    When I request a user's ratings for those songs
    Then I get the rating information for those songs

  Scenario: Fetch all ratings for a ratable type
    Given a set of ratings for several ratable types
    When I request all of a user's ratings from a ratable type
    Then I get the ratings information for that ratable type
