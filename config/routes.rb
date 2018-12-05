Rails.application.routes.draw do
  resources :users
  resources :ingredients
  resources :reviews
  resources :drinks
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
