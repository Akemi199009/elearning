Rails.application.routes.draw do
  root 'static_pages#home'
  get 'relationships/create'
  get 'relationships/destroy'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  resources :users, except: :new do
    member do
      get :following, :followers
    end
  end
  
  namespace :admin do
    resources :users
    resources :categories
  end

  resources :categories
  resources :sessions, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
end
