Rails.application.routes.draw do
  # Other routes...

  # Set the root route to the index action of MoviesController
  root 'movies#index'

  resources :movies do
    collection do
      get 'sort'
    end
  end  
end
