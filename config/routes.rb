Rateitapp::Engine.routes.draw do
  get '/api/v1/ratables/:ratable_type/:ratable_id' => 'ratables#show', defaults: { format: :json }
  # get '/api/v1/users/:user_id/:ratable_type' => 'user_ratings#index', defaults: { format: :json }
  # get '/api/v1/users/:user_id/:ratable_type/:ratable_id' => 'user_ratings#show', defaults: { format: :json }
  post '/api/v1/ratings' => 'ratings#create', defaults: { format: :json }
end
