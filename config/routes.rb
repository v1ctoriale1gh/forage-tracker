Rails.application.routes.draw do
  root "sessions#new"
  
  get    '/login', to: 'sessions#new'
  get '/auth/:provider/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users do
    get "items_by_location", to: "items#items_by_location"
    get "items_by_name", to: "items#items_by_name"
    resources :expeditions do
      resources :harvests
    end
    
    
    resources :items do
      resources :harvests
    end
  end

  resources :items, only: [:show]




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
