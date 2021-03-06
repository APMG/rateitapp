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
    Given a valid access token
      And a song plugin
    When I post a rating to the API
    Then it is saved in the database
      And it returns a creation status code

  Scenario: Attempt to save an invalid rating
    Given a valid access token
      And a song plugin
    When I post a rating to the API with an invalid type
    Then it returns an error

  Scenario: Update an existing rating
    Given a valid access token
      And a song plugin
      And an existing rating
    When I post that same rating to the API
    Then I get the rating back in the response
      And the existing record is updated in the database

  Scenario: Delete an existing rating
    Given a valid access token
      And an existing rating
    When I DELETE that rating
    Then I am told that the rating is deleted
      And it is no longer in the database

  Scenario: Attempt to delete a non-existent rating
    Given a valid access token
    When I DELETE that rating
    Then I get a 404

  Scenario: Return error on invalid rating
    Given a valid access token
    When I post an invalid rating to the API
    Then I get an invalid rating error
      And there is nothing in the database

  Scenario: Fetch one rating for a user
    Given a valid access token
      And an existing rating
    When I request a user's rating for that song
    Then I get the rating information for that song

  @allow-rescue
  Scenario: Fetch one rating for a user with an invalid access token
    Given an invalid access token
      And an existing rating
    When I request a user's rating for that song
    Then I get an access denied error message

  Scenario: Fetch several ratings for a user
    Given a valid access token
      And several existing ratings
    When I request a user's ratings for those songs
    Then I get the rating information for those songs

  Scenario: Fetch all ratings for a ratable type
    Given a valid access token
      And a set of ratings for several ratable types
    When I request all of a user's ratings from a ratable type
    Then I get the ratings information for that ratable type

  Scenario: Paginate all of a user's ratings
    Given a valid access token
      And 300 ratings
    When I ask for too many ratings
    Then I get the default number of ratings back
