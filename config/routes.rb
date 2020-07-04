Rails.application.routes.draw do
  resources :harvests
  resources :items
  resources :users do
    resources :expeditions do
      resources :harvests
    end
    resources :items do
      resources :harvests, only: [:show]
    end
  end
  resources :expeditions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
