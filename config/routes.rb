Rateitapp::Engine.routes.draw do
  get 'ratees/show'

  get '/api/v1/ratees/:ratee_type/:ratee_id' => 'ratees#show'
  # get '/api/v1/users/:user_id/:ratee_type' => 'user_ratings#index'
  # get '/api/v1/users/:user_id/:ratee_type/:ratee_id' => 'user_ratings#show'
end
