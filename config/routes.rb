Rateitapp::Engine.routes.draw do
  get '/api/v1/ratees/:ratee_type/:ratee_id' => 'ratees#show', defaults: { format: :json }
  # get '/api/v1/users/:user_id/:ratee_type' => 'user_ratings#index', defaults: { format: :json }
  # get '/api/v1/users/:user_id/:ratee_type/:ratee_id' => 'user_ratings#show', defaults: { format: :json }
end
