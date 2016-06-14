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
