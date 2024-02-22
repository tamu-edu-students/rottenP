Rails.application.routes.draw do
  # Other routes...

  # Set the root route to the index action of MoviesController
  root 'movies#index'
  post '/movies', to: 'movies#create'
  post '/movies', to: 'movies#update'
  resources :movies do
    collection do
      get 'sort'
    end
  end  
end
