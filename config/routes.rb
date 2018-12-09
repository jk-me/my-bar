Rails.application.routes.draw do

  root 'application#root'
  get '/logout', to: 'users#logout', as: 'logout'
  resources :users do
    resources :reviews, only:[:index]
  end
  resources :ingredients, only: [:index, :show]
  resources :reviews
  resources :drinks do
    resources :reviews, only: [:new]
  end
  resources :sessions, only: [:new,:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
