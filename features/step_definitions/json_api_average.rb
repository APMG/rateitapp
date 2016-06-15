Given(/^a set of ratings for one song$/) do
  6.times { |i| create :song_rating, rating: i+1, ratee_id: 4 }
end

When(/^I ask for that song's average rating$/) do
  visit '/api/v1/ratees/jukebox_song/4'
end

Then(/^I should get that song's average rating$/) do
  json = JSON.parse(page.body)
  expect(json.first['average']).to eq '3.5'
end

Given(/^a set of ratings for several songs$/) do
  6.times { |i| create :song_rating, rating: i+1, ratee_id: 1 }
  6.times { |i| create :song_rating, rating: i+1, ratee_id: 2 }
  6.times { |i| create :song_rating, rating: i+1, ratee_id: 3 }
end

When(/^I ask for those song's average ratings$/) do
  visit '/api/v1/ratees/jukebox_song/1,2,3'
end

Then(/^I should get those song's average ratings$/) do
  json = JSON.parse(page.body)
  json.each do |item|
    expect(item['average']).to eq '3.5'
  end
end

Given(/^I post a rating to the API$/) do
  post '/api/v1/ratings', rating: 4, ratee_type: 'jukebox_song', ratee_id: 47, user_id: 2
end

Then(/^it is saved in the database$/) do
  rating = Rateitapp::Rating.first

  expect(rating).to_not be_nil
  expect(rating.rating).to eq 4
  expect(rating.ratee_id).to eq '47'
end

Given(/^an existing rating$/) do
  create :song_rating, rating: 5, ratee_id: 11, user_id: 2
end

When(/^I post that same rating to the API$/) do
  post '/api/v1/ratings', rating: 2, ratee_type: 'jukebox_song', ratee_id: 11, user_id: 2
end

Then(/^the existing record is updated in the database$/) do
  rating = Rateitapp::Rating.first

  expect(Rateitapp::Rating.count).to eq 1
  expect(rating).to_not be_nil
  expect(rating.rating).to eq 2
  expect(rating.ratee_id).to eq '11'
end
