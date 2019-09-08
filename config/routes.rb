Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  root 'static_pages#home'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  resources :users, except: :new do
    member do
      get :following, :followers
    end
  end
  resources :sessions, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
end
