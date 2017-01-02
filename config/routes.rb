Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]

  root to: 'sessions#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :admin do
    resources :users, only: [:index, :destroy]
    resources :categories, only: [:index, :new, :create, :destroy]
  end
end
