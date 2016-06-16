Given(/^a set of ratings for one song$/) do
  6.times { |i| create :song_rating, value: i+1, ratable_id: 4 }
end

When(/^I ask for that song's average rating$/) do
  visit '/api/v1/ratables/jukebox_song/4'
end

Then(/^I should get that song's average rating$/) do
  json = JSON.parse(page.body)
  expect(json.first['average']).to eq '3.5'
end

Given(/^a set of ratings for several songs$/) do
  6.times { |i| create :song_rating, value: i+1, ratable_id: 1 }
  6.times { |i| create :song_rating, value: i+1, ratable_id: 2 }
  6.times { |i| create :song_rating, value: i+1, ratable_id: 3 }
end

When(/^I ask for those songs' average ratings$/) do
  visit '/api/v1/ratables/jukebox_song/1,2,3'
end

Then(/^I should get those songs' average ratings$/) do
  json = JSON.parse(page.body)
  json.each do |item|
    expect(item['average']).to eq '3.5'
  end
end

Given(/^I post a rating to the API$/) do
  post '/api/v1/ratings', value: 4, ratable_type: 'jukebox_song', ratable_id: 47, user_id: 2
end

Then(/^it is saved in the database$/) do
  rating = Rateitapp::Rating.first

  expect(rating).to_not be_nil
  expect(rating.value).to eq 4
  expect(rating.ratable_id).to eq '47'
end

Given(/^an existing rating$/) do
  create :song_rating, value: 5, ratable_id: 11, user_id: 2
end

When(/^I post that same rating to the API$/) do
  post '/api/v1/ratings', value: 2, ratable_type: 'jukebox_song', ratable_id: 11, user_id: 2
end

Then(/^the existing record is updated in the database$/) do
  rating = Rateitapp::Rating.first

  expect(Rateitapp::Rating.count).to eq 1
  expect(rating).to_not be_nil
  expect(rating.value).to eq 2
  expect(rating.ratable_id).to eq '11'
end

When(/^I request a user's rating for that song$/) do
  visit '/users/2/ratings/jukebox_song/11'
end

Then(/^I get the rating information for that song$/) do
  json = JSON.parse(page.body)

  expect(json.first['value']).to eq 5
  expect(json.first['ratable_type']).to eq 'jukebox_song'
  expect(json.first['ratable_id']).to eq '11'
  expect(json.first['user_id']).to eq 2
end

Given(/^several existing ratings$/) do
  3.times { |i| create :song_rating, value: 3, ratable_id: i+1, user_id: 2 }
end

When(/^I request a user's ratings for those songs$/) do
  visit '/users/2/ratings/jukebox_song/1,2,3'
end

Then(/^I get the rating information for those songs$/) do
  json = JSON.parse(page.body)
  json.each do |item|
    expect(item['value']).to eq 3
    expect(item['ratable_type']).to eq 'jukebox_song'
    expect(item['user_id']).to eq 2
  end
end
