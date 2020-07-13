Rails.application.routes.draw do
  resources :users do
    resources :expeditions do
      resources :harvests
    end
    #get "/users/:user_id/items/sort_by_name", to: "items#sort_by_name"
    resources :items do
      resources :harvests
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
