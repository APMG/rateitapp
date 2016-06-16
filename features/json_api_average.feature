Feature: JSON API Averages

  Scenario: Fetch one average
    Given a set of ratings for one song
    When I ask for that song's average rating
    Then I should get that song's average rating

  Scenario: Fetch several averages
    Given a set of ratings for several songs
    When I ask for those songs' average ratings
    Then I should get those songs' average ratings

  Scenario: Save a new rating
    When I post a rating to the API
    Then it is saved in the database

  Scenario: Update an existing rating
    Given an existing rating
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
