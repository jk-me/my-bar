Rails.application.routes.draw do

  root 'application#root'
  get '/logout', to: 'users#logout', as: 'logout'
  get '/auth/facebook/callack', to: 'sessions#fbcreate'

  resources :users do
    resources :reviews, only:[:index]
  end
  resources :drinks do
    resources :reviews, only: [:new]
  end

  resources :ingredients, only: [:index, :show]
  resources :reviews
  resources :sessions, only: [:new,:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
