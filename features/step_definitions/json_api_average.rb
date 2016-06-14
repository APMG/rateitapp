Given(/^a set of ratings for one song$/) do
  # REFACTOR: Move to helper, and create a song_rating factory.
  create :rating, rating: 5, ratee_type: 'jukebox_song', ratee_id: 4
  create :rating, rating: 5, ratee_type: 'jukebox_song', ratee_id: 4
  create :rating, rating: 3, ratee_type: 'jukebox_song', ratee_id: 4
  create :rating, rating: 2, ratee_type: 'jukebox_song', ratee_id: 4
  create :rating, rating: 4, ratee_type: 'jukebox_song', ratee_id: 4
  create :rating, rating: 1, ratee_type: 'jukebox_song', ratee_id: 4
end

When(/^I ask for that song's average rating$/) do
  visit '/api/v1/ratees/jukebox_song/4'
end

Then(/^I should get that song's average rating$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^a set of ratings for several songs$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I ask for those song's average ratings$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should get those song's average ratings$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
