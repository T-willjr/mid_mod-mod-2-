Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :studio, only: [:index]
  resources :movie
  post "/movie/:id", to: "movie#create"
end
