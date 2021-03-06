# frozen_string_literal: true

BEARER_TOKEN = '3123123123123123123123123123123123123123'

def set_authorization_header
  header 'Authorization', "Bearer #{BEARER_TOKEN}"
end

Given(/^a valid access token$/) do
  stub_request(:get, 'https://provider.example.com/oauth/token/info')
    .with(headers: {
            'Authorization': "Bearer #{BEARER_TOKEN}",
            'Host': 'provider.example.com'
          })
    .to_return(status: 200,
               body: {
                 'uid': '123456',
                 'role': 'admin',
                 'expires_at': "\u0004\bI\"\u001e2032-12-18 12:31:19 -0600\u0006:\rencoding\"\u000fISO-8859-1"
               }.to_json,
               headers: {})
end

Given(/^an invalid access token$/) do
  stub_request(:get, 'https://provider.example.com/oauth/token/info')
    .with(headers: {
            'Authorization': "Bearer #{BEARER_TOKEN}",
            'Host': 'provider.example.com'
          })
    .to_return(status: 401, body: {}.to_json, headers: {})
end

Given(/^a song plugin$/) do
  song_plugin = SuccessPlugin.new
  Rateitapp.plugin_manager.add song_plugin
end

Given(/^a set of ratings for one song$/) do
  6.times { create :rating, ratable_type: 'song', ratable_id: 11 }
end

Given(/^a set of ratings for several songs$/) do
  4.times { |i| create :song_rating, value: i + 1, ratable_id: 1 }
  4.times { |i| create :song_rating, value: i + 1, ratable_id: 2 }
  4.times { |i| create :song_rating, value: i + 1, ratable_id: 3 }
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

Given(/^300 ratings$/) do
  300.times { create :song_rating, value: 3, user_id: 2 }
end

When(/^I DELETE that rating$/) do
  set_authorization_header
  delete '/users/2/ratings/song/11'
end

When(/^I ask for the composite rating for that song$/) do
  get '/ratables/song/11'
end

When(/^I ask for those songs' ratings$/) do
  get '/ratables/song/1,2,3'
end

When(/^I post a rating to the API$/) do
  set_authorization_header
  post '/users/2/ratings', value: 4, ratable_type: 'song', ratable_id: 47
end

When(/^I post that same rating to the API$/) do
  set_authorization_header
  post '/users/2/ratings', value: 2, ratable_type: 'song', ratable_id: 11
end

When(/^I post an invalid rating to the API$/) do
  set_authorization_header
  post '/users/2/ratings', value: 2, ratable_type: '', ratable_id: 11
end

When(/^I request a user's rating for that song$/) do
  set_authorization_header
  get '/users/2/ratings/song/11'
end

When(/^I request a user's ratings for those songs$/) do
  set_authorization_header
  get '/users/2/ratings/song/1,2,3'
end

When(/^I request all of a user's ratings from a ratable type$/) do
  set_authorization_header
  get '/users/2/ratings/thing_type_2'
end

When(/^I post a rating to the API with an invalid type$/) do
  set_authorization_header
  post '/users/2/ratings', value: 4, ratable_type: 'not_a_song', ratable_id: 47
end

When(/^I ask for too many ratings$/) do
  set_authorization_header
  get '/users/2/ratings/song?per_page=275'
end

Then(/^I am told that the rating is deleted$/) do
  expect(last_response.status).to eq 204
end

Then(/^it is no longer in the database$/) do
  expect(Rateitapp::Rating).to_not be_any
end

Then(/^I get a 404$/) do
  expect(last_response.status).to eq 404
end

Then(/^I get an access denied error message$/) do
  expect(last_response.status).to eq 500
  expect(last_response.body).to match(/InvalidOauthToken/)
end

Then(/^I should get that song's rating information$/) do
  json = JSON.parse(last_response.body)['data']

  expect(json.first['attributes']['average']).to eq 3.0
  expect(json.first['attributes']['count']).to eq 6
end

Then(/^I should get those songs' ratings information$/) do
  json = JSON.parse(last_response.body)['data']

  expect(json.count).to eq 3
  json.each do |item|
    expect(item['attributes']['average']).to eq 2.5
    expect(item['attributes']['count']).to eq 4
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

  expect(json['errors']).to include('source' => { 'pointer' => '/data/attributes/ratable-type' }, 'detail' => 'is not recognized')
  expect(json['errors'].size).to eq 1
end

Then(/^it returns a creation status code$/) do
  expect(last_response.status).to eq 201
end

Then(/^I get the rating back in the response$/) do
  json = JSON.parse(last_response.body)['data']

  expect(json['attributes']['value']).to eq 2
  expect(json['attributes']['ratable-type']).to eq 'song'
  expect(json['attributes']['ratable-id']).to eq '11'
  expect(json['attributes']['user-id']).to eq '2'
end

Then(/^I get the rating information for that song$/) do
  json = JSON.parse(last_response.body)['data']

  expect(json.first['attributes']['value']).to eq 5
  expect(json.first['attributes']['ratable-type']).to eq 'song'
  expect(json.first['attributes']['ratable-id']).to eq '11'
  expect(json.first['attributes']['user-id']).to eq '2'
end

Then(/^I get the rating information for those songs$/) do
  json = JSON.parse(last_response.body)['data']

  expect(json.count).to eq 3
  json.each do |item|
    expect(item['attributes']['value']).to eq 3
    expect(item['attributes']['ratable-type']).to eq 'song'
    expect(item['attributes']['user-id']).to eq '2'
  end
end

Then(/^I get the ratings information for that ratable type$/) do
  json = JSON.parse(last_response.body)['data']

  expect(json.count).to eq 4
  expect(json.first['attributes']['ratable-type']).to eq 'thing_type_2'
  expect(json.first['attributes']['user-id']).to eq '2'
end

Then(/^it returns an error$/) do
  json = JSON.parse(last_response.body)

  expect(last_response.status).to eq 400
  expect(json['errors']).to include('source' => { 'pointer' => '/data/attributes/ratable-type' }, 'detail' => 'is not recognized')
  expect(json['errors'].size).to eq 1
end

Then(/^I get the default number of ratings back$/) do
  json = JSON.parse(last_response.body)['data']
  expect(json.count).to eq 250
end
