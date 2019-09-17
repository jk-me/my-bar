Rails.application.routes.draw do

  root 'application#root'
  get '/logout', to: 'users#logout', as: 'logout'
  get '/auth/facebook/callback', to: 'sessions#fbcreate'
  get '/current_id' => "application#current_id"

  resources :users do
    resources :reviews, only:[:index]
    resources :drinks, only:[:show]
  end
  resources :drinks do
    resources :reviews, only: [:new]
  end

  resources :ingredients, only: [:index, :show, :edit, :update] do
    resources :drinks, only:[:show]
  end
  resources :reviews
  resources :sessions, only: [:new,:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
