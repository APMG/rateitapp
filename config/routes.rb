# frozen_string_literal: true
Rateitapp::Engine.routes.draw do
  # Authenticated
  resources :users, only: [:show], defaults: { format: :json } do
    get '/ratings/:ratable_type' => 'ratings#index'
    get '/ratings/:ratable_type/:ratable_id' => 'ratings#show'
    delete '/ratings/:ratable_type/:ratable_id' => 'ratings#destroy'
    post '/ratings' => 'ratings#create'
  end

  # Unauthenticated
  get '/ratables/:ratable_type/:ratable_id' => 'ratables#show', defaults: { format: :json }
end

# show GET info about the user (avg, count): /users/1
# index GET all ratings by user: /users/1/ratings
# create POST a rating by user: /users/1/ratings
# index GET all ratings by user and ratable_type: /users/1/ratings/song
# show GET a rating by user and ratable_type: /users/1/ratings/song/1
# show GET several ratings by user and ratable_type: /users/1/ratings/song/1,2,3
# show GET a ratable summary: /ratables/song/1
# show GET a ratable summary: /ratables/song/1,2,3
