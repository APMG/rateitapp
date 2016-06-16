# frozen_string_literal: true
Given(/^a set of ratings for one song$/) do
  6.times { create :rating, ratable_type: 'jukebox_song', ratable_id: 11 }
end

Given(/^a set of ratings for several songs$/) do
  6.times { |i| create :song_rating, value: i + 1, ratable_id: 1 }
  6.times { |i| create :song_rating, value: i + 1, ratable_id: 2 }
  6.times { |i| create :song_rating, value: i + 1, ratable_id: 3 }
end

Given(/^I post a rating to the API$/) do
  post '/users/2/ratings', value: 4, ratable_type: 'jukebox_song', ratable_id: 47, user_id: 2
end

Given(/^an existing rating$/) do
  create :song_rating, value: 5, ratable_id: 11, user_id: 2
end

Given(/^several existing ratings$/) do
  3.times { |i| create :song_rating, value: 3, ratable_id: i + 1, user_id: 2 }
end

Given(/^a set of ratings for several ratable types$/) do
  3.times do |i|
    4.times { create :rating, ratable_type: "thing_type_#{i}", user_id: 2 }
  end
end

When(/^I ask for the composite rating for that song$/) do
  visit '/ratables/jukebox_song/11'
end

When(/^I ask for those songs' ratings$/) do
  visit '/ratables/jukebox_song/1,2,3'
end

When(/^I post that same rating to the API$/) do
  post '/users/2/ratings', value: 2, ratable_type: 'jukebox_song', ratable_id: 11, user_id: 2
end

When(/^I post an invalid rating to the API$/) do
  post '/users/2/ratings', value: 2, ratable_type: '', ratable_id: 11, user_id: 2
end

When(/^I request a user's rating for that song$/) do
  visit '/users/2/ratings/jukebox_song/11'
end

When(/^I request a user's ratings for those songs$/) do
  visit '/users/2/ratings/jukebox_song/1,2,3'
end

When(/^I request all of a user's ratings from a ratable type$/) do
  visit '/users/2/ratings/thing_type_2'
end

Then(/^I should get that song's rating information$/) do
  json = JSON.parse(page.body)
  expect(json.first['average']).to eq 3.0
  expect(json.first['count']).to eq 6
end

Then(/^I should get those songs' ratings information$/) do
  json = JSON.parse(page.body)
  json.each do |item|
    expect(item['average']).to eq 3.5
    expect(item['count']).to eq 6
  end
end

Then(/^it is saved in the database$/) do
  rating = Rateitapp::Rating.first

  expect(rating).to_not be_nil
  expect(rating.value).to eq 4
  expect(rating.ratable_id).to eq '47'
end

Then(/^the existing record is updated in the database$/) do
  rating = Rateitapp::Rating.first

  expect(Rateitapp::Rating.count).to eq 1
  expect(rating).to_not be_nil
  expect(rating.value).to eq 2
  expect(rating.ratable_id).to eq '11'
end

Then(/^there is nothing in the database$/) do
  expect(Rateitapp::Rating.count).to eq 0
end

Then(/^I get an invalid rating error$/) do
  json = JSON.parse(last_response.body)

  expect(json['error']).to eq true
end

Then(/^I get the rating information for that song$/) do
  json = JSON.parse(page.body)

  expect(json.first['value']).to eq 5
  expect(json.first['ratable_type']).to eq 'jukebox_song'
  expect(json.first['ratable_id']).to eq '11'
  expect(json.first['user_id']).to eq 2
end

Then(/^I get the rating information for those songs$/) do
  json = JSON.parse(page.body)
  json.each do |item|
    expect(item['value']).to eq 3
    expect(item['ratable_type']).to eq 'jukebox_song'
    expect(item['user_id']).to eq 2
  end
end

Then(/^I get the ratings information for that ratable type$/) do
  json = JSON.parse(page.body)

  expect(json.count).to eq 4
  expect(json.first['ratable_type']).to eq 'thing_type_2'
  expect(json.first['user_id']).to eq 2
end
