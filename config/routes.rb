Rails.application.routes.draw do
  resources :movies do
    collection do
      get 'sort'
    end
  end  
end
