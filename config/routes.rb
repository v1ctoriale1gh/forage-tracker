Rails.application.routes.draw do
  root "sessions#new"
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

  get    '/login'                => 'sessions#new'
  #get '/google_signup', to: redirect('/auth/google_oauth2'), as: 'google_signup'
  get '/auth/:provider/callback', to: 'sessions#create'
  #post   '/sessions'             => 'sessions#create'
  delete '/logout'               => 'sessions#destroy'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
